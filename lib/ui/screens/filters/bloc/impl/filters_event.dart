part of 'filters_bloc_impl.dart';

abstract class _FiltersEvent {
  const _FiltersEvent();
}

class _GenerateFilterEvent extends _FiltersEvent {
  const _GenerateFilterEvent();
}

class _ClearFilterEvent extends _FiltersEvent {
  const _ClearFilterEvent();
}

class _UpdateDatesFilterEvent extends _FiltersEvent {
  final DatesFilter dates;

  _UpdateDatesFilterEvent(this.dates);
}

class _UpdateStopOversFilterEvent extends _FiltersEvent {
  final StopOversFilter stopOvers;

  _UpdateStopOversFilterEvent(this.stopOvers);
}

class _UpdateFlightDurationFilterEvent extends _FiltersEvent {
  final FlightDurationFilter flightDuration;

  _UpdateFlightDurationFilterEvent(this.flightDuration);
}

class _UpdateBudgetFilterEvent extends _FiltersEvent {
  final BudgetFilter budget;

  _UpdateBudgetFilterEvent(this.budget);
}
