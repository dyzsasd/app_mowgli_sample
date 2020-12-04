part of 'filters_dates_bloc_impl.dart';

abstract class _DatesFilterEvent {
  const _DatesFilterEvent();
}

class _SaveFixedDateEvent extends _DatesFilterEvent {
  final FixedDatesFilter value;

  _SaveFixedDateEvent(this.value);
}

class _SaveFlexibleDateEvent extends _DatesFilterEvent {
  final FlexibleDatesFilter value;

  _SaveFlexibleDateEvent(this.value);
}
