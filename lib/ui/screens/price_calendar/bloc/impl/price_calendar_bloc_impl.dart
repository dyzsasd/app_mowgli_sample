import 'dart:async';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_calendar_response.dart';
import 'package:mowgli/ui/screens/price_calendar/bloc/price_calendar_bloc.dart';
import 'package:mowgli/ui/screens/price_calendar/model/price_calendar_model.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'price_calendar_event.dart';

class PriceCalendarBloc
    extends BaseBloc<_PriceCalendarEvent, PriceCalendarState> {
  final Request request;
  final int minFlightDurationAllowed;
  final int maxFlightDurationAllowed;
  CancelToken _cancelToken;

  PriceCalendarBloc(
      {@required this.request,
      @required Filters filters,
      @required this.minFlightDurationAllowed,
      @required this.maxFlightDurationAllowed})
      : super(_initialState(
            filters, minFlightDurationAllowed, maxFlightDurationAllowed)) {
    dispatch(const _LoadPricesEvent());
  }

  static PriceCalendarState _initialState(Filters filters,
      int minFlightDurationAllowed, int maxFlightDurationAllowed) {
    if (filters != null) {
      return PriceCalendarState.initial(PriceCalendarContent(
        minFlightDurationAllowed: minFlightDurationAllowed,
        maxFlightDurationAllowed: maxFlightDurationAllowed,
        minFlightDurationSelected: minFlightDurationAllowed,
        maxFlightDurationSelected: maxFlightDurationAllowed,
      ));
    } else {
      return PriceCalendarState.initial(PriceCalendarContent(
        minFlightDurationAllowed: minFlightDurationAllowed,
        maxFlightDurationAllowed: maxFlightDurationAllowed,
      ));
    }
  }

  void updateMinFlightDuration(int min) {
    dispatch(_ChangeMinFlightDurationEvent(min));
  }

  void updateMaxFlightDuration(int max) {
    dispatch(_ChangeMaxFlightDurationEvent(max));
  }

  void reloadPrices() {
    dispatch(_LoadPricesEvent());
  }

  void onCalendarRangeSelected(
      DateTime minDate, DateTime maxDate, String dealId) {
    dispatch(_ChangeCalendarRangeEvent(minDate, maxDate, dealId));
  }

  void clearCalendarSelection() {
    dispatch(const _ClearCalendarRangeEvent());
  }

  void generateFiltersOverride() {
    dispatch(const _GenerateFilterEvent());
  }

  @override
  Stream<PriceCalendarState> mapEventToState(_PriceCalendarEvent event) async* {
    PriceCalendarState initialEventState = state;

    int minFlightDuration =
        state.content?.minFlightDurationSelected ?? minFlightDurationAllowed;
    int maxFlightDuration =
        state.content?.maxFlightDurationSelected ?? maxFlightDurationAllowed;

    if (event is _GenerateFilterEvent) {
      yield PriceCalendarState.ready(state.content, state.content.toFilters(),
          state.content.selectedDealId);
      return;
    } else if (event is _ClearCalendarRangeEvent) {
      yield* _onClearCalendar(
          minFlightDuration, maxFlightDuration, initialEventState);
      return;
    } else if (event is _ChangeCalendarRangeEvent) {
      yield* _onChangeCalendar(
          event, minFlightDuration, maxFlightDuration, initialEventState);
      return;
    }

    try {
      if (event is _ChangeMinFlightDurationEvent) {
        yield* _onMinFlightDurationSelected(event, maxFlightDuration);
      } else if (event is _ChangeMaxFlightDurationEvent) {
        yield* _onMaxFlightDurationSelected(event, minFlightDuration);
      } else if (event is _LoadPricesEvent) {
        yield* _onLoadPrices(
            minFlightDuration, maxFlightDuration, initialEventState);
      }
    } catch (err, trace) {
      logEvent(error: err, stackTrace: trace);
      yield PriceCalendarState.error(state.content);
    }
  }

  Stream<PriceCalendarState> _onClearCalendar(int minFlightDuration,
      int maxFlightDuration, PriceCalendarState initialEventState) async* {
    yield* _onLoadPrices(
        minFlightDuration,
        maxFlightDuration,
        PriceCalendarState(initialEventState.content.copyWith(
            minCalendarSelected: null,
            maxCalendarSelected: null,
            calendarValues: null)));
  }

  Stream<PriceCalendarState> _onChangeCalendar(
      _ChangeCalendarRangeEvent event,
      int minFlightDuration,
      int maxFlightDuration,
      PriceCalendarState initialEventState) async* {
    if (event.minDate != null && event.maxDate == null) {
      yield* _onLoadPrices(
          minFlightDuration, maxFlightDuration, initialEventState,
          minDate: event.minDate);
    } else {
      yield PriceCalendarState(state.content.copyWith(
        minCalendarSelected: event.minDate,
        maxCalendarSelected: event.maxDate,
        selectedDealId: event.dealId,
      ));
    }
  }

  Stream<PriceCalendarState> _onMinFlightDurationSelected(
      _ChangeMinFlightDurationEvent event, int maxFlightDuration) async* {
    yield state.copyWith(
      content: state.content.copyWith(
        minFlightDurationSelected:
            _recomputeMinFlightDuration(event, maxFlightDuration),
      ),
    );
  }

  Stream<PriceCalendarState> _onMaxFlightDurationSelected(
      _ChangeMaxFlightDurationEvent event, int minFlightDuration) async* {
    yield state.copyWith(
      content: state.content.copyWith(
        maxFlightDurationSelected:
            _recomputeMaxFlightDuration(event, minFlightDuration),
      ),
    );
  }

  Stream<PriceCalendarState> _onLoadPrices(int minFlightDuration,
      int maxFlightDuration, PriceCalendarState initialEventState,
      {DateTime minDate}) async* {
    yield PriceCalendarState.loading(state.content.copyWith(
      minCalendarSelected: minDate,
      maxCalendarSelected: null,
    ));

    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    SmartCacheCalendarResponse response = await ApplicationServices.network
        .getCalendar(
            request.createCalendarRequest(
                minDate: minDate,
                minFlightDurationOverride: minFlightDuration,
                maxFlightDurationOverride: maxFlightDuration),
            cancelToken: _cancelToken = CancelToken());

    PriceCalendarContent content = PriceCalendarContent(
        minFlightDurationSelected: minFlightDuration,
        minFlightDurationAllowed: minFlightDurationAllowed,
        maxFlightDurationSelected: maxFlightDuration,
        maxFlightDurationAllowed: maxFlightDurationAllowed,
        minCalendarSelected: minDate,
        calendarValues: PriceCalendarValues.fromNetwork(response));

    if (initialEventState.isInitial) {
      content = content.copyWith(
        minCalendarSelected: initialEventState.content.minCalendarSelected,
        maxCalendarSelected: initialEventState.content.maxCalendarSelected,
      );
    }

    yield PriceCalendarState(content);
  }

  int _recomputeMinFlightDuration(
      _ChangeMinFlightDurationEvent event, int currentMaxFlightDuration) {
    if (event.min >= currentMaxFlightDuration) {
      return math.max(event.min - 1, minFlightDurationAllowed);
    } else {
      return event.min;
    }
  }

  int _recomputeMaxFlightDuration(
      _ChangeMaxFlightDurationEvent event, int currentMinFlightDuration) {
    if (event.max <= currentMinFlightDuration) {
      return math.min(event.max + 1, maxFlightDurationAllowed);
    } else {
      return event.max;
    }
  }

  @override
  Future<void> close() {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    return super.close();
  }
}
