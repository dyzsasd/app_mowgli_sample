import 'dart:math' as math;

import 'package:mowgli/ui/screens/filters/items/flight_duration/bloc/impl/filters_flight_duration_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'filters_flight_duration_event.dart';

class FlightDurationFilterBloc
    extends BaseBloc<_FlightDurationFilterEvent, FlightDurationFilterState> {
  final int minTime;
  final int maxTime;

  FlightDurationFilterBloc(
      FlightDurationFilter budget, this.minTime, this.maxTime)
      : super(_initialState(budget, minTime, maxTime));

  static FlightDurationFilterState _initialState(
          FlightDurationFilter budgetFilter, int minTime, int maxTime) =>
      FlightDurationFilterState.initial(
          budgetFilter ??
              FlightDurationFilter(minTime: minTime, maxTime: maxTime),
          minTime,
          maxTime);

  void changeMinFlightDuration(int min) {
    dispatch(_MinFlightDurationChangedEvent(min));
  }

  void changeMaxFlightDuration(int max) {
    dispatch(_MaxFlightDurationChangedEvent(max));
  }

  void generateFilter() {
    dispatch(const _GenerateFilterEvent());
  }

  @override
  Stream<FlightDurationFilterState> mapEventToState(
      _FlightDurationFilterEvent event) async* {
    if (event is _MinFlightDurationChangedEvent) {
      if (event.value >= state.duration.maxTime) {
        yield FlightDurationFilterState(
            state.duration
                .copyWith(minTime: math.max(event.value - 1, minTime)),
            minTime,
            maxTime);
      } else {
        yield FlightDurationFilterState(
            state.duration.copyWith(minTime: event.value), minTime, maxTime);
      }
    } else if (event is _MaxFlightDurationChangedEvent) {
      if (event.value <= state.duration.minTime) {
        yield FlightDurationFilterState(
            state.duration
                .copyWith(maxTime: math.min(event.value + 1, maxTime)),
            minTime,
            maxTime);
      } else {
        yield FlightDurationFilterState(
            state.duration.copyWith(maxTime: event.value), minTime, maxTime);
      }
    } else if (event is _GenerateFilterEvent) {
      yield FlightDurationFilterState.ready(state.duration, minTime, maxTime);
    }
  }
}
