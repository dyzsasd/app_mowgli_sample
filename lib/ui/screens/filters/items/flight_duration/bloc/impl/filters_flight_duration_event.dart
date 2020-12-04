part of 'filters_flight_duration_bloc_impl.dart';

abstract class _FlightDurationFilterEvent {
  const _FlightDurationFilterEvent();
}

class _MinFlightDurationChangedEvent extends _FlightDurationFilterEvent {
  final int value;

  _MinFlightDurationChangedEvent(this.value);
}

class _MaxFlightDurationChangedEvent extends _FlightDurationFilterEvent {
  final int value;

  _MaxFlightDurationChangedEvent(this.value);
}

class _GenerateFilterEvent extends _FlightDurationFilterEvent {
  const _GenerateFilterEvent();
}
