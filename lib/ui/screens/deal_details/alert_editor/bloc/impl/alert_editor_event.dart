part of 'alert_editor_bloc_impl.dart';

abstract class _AlertEditorEvent {
  const _AlertEditorEvent();
}

class _UpdateDatesFilterEvent extends _AlertEditorEvent {
  final DatesFilter dates;

  _UpdateDatesFilterEvent(this.dates);
}

class _UpdateStopOversFilterEvent extends _AlertEditorEvent {
  final StopOversFilter stopOvers;

  _UpdateStopOversFilterEvent(this.stopOvers);
}

class _UpdateFlightDurationFilterEvent extends _AlertEditorEvent {
  final FlightDurationFilter flightDuration;

  _UpdateFlightDurationFilterEvent(this.flightDuration);
}

class _UpdateBudgetFilterEvent extends _AlertEditorEvent {
  final BudgetFilter budget;

  _UpdateBudgetFilterEvent(this.budget);
}
