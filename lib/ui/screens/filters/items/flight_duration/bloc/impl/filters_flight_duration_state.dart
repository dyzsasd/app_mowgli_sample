import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_flight_duration_state.freezed.dart';

@freezed
abstract class FlightDurationFilterState with _$FlightDurationFilterState {
  const FlightDurationFilterState._();

  factory FlightDurationFilterState(
          FlightDurationFilter duration, int minValue, int maxValue) =
      _FlightDurationFilter;

  factory FlightDurationFilterState.initial(
          FlightDurationFilter duration, int minValue, int maxValue) =
      _FlightDurationFilterInitial;

  factory FlightDurationFilterState.ready(
          FlightDurationFilter duration, int minValue, int maxValue) =
      _FlightDurationFilterReady;

  bool get isInitial => this is _FlightDurationFilterInitial;

  bool get isCurrent => this is _FlightDurationFilter;

  bool get isReady => this is _FlightDurationFilterReady;
}
