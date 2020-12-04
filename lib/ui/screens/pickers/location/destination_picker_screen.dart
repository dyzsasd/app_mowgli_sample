import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/back_button.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/pickers/location/bloc/impl/location_picker_bloc_impl.dart';
import 'package:mowgli/ui/screens/pickers/location/bloc/impl/location_picker_state.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:provider/provider.dart';

class DestinationPickerScreen extends StatelessWidget {
  final LocationPickerScreenArgs args;

  DestinationPickerScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    return Provider<LocationPickerScreenArgs>(
      create: (_) => args,
      child: BlocProvider<LocationPickerBloc>(
        create: (_) => LocationPickerBloc(args.filters),
        child: Scaffold(
          appBar: TransparentAppBar(
            context: context,
            leading: const MowgliCloseButton(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _LocationPickerTitle(),
                const SizedBox(height: 10.0),
                _LocationPickerSearchField(
                  initialValue: args.existingLocation?.label ??
                      args.existingLocation?.code,
                ),
                const SizedBox(height: 18.0),
                Expanded(child: _LocationPickerResults()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationPickerTitle extends StatelessWidget {
  const _LocationPickerTitle();

  @override
  Widget build(BuildContext context) {
    String text;

    if (LocationPickerScreenArgs.of(context).direction ==
        LocationDirection.from) {
      text = Translations.of(context).locationPickerLabelFrom;
    } else {
      text = Translations.of(context).locationPickerLabelTo;
    }

    return Text(
      text,
      style: TextStyle(color: AppColors.locationPickerTitle, fontSize: 17.0),
    );
  }
}

class _LocationPickerSearchField extends StatefulWidget {
  final String initialValue;

  _LocationPickerSearchField({this.initialValue});

  @override
  _LocationPickerSearchFieldState createState() =>
      _LocationPickerSearchFieldState();
}

class _LocationPickerSearchFieldState
    extends State<_LocationPickerSearchField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      context.bloc<LocationPickerBloc>().loadSuggestionsFor(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Translations translations = Translations.of(context);

    return TextField(
      controller: _controller,
      autofocus: true,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.streetAddress,
      cursorColor: color,
      style: TextStyle(
          color: AppColors.textFieldValue, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
          hintText: LocationPickerScreenArgs.of(context).direction ==
                  LocationDirection.from
              ? translations.locationPickerSearchFieldHintFrom
              : translations.locationPickerSearchFieldHintTo,
          filled: true,
          fillColor: AppColors.textFieldBackground,
          hoverColor: AppColors.textFieldBackground,
          focusColor: AppColors.textFieldBackground,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(4.0)))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _LocationPickerResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPickerBloc, LocationPickerState>(
      builder: (BuildContext context, LocationPickerState state) {
        return state.when(
            (LocationPickerSuggestions data, _, __) =>
                _LocationPickerSuggestionsList(data: data),
            initial: (_) => SizedBox.shrink(),
            empty: (_) => Text(Translations.of(context).locationPickerNoResult),
            loading: (_, LocationPickerSuggestions data) =>
                _LocationPickerSuggestionsLoading(
                  child: data != null
                      ? _LocationPickerSuggestionsList(data: data)
                      : null,
                ),
            error: (_) =>
                Text(Translations.of(context).locationPickerErrorLabel),
            ready: (_, __) => SizedBox.shrink());
      },
    );
  }
}

class _LocationPickerSuggestionsList extends StatelessWidget {
  final LocationPickerSuggestions data;

  _LocationPickerSuggestionsList({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<LocationPickerSuggestionItem> items = data.items;

    return ListView.builder(
        itemCount: data.totalCount,
        itemExtent: 35.0,
        cacheExtent: 35.0,
        itemBuilder: (BuildContext context, int position) {
          return _LocationPickerSuggestionsListItem(
            item: items[position],
            key: Key('location_suggestion_item_$position'),
          );
        });
  }
}

class _LocationPickerSuggestionsListItem extends StatelessWidget {
  final LocationPickerSuggestionItem item;

  _LocationPickerSuggestionsListItem({@required this.item, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          LocationDirection direction =
              LocationPickerScreenArgs.of(context).direction;

          if (direction == LocationDirection.from) {
            ApplicationServices.analytics.eventOriginChanged(item.code);
          } else if (direction == LocationDirection.to) {
            ApplicationServices.analytics.eventDestinationChanged(item.code);
          }

          Navigator.of(context).pop(item.toLocationItem(direction));
        },
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: <Widget>[
              Icon(_icon, color: AppColors.listItemText, size: 13.0),
              const SizedBox(width: 7.0),
              Expanded(child: Text(getText(Translations.of(context))))
            ],
          ),
        ));
  }

  IconData get _icon {
    switch (item.type) {
      case LocationType.airport:
        return AppIcons.airplane;
      case LocationType.category:
      case LocationType.continent:
        return AppIcons.earth;
      case LocationType.country:
        return AppIcons.country;
      case LocationType.city:
        return AppIcons.city;
    }

    throw Exception('Unknown type ${item.type}!');
  }

  String getText(Translations translations) {
    switch (item.type) {
      case LocationType.airport:
        return translations.locationPickerItemAirport(
            airportCode: item.code, airportName: item.name);
      case LocationType.category:
      case LocationType.continent:
        return item.name;
      case LocationType.country:
        return item.name;
      case LocationType.city:
        return translations.locationPickerItemCity(
            cityName: item.name, countryCode: item.countryName);
    }

    throw Exception('Unknown type ${item.type}!');
  }
}

class _LocationPickerSuggestionsLoading extends StatelessWidget {
  final Widget child;

  _LocationPickerSuggestionsLoading({this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (child != null) Positioned.fill(child: child),
        const Positioned.fill(
            child: ColoredBox(
                color: Color(0xAAFFFFFF),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: CircularProgressIndicator(),
                    )))),
      ],
    );
  }
}
