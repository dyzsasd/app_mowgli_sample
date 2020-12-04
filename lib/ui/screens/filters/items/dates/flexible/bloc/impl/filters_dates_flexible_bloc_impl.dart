import 'dart:math' as math;

import 'package:mowgli/ui/screens/filters/items/dates/flexible/bloc/impl/filters_dates_flexible_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/date_utils.dart';

part 'filters_dates_flexible_event.dart';

class FlexibleDatesFilterBloc
    extends BaseBloc<_FlexibleDatesFilterEvent, FlexibleDatesFilterState> {
  final int minDuration;
  final int maxDuration;
  final DateTime minDate;
  final DateTime maxDate;

  FlexibleDatesFilterBloc(
      FlexibleDatesFilter filter, this.minDuration, this.maxDuration)
      : minDate = DateTime.now(),
        maxDate = DateUtils.year(),
        super(_initialState(filter, minDuration, maxDuration));

  static FlexibleDatesFilterState _initialState(
          FlexibleDatesFilter filter, int minDuration, int maxDuration) =>
      FlexibleDatesFilterState.initial(
          dates: filter ??
              FlexibleDatesFilter(
                  fromDate: DateTime.now(),
                  toDate: DateUtils.year(),
                  minDuration: minDuration,
                  maxDuration: maxDuration),
          minDuration: minDuration,
          maxDuration: maxDuration,
          minDate: DateTime.now(),
          maxDate: DateUtils.year());

  void saveMinDateRange(DateTime minDate) {
    dispatch(_SaveMinDateRangeEvent(minDate));
  }

  void saveMaxDateRange(DateTime maxDate) {
    dispatch(_SaveMaxDateRangeEvent(maxDate));
  }

  void saveMinDurationRange(int minValue) {
    dispatch(_SaveMinDurationRangeEvent(minValue));
  }

  void saveMaxDurationRange(int maxValue) {
    dispatch(_SaveMaxDurationRangeEvent(maxValue));
  }

  void generateFilter() {
    dispatch(const _GenerateFlexibleDatesEvent());
  }

  @override
  Stream<FlexibleDatesFilterState> mapEventToState(
      _FlexibleDatesFilterEvent event) async* {
    if (event is _SaveMinDateRangeEvent) {
      yield _getStateWith(state.dates.copyWith(fromDate: event.date));
    } else if (event is _SaveMaxDateRangeEvent) {
      yield _getStateWith(state.dates.copyWith(toDate: event.date));
    } else if (event is _SaveMinDurationRangeEvent) {
      if (event.value >= state.dates.maxDuration) {
        yield _getStateWith(state.dates
            .copyWith(minDuration: math.max(event.value - 1, minDuration)));
      } else {
        yield _getStateWith(state.dates.copyWith(minDuration: event.value));
      }
    } else if (event is _SaveMaxDurationRangeEvent) {
      if (event.value <= state.dates.minDuration) {
        yield _getStateWith(state.dates
            .copyWith(maxDuration: math.min(event.value + 1, maxDuration)));
      } else {
        yield _getStateWith(state.dates.copyWith(maxDuration: event.value));
      }
    } else if (event is _GenerateFlexibleDatesEvent) {
      yield FlexibleDatesFilterState.ready(
          state.dates, minDuration, maxDuration, minDate, maxDate);
    }
  }

  FlexibleDatesFilterState _getStateWith(FlexibleDatesFilter dates) {
    return FlexibleDatesFilterState(
        dates, minDuration, maxDuration, minDate, maxDate);
  }
}
