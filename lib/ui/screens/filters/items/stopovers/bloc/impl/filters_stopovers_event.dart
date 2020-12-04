part of 'filters_stopovers_bloc_impl.dart';

abstract class _StopOversFilterEvent {
  const _StopOversFilterEvent();
}

class _UpdateDirectStatus extends _StopOversFilterEvent {
  final bool isChecked;

  _UpdateDirectStatus(this.isChecked);
}

class _UpdateOneStopStatus extends _StopOversFilterEvent {
  final bool isChecked;

  _UpdateOneStopStatus(this.isChecked);
}

class _UpdateMultipleStopsStatus extends _StopOversFilterEvent {
  final bool isChecked;

  _UpdateMultipleStopsStatus(this.isChecked);
}

class _GenerateFilterEvent extends _StopOversFilterEvent {
  const _GenerateFilterEvent();
}
