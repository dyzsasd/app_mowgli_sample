part of 'filters_dates_flexible_bloc_impl.dart';

abstract class _FlexibleDatesFilterEvent {
  const _FlexibleDatesFilterEvent();
}

class _SaveMinDateRangeEvent extends _FlexibleDatesFilterEvent {
  final DateTime date;

  _SaveMinDateRangeEvent(this.date);
}

class _SaveMaxDateRangeEvent extends _FlexibleDatesFilterEvent {
  final DateTime date;

  _SaveMaxDateRangeEvent(this.date);
}

class _SaveMinDurationRangeEvent extends _FlexibleDatesFilterEvent {
  final int value;

  _SaveMinDurationRangeEvent(this.value);
}

class _SaveMaxDurationRangeEvent extends _FlexibleDatesFilterEvent {
  final int value;

  _SaveMaxDurationRangeEvent(this.value);
}

class _GenerateFlexibleDatesEvent extends _FlexibleDatesFilterEvent {
  const _GenerateFlexibleDatesEvent();
}
