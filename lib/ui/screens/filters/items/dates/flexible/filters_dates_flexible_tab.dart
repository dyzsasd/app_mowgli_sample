import 'package:flutter/material.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/filters/components/filters_bottom_button.dart';
import 'package:mowgli/ui/screens/filters/components/filters_list_item.dart';
import 'package:mowgli/ui/screens/filters/items/dates/bloc/filters_dates_bloc.dart';
import 'package:mowgli/ui/screens/filters/items/dates/flexible/bloc/filters_dates_flexible_bloc.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/date_utils.dart';

class FiltersDatesTabFlexible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocCreatorWithListener<FlexibleDatesFilterBloc,
        FlexibleDatesFilterState>(
      create: (_) => FlexibleDatesFilterBloc(
          context.bloc<DatesFilterBloc>().state.dates?.flexibleDates,
          env.minJourneyDays,
          env.maxJourneyDays),
      listenWhen: (_, FlexibleDatesFilterState state) => state.isReady,
      listener: (BuildContext context, FlexibleDatesFilterState state) {
        context.bloc<DatesFilterBloc>().saveFlexibleDates(state.dates);
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Column(
                  children: <Widget>[_DaysSlider(), _DurationSlider()],
                ),
              ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return FiltersBottomButtonContainer(
                label: translations.filtersButtonApply,
                onPressed: () {
                  context.bloc<FlexibleDatesFilterBloc>().generateFilter();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DaysSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocBuilder<FlexibleDatesFilterBloc, FlexibleDatesFilterState>(
        buildWhen: (FlexibleDatesFilterState oldState,
            FlexibleDatesFilterState newState) {
      return oldState.dates.fromDate != newState.dates.fromDate ||
          oldState.dates.toDate != newState.dates.toDate;
    }, builder: (BuildContext context, FlexibleDatesFilterState state) {
      bool differentYears =
          state.dates.fromDate.year != state.dates.toDate.year;
      double divisions =
          DateUtils.diffInDays(state.maxDate, state.minDate) / 15;

      return FilterListSliderItem(
        divisions: divisions.round(),
        title: translations.travelDatesFlexibleRange,
        subtitle: translations.travelDatesFlexibleRangeSubtitle(
            startDate: (state.dates?.fromDate ?? state.minDate).formatDate(
                format: differentYears ? DateUtils.kDateWithYearFormat : null),
            endDate: (state.dates?.toDate ?? state.maxDate)
                .formatDate(format: DateUtils.kDateWithYearFormat)),
        minValue: state.minDate.millisecondsSinceEpoch,
        maxValue: state.maxDate.millisecondsSinceEpoch,
        currentMinValue: state.dates.fromDate.millisecondsSinceEpoch,
        currentMaxValue: state.dates.toDate.millisecondsSinceEpoch,
        onMinChanged: (num value) {
          context
              .bloc<FlexibleDatesFilterBloc>()
              .saveMinDateRange(DateTime.fromMillisecondsSinceEpoch(value));
        },
        onMaxChanged: (num value) {
          context
              .bloc<FlexibleDatesFilterBloc>()
              .saveMaxDateRange(DateTime.fromMillisecondsSinceEpoch(value));
        },
      );
    });
  }
}

class _DurationSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocBuilder<FlexibleDatesFilterBloc, FlexibleDatesFilterState>(
        buildWhen: (FlexibleDatesFilterState oldState,
            FlexibleDatesFilterState newState) {
      return oldState.dates.minDuration != newState.dates.minDuration ||
          oldState.dates.maxDuration != newState.dates.maxDuration;
    }, builder: (BuildContext context, FlexibleDatesFilterState state) {
      String subtitle;

      if (state.dates.maxDuration == state.maxDuration) {
        subtitle = translations.travelDatesFlexibleTripDurationSubtitleMax(
            minLength: state.dates.minDuration,
            maxLength: state.dates.maxDuration);
      } else {
        subtitle = translations.travelDatesFlexibleTripDurationSubtitle(
            minLength: state.dates.minDuration,
            maxLength: state.dates.maxDuration);
      }

      return FilterListSliderItem(
        title: translations.travelDatesFlexibleTripDuration,
        subtitle: subtitle,
        minValue: state.minDuration,
        maxValue: state.maxDuration,
        currentMinValue: state.dates.minDuration,
        currentMaxValue: state.dates.maxDuration,
        onMinChanged: (num value) {
          context.bloc<FlexibleDatesFilterBloc>().saveMinDurationRange(value);
        },
        onMaxChanged: (num value) {
          context.bloc<FlexibleDatesFilterBloc>().saveMaxDurationRange(value);
        },
      );
    });
  }
}
