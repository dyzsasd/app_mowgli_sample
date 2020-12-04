import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/price_calendar/model/price_calendar_model.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'price_calendar_state.freezed.dart';

@freezed
abstract class PriceCalendarState with _$PriceCalendarState {
  const PriceCalendarState._();

  factory PriceCalendarState(PriceCalendarContent content) = _Data;

  factory PriceCalendarState.initial(PriceCalendarContent content) = _Initial;

  factory PriceCalendarState.loading(PriceCalendarContent content) = _Loading;

  factory PriceCalendarState.error(PriceCalendarContent content) = _Error;

  factory PriceCalendarState.ready(
      PriceCalendarContent content, Filters filters, String dealId) = _Ready;

  bool get isCalendarReady => content?.hasData == true;

  bool get isReady => this is _Ready;

  bool get isSavable => content.isSavable;

  bool get isLoading => this is _Loading;

  bool get isInitial => this is _Initial;
}
