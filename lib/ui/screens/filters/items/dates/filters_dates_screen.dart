import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/segmented_control.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/filters/items/dates/bloc/filters_dates_bloc.dart';
import 'package:mowgli/ui/screens/filters/items/dates/fixed/filters_dates_fixed_tab.dart';
import 'package:mowgli/ui/screens/filters/items/dates/flexible/filters_dates_flexible_tab.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

class FiltersDatesScreen extends StatelessWidget {
  final FiltersDatesScreenArgs args;

  FiltersDatesScreen(this.args);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocCreatorWithListener<DatesFilterBloc, DatesFilterState>(
      create: (_) => DatesFilterBloc(args.dates),
      listenWhen: (_, DatesFilterState state) => state.isReady,
      listener: (BuildContext context, DatesFilterState state) {
        Navigator.of(context).pop(state.dates);
      },
      child: Scaffold(
        appBar: MowgliAppBar(
          context: context,
          title: Text(translations.filtersItemDates),
          bottomLineBorder: false,
        ),
        body: FilterDatesTabs(
          defaultTab: args.dates?.fixedDates != null
              ? _Tab.fixedDates
              : _Tab.flexibleDates,
        ),
      ),
    );
  }
}

enum _Tab { fixedDates, flexibleDates }

class FilterDatesTabs extends StatefulWidget {
  final _Tab defaultTab;

  FilterDatesTabs({@required this.defaultTab});

  @override
  _FilterDatesTabsState createState() => _FilterDatesTabsState();
}

class _FilterDatesTabsState extends State<FilterDatesTabs> {
  _Tab currentTab;

  @override
  void initState() {
    super.initState();
    currentTab = widget.defaultTab ?? _Tab.flexibleDates;
  }

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: FractionallySizedBox(
              widthFactor: 0.65,
              child: SegmentedControl<_Tab>(
                children: <_Tab, Widget>{
                  _Tab.flexibleDates: Text(translations.travelDatesTabFlexible),
                  _Tab.fixedDates: Text(translations.travelDatesTabFixed)
                },
                onValueChanged: (_Tab tab) {
                  setState(() => currentTab = tab);
                },
                groupValue: currentTab,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Visibility(
                      visible: currentTab == _Tab.flexibleDates,
                      child: FiltersDatesTabFlexible()),
                ),
                Positioned.fill(
                  child: Visibility(
                      visible: currentTab == _Tab.fixedDates,
                      child: FiltersDatesTabFixed()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FiltersDatesScreenArgs {
  final DatesFilter dates;

  FiltersDatesScreenArgs(this.dates);
}
