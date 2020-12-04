import 'package:flutter/material.dart' hide Switch;
import 'package:mowgli/ui/components/calendar.dart';
import 'package:mowgli/ui/components/switch.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/filters/components/filters_bottom_button.dart';
import 'package:mowgli/ui/screens/filters/items/dates/bloc/filters_dates_bloc.dart';
import 'package:mowgli/ui/screens/filters/items/dates/fixed/bloc/filters_dates_fixed_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters_dates.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/date_utils.dart';

class FiltersDatesTabFixed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithListener<FixedDatesFilterBloc, FixedDatesFilterState>(
        create: (_) => FixedDatesFilterBloc(
            context.bloc<DatesFilterBloc>().state.dates?.fixedDates),
        listenWhen: (_, FixedDatesFilterState state) => state.isReady,
        listener: (BuildContext context, FixedDatesFilterState state) {
          context.bloc<DatesFilterBloc>().saveFixedDates(state.dates);
        },
        child: Column(
          children: <Widget>[
            Expanded(child: _FiltersDatesFixedTabs()),
            Builder(
              builder: (BuildContext context) {
                return FiltersBottomContainer(
                  verticalPadding: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: <Widget>[
                        _FiltersFlexibleToggle(),
                        Expanded(child: SizedBox()),
                        _FiltersFlexibleValidateButton()
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class _FiltersFlexibleToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixedDatesFilterBloc, FixedDatesFilterState>(
      buildWhen:
          (FixedDatesFilterState oldState, FixedDatesFilterState newState) =>
              oldState.dates?.flexible != newState.dates?.flexible,
      builder: (BuildContext context, FixedDatesFilterState state) {
        return Column(
          children: <Widget>[
            Text(
              Translations.of(context).travelDatesButtonFlexible,
              style: AppTextStyles.h2Medium,
            ),
            Switch(
              value: state.dates?.flexible ?? true,
              onChanged: (_) {
                context.bloc<FixedDatesFilterBloc>().updateFlexibleToggle();
              },
            )
          ],
        );
      },
    );
  }
}

class _FiltersFlexibleValidateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixedDatesFilterBloc, FixedDatesFilterState>(
      buildWhen:
          (FixedDatesFilterState oldState, FixedDatesFilterState newState) =>
              oldState.isSavable != newState.isSavable,
      builder: (BuildContext context, FixedDatesFilterState state) {
        return AnimatedOpacity(
          opacity: state.isSavable ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: FiltersBottomButton(
            label: Translations.of(context).filtersButtonCreate,
            onPressed: () {
              context.bloc<FixedDatesFilterBloc>().generateFilter();
            },
          ),
        );
      },
    );
  }
}

class _FiltersDatesFixedTabs extends StatefulWidget {
  @override
  _FiltersDatesFixedTabsState createState() => _FiltersDatesFixedTabsState();
}

class _FiltersDatesFixedTabsState extends State<_FiltersDatesFixedTabs>
    with SingleTickerProviderStateMixin {
  DateTime _initialMinDate;
  DateTime _initialMaxDate;

  @override
  void initState() {
    super.initState();
    FixedDatesFilter fixedDates =
        context.bloc<FixedDatesFilterBloc>().state.dates;
    _initialMinDate = fixedDates?.fromDate;
    _initialMaxDate = fixedDates?.toDate;
  }

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return SizedBox.expand(
      child: Column(
        children: <Widget>[
          ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: BlocBuilder<FixedDatesFilterBloc, FixedDatesFilterState>(
                builder: (BuildContext context, FixedDatesFilterState state) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                          child: _FiltersDatesFixedTabItem(
                        isSelected: state.dates?.fromDate == null,
                        label: state.dates?.fromDate?.formatDate() ??
                            translations.travelDatesTabDeparture,
                      )),
                      Expanded(
                          child: _FiltersDatesFixedTabItem(
                              isSelected: state.dates?.fromDate != null &&
                                  state.dates?.toDate == null,
                              label: state.dates?.toDate?.formatDate() ??
                                  translations.travelDatesTabOutward))
                    ],
                  );
                },
              )),
          Expanded(
            child: Calendar(
              initialMinDate: _initialMinDate,
              initialMaxDate: _initialMaxDate,
              onRangeSelected: (DateTime min, DateTime max) {
                context.bloc<FixedDatesFilterBloc>().updateRange(min, max);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _FiltersDatesFixedTabItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  _FiltersDatesFixedTabItem({@required this.label, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return CalendarTab(
      label: label,
      isSelected: isSelected,
    );
  }
}
