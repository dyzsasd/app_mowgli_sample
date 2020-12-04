import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_calendar_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/object_utils.dart';

part 'price_calendar_model.freezed.dart';

@freezed
abstract class PriceCalendarContent with _$PriceCalendarContent {
  const PriceCalendarContent._();

  factory PriceCalendarContent(
      {@required int minFlightDurationAllowed,
      @required int maxFlightDurationAllowed,
      PriceCalendarValues calendarValues,
      int minFlightDurationSelected,
      int maxFlightDurationSelected,
      DateTime minCalendarRange,
      DateTime maxCalendarRange,
      DateTime minCalendarSelected,
      DateTime maxCalendarSelected,
      String selectedDealId}) = _PriceCalendarContent;

  bool get isSavable =>
      minCalendarSelected != null &&
      maxCalendarSelected != null &&
      minFlightDurationSelected != null &&
      maxFlightDurationSelected != null;

  bool get hasCalendarSelection =>
      minCalendarSelected != null && maxCalendarSelected != null;

  bool get hasData =>
      minFlightDurationAllowed != null &&
      maxFlightDurationAllowed != null &&
      calendarValues != null;

  Filters toFilters() => Filters(
      dates: DatesFilter(
          fixedDates: FixedDatesFilter(
              fromDate: minCalendarSelected,
              toDate: maxCalendarSelected,
              flexible: false)),
      flightDuration: FlightDurationFilter(
          minTime: minFlightDurationSelected,
          maxTime: maxFlightDurationSelected));
}

class PriceCalendarValues {
  final Map<DateTime, PriceCalendarValueDate> _datesPrices;

  PriceCalendarValues.fromNetwork(SmartCacheCalendarResponse response)
      : _datesPrices = ObjectUtils.extract(response.cells,
            (List<SmartCacheCalendarCell> cells) {
          Map<DateTime, List<PriceCalendarValueItem>> tempValues =
              <DateTime, List<PriceCalendarValueItem>>{};

          for (SmartCacheCalendarCell cell in cells) {
            List<PriceCalendarValueItem> list =
                tempValues[cell.outboundDepartureDate] ??
                    <PriceCalendarValueItem>[];
            list.add(PriceCalendarValueItem._fromCell(cell));
            tempValues[cell.outboundDepartureDate] = list;
          }

          Map<DateTime, PriceCalendarValueDate> values =
              <DateTime, PriceCalendarValueDate>{};

          for (DateTime date in tempValues.keys) {
            values[date] = PriceCalendarValueDate._fromList(tempValues[date]);
          }

          return values;
        });

  PriceCalendarValueDate operator [](DateTime date) => _datesPrices[date];
}

class PriceCalendarValueDate {
  final Map<DateTime, PriceCalendarValueItem> arrivalPrices;
  final PriceCalendarValueItem minPrice;

  PriceCalendarValueDate._fromList(List<PriceCalendarValueItem> list)
      : arrivalPrices =
            ObjectUtils.extract(list, (List<PriceCalendarValueItem> list) {
          Map<DateTime, PriceCalendarValueItem> values =
              <DateTime, PriceCalendarValueItem>{};

          for (PriceCalendarValueItem item in list) {
            values[item.arrival] = item;
          }

          return values;
        }),
        minPrice = list.reduce(
            (PriceCalendarValueItem curr, PriceCalendarValueItem next) =>
                (curr.price < next.price) ? curr : next);

  PriceCalendarValueItem operator [](DateTime date) => arrivalPrices[date];
}

class PriceCalendarValueItem {
  final DateTime arrival;
  final num price;
  final PriceCalendarValueItemType type;
  final String dealId;

  PriceCalendarValueItem._fromCell(SmartCacheCalendarCell cell)
      : arrival = cell.inboundDepartureDate,
        price = cell.amount.value,
        type = ObjectUtils.extract(cell.cat, (SmartCacheAmountCatID category) {
          switch (category) {
            case SmartCacheAmountCatID.lowest:
              return PriceCalendarValueItemType.lowest;
            case SmartCacheAmountCatID.medium:
              return PriceCalendarValueItemType.medium;
            case SmartCacheAmountCatID.high:
              return PriceCalendarValueItemType.high;
            default:
              return null;
          }
        }),
        dealId = cell.offerId;
}

enum PriceCalendarValueItemType { lowest, medium, high }
