part of 'filters_dates_fixed_bloc_impl.dart';

abstract class _FixedDatesFilterEvent {
  const _FixedDatesFilterEvent();
}

class _UpdateFlexibleToggleEvent extends _FixedDatesFilterEvent {
  const _UpdateFlexibleToggleEvent();
}

class _UpdateRangeEvent extends _FixedDatesFilterEvent {
  DateTime min;
  DateTime max;

  _UpdateRangeEvent(this.min, this.max);
}

class _GenerateFixedDatesEvent extends _FixedDatesFilterEvent {
  const _GenerateFixedDatesEvent();
}
