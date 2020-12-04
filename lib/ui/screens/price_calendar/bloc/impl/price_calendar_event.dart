part of 'price_calendar_bloc_impl.dart';

abstract class _PriceCalendarEvent {
  const _PriceCalendarEvent();
}

class _LoadPricesEvent extends _PriceCalendarEvent {
  const _LoadPricesEvent();
}

class _ChangeMinFlightDurationEvent extends _PriceCalendarEvent {
  final int min;

  _ChangeMinFlightDurationEvent(this.min);
}

class _ChangeMaxFlightDurationEvent extends _PriceCalendarEvent {
  final int max;

  _ChangeMaxFlightDurationEvent(this.max);
}

class _ChangeCalendarRangeEvent extends _PriceCalendarEvent {
  final DateTime minDate;
  final DateTime maxDate;
  final String dealId;

  _ChangeCalendarRangeEvent(this.minDate, this.maxDate, this.dealId);
}

class _ClearCalendarRangeEvent extends _PriceCalendarEvent {
  const _ClearCalendarRangeEvent();
}

class _GenerateFilterEvent extends _PriceCalendarEvent {
  const _GenerateFilterEvent();
}
