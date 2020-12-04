import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/filters/components/filters_bottom_button.dart';
import 'package:mowgli/ui/screens/filters/components/filters_list_item.dart';
import 'package:mowgli/ui/screens/filters/items/stopovers/bloc/filters_stopovers_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

class FiltersStopOversScreen extends StatelessWidget {
  final FiltersStopOversScreenArgs args;

  FiltersStopOversScreen(this.args);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocCreatorWithListener<StopOversFilterBloc, StopOversFilterState>(
      create: (_) => StopOversFilterBloc(args.stopOvers),
      listenWhen: (_, StopOversFilterState state) => state.isReady,
      listener: (BuildContext context, StopOversFilterState state) {
        Navigator.of(context).pop(state.filter);
      },
      child: Scaffold(
        appBar: MowgliAppBar(
          context: context,
          title: Text(translations.filtersItemStopOvers),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SeparatedListView(
                  itemBuilder: (BuildContext context, int position) {
                    if (position == 0) {
                      return _DirectItem();
                    } else if (position == 1) {
                      return _OneStopItem();
                    } else if (position == 2) {
                      return _MultipleStopsItem();
                    }

                    throw Exception('Unknown item at position $position');
                  },
                  itemCount: 3,
                  cacheExtent: kFilterListCheckableItemHeight),
            ),
            BlocBuilder<StopOversFilterBloc, StopOversFilterState>(
              builder: (BuildContext context, StopOversFilterState state) {
                return FiltersBottomButtonContainer(
                  visible: !state.isInitial,
                  label: translations.filtersButtonApply,
                  onPressed: () {
                    context.bloc<StopOversFilterBloc>().generateFilter();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class FiltersStopOversScreenArgs {
  final StopOversFilter stopOvers;

  FiltersStopOversScreenArgs(this.stopOvers);
}

class _DirectItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopOversFilterBloc, StopOversFilterState>(
      buildWhen:
          (StopOversFilterState oldState, StopOversFilterState newState) =>
              oldState.filter.direct != newState.filter.direct,
      builder: (BuildContext context, StopOversFilterState state) {
        return FilterListCheckableItem(
          label: Translations.of(context).filtersStopsItemStopOversNone,
          value: state.filter.direct,
          onChanged: (bool isChecked) {
            context.bloc<StopOversFilterBloc>().updateDirectStatus(isChecked);
          },
        );
      },
    );
  }
}

class _OneStopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopOversFilterBloc, StopOversFilterState>(
      buildWhen:
          (StopOversFilterState oldState, StopOversFilterState newState) =>
              oldState.filter.one != newState.filter.one,
      builder: (BuildContext context, StopOversFilterState state) {
        return FilterListCheckableItem(
          label: Translations.of(context).filtersStopsItemStopOversOne,
          value: state.filter.one,
          onChanged: (bool isChecked) {
            context.bloc<StopOversFilterBloc>().updateOneStopStatus(isChecked);
          },
        );
      },
    );
  }
}

class _MultipleStopsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopOversFilterBloc, StopOversFilterState>(
      buildWhen:
          (StopOversFilterState oldState, StopOversFilterState newState) =>
              oldState.filter.many != newState.filter.many,
      builder: (BuildContext context, StopOversFilterState state) {
        return FilterListCheckableItem(
          label: Translations.of(context).filtersStopsItemStopOversMultiple,
          value: state.filter.many,
          onChanged: (bool isChecked) {
            context
                .bloc<StopOversFilterBloc>()
                .updateMultipleStopsStatus(isChecked);
          },
        );
      },
    );
  }
}
