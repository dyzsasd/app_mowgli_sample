import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/back_button.dart';
import 'package:mowgli/ui/components/expansion_tile.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/pickers/location/bloc/impl/location_picker_bloc_impl.dart';
import 'package:mowgli/ui/screens/pickers/location/bloc/impl/location_picker_state.dart';
import 'package:mowgli/ui/screens/pickers/location/components/location_picker_bottom_button.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:provider/provider.dart';

class OriginPickerScreen extends StatelessWidget {
  final LocationPickerScreenArgs args;

  OriginPickerScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    return Provider<LocationPickerScreenArgs>(
      create: (_) => args,
      child: BlocProvider<LocationPickerBloc>(
        create: (_) => LocationPickerBloc(args.filters,
            initialLocation:
                LocationPickerSuggestionItem.city(args.existingLocation)),
        child: BlocListener<LocationPickerBloc, LocationPickerState>(
          listenWhen: (_, LocationPickerState state) =>
              state is LocationPickerReadyState,
          listener: (BuildContext context, LocationPickerState state) {
            LocationDirection direction =
                LocationPickerScreenArgs.of(context).direction;

            LocationPickerSuggestionItem location =
                (state as LocationPickerReadyState).location;

            if (location.airports?.length ==
                (state as LocationPickerReadyState).airports?.length) {
              location = location.replaceAirports(null);
            }

            if (direction == LocationDirection.from) {
              ApplicationServices.analytics
                  .eventOriginChanged(state.location.code);
            } else if (direction == LocationDirection.to) {
              ApplicationServices.analytics
                  .eventDestinationChanged(state.location.code);
            }

            Navigator.of(context).pop(location.toLocationItem(direction));
          },
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
                  BlocBuilder<LocationPickerBloc, LocationPickerState>(builder:
                      (BuildContext context, LocationPickerState state) {
                    bool isVisible = state.maybeWhen(
                        (_, __, bool showValidateButton) => showValidateButton,
                        orElse: () => false);
                    return LocationPickerBottomButtonContainer(
                      visible: isVisible,
                      bottomContainerVisible: isVisible,
                      label: Translations.of(context).filtersButtonApply,
                      onPressed: () {
                        context.bloc<LocationPickerBloc>().generateFilter();
                      },
                    );
                  }),
                ],
              ),
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
    return BlocBuilder<LocationPickerBloc, LocationPickerState>(
        builder: (BuildContext context, LocationPickerState state) {
      return TextField(
        onTap: () => context.bloc<LocationPickerBloc>().keyboardAction(true),
        onSubmitted: (_) =>
            context.bloc<LocationPickerBloc>().keyboardAction(false),
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
    });
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

    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20.0),
        itemCount: data.totalCount,
        itemBuilder: (BuildContext context, int position) {
          if (items[position].type == LocationType.city) {
            List<LocationPickerSuggestionItem> airports =
                items[position].airports?.toList();
            return CustomExpansionTile(
              listTile: _LocationPickerSuggestionsListItem(
                item: items[position],
                key: Key('location_suggestion_item_$position'),
              ),
              children: List<Widget>.generate(
                  items[position].airports?.length ?? 0,
                  (int index) => _LocationPickerSuggestionsListItem(
                        item: airports[index],
                        location: items[position],
                        key: Key('airport_suggestion_item_${position}_$index'),
                        paddingLeft: 15.0,
                        marginTop: 9.0,
                      )),
            );
          } else {
            return _LocationPickerSuggestionsListItem(
              item: items[position],
              key: Key('location_suggestion_item_$position'),
            );
          }
        });
  }
}

class _LocationPickerSuggestionsListItem extends StatelessWidget {
  final LocationPickerSuggestionItem item;
  final LocationPickerSuggestionItem location;
  final double paddingLeft;
  final double marginTop;

  _LocationPickerSuggestionsListItem(
      {@required this.item,
      this.location,
      this.paddingLeft,
      this.marginTop,
      Key key})
      : super(key: key);

  void _handleValueChange(BuildContext context, bool newValue) {
    if (item.type == LocationType.airport) {
      if (!newValue) {
        context
            .bloc<LocationPickerBloc>()
            .removeAirport(this.item, this.location);
      } else {
        context.bloc<LocationPickerBloc>().addAirport(this.item, this.location);
      }
    } else {
      if (!newValue) {
        context.bloc<LocationPickerBloc>().removeLocation(this.item);
      } else {
        context
            .bloc<LocationPickerBloc>()
            .addLocation(this.item, this.item.airports);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool valueCheckBox;
    return BlocBuilder<LocationPickerBloc, LocationPickerState>(
        builder: (BuildContext context, LocationPickerState state) {
      if (item.type == LocationType.airport) {
        if (state.location != null &&
            state.location.airports == null &&
            state.location.code == location.code) {
          valueCheckBox = true;
        } else {
          valueCheckBox = state.location?.containsAirport(item) ?? false;
        }
      } else if (item.type == LocationType.city) {
        if (state.location?.airports != null) {
          valueCheckBox = item.code == state.location.code &&
              item.airports.length == state.location.airports.length;
        } else {
          valueCheckBox = item.code == state.location?.code;
        }
      }
      return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            _handleValueChange(context, !valueCheckBox);
          },
          child: Container(
              height: 35,
              padding: EdgeInsets.only(left: paddingLeft ?? 0.0),
              margin: EdgeInsets.only(top: marginTop ?? 0.0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  children: <Widget>[
                    Icon(_icon, color: AppColors.listItemText, size: 13.0),
                    const SizedBox(width: 7.0),
                    Expanded(child: Text(getText(Translations.of(context)))),
                    Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 3.0),
                        ),
                        child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.white),
                            child: Checkbox(
                                activeColor: AppColors.white,
                                checkColor: Theme.of(context).primaryColorDark,
                                value: valueCheckBox,
                                onChanged: (newValue) {
                                  FocusScope.of(context).unfocus();
                                  _handleValueChange(context, newValue);
                                }))),
                  ],
                ),
              )));
    });
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
