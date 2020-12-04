import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters_dates.dart';
import 'package:mowgli/ui/utils/object_utils.dart';
import 'package:mowgli/utils/date_utils.dart';

part 'request_date.freezed.dart';
part 'request_date.g.dart';

@freezed
abstract class RequestDate with _$RequestDate {
  const RequestDate._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestDate(
      {@nullable DateTime date,
      @nullable DateTime flexibleDatesMin,
      @nullable DateTime flexibleDatesMax,
      @Default(true) bool flexibleFixedDates}) = _RequestDate;

  factory RequestDate.fromJson(Map<String, dynamic> json) =>
      _$RequestDateFromJson(json);

  static RequestDate empty() => _RequestDate(
      date: null,
      flexibleDatesMin: null,
      flexibleDatesMax: null,
      flexibleFixedDates: false);

  bool get hasFlexibleDates =>
      flexibleDatesMin != null && flexibleDatesMax != null;

  bool get isEmpty =>
      date == null && flexibleDatesMin == null && flexibleDatesMax == null;
}

class RequestDateUtils {
  const RequestDateUtils._();

  static RequestDate dateFromHopDateAndTime(
      SmartCacheHopDate date, SmartCacheHopTime time) {
    if (date == null && time == null ||
        date.flexibleDate?.type == SmartCacheFlexibleDateType.open) {
      return null;
    }

    if (date.flexibleDate != null) {
      return RequestDate(
          flexibleDatesMin: date.flexibleDate.min,
          flexibleDatesMax: date.flexibleDate.max);
    } else if (date.fixedDate != null) {
      return RequestDate(
          date: time?.time != null
              ? ObjectUtils.extract(date.fixedDate.date,
                  (DateTime date) => DateUtils.merge(date, time?.time))
              : date.fixedDate.date,
          flexibleFixedDates: date.fixedDate.plusMinus != null);
    } else {
      return null;
    }
  }

  static RequestDate outboundDateFromFilters(DatesFilter filters) {
    if (filters?.fixedDates != null && filters?.fixedDates?.flexible == true) {
      return RequestDate(date: filters.fixedDates.fromDate);
    } else if (filters?.fixedDates != null) {
      return RequestDate(
          date: filters.fixedDates.fromDate, flexibleFixedDates: false);
    } else if (filters?.flexibleDates != null) {
      return RequestDate(
        flexibleDatesMin: filters.flexibleDates.fromDate,
        flexibleDatesMax: filters.flexibleDates.toDate,
      );
    } else {
      return null;
    }
  }

  static RequestDate inboundDateFromFilters(DatesFilter filters) {
    if (filters?.fixedDates != null && filters?.fixedDates?.flexible == true) {
      return RequestDate(date: filters.fixedDates.toDate);
    } else if (filters?.fixedDates != null) {
      return RequestDate(
          date: filters.fixedDates.toDate, flexibleFixedDates: false);
    } else if (filters?.flexibleDates != null) {
      return RequestDate(
        flexibleDatesMin: filters.flexibleDates.fromDate,
        flexibleDatesMax: filters.flexibleDates.toDate,
      );
    } else {
      return null;
    }
  }

  static SmartCacheHopDate toBestDeal(
      RequestDate date, SmartCacheHopDateType type) {
    if (date == null) {
      return SmartCacheHopDate(
          flexibleDate:
              SmartCacheFlexibleDate(type: SmartCacheFlexibleDateType.open),
          type: type);
    } else if (date.isEmpty) {
      return SmartCacheHopDate(
          flexibleDate:
              SmartCacheFlexibleDate(type: SmartCacheFlexibleDateType.open),
          type: type);
    } else if (date.hasFlexibleDates) {
      return SmartCacheHopDate(
          flexibleDate: SmartCacheFlexibleDate(
              min: date.flexibleDatesMin,
              max: date.flexibleDatesMax,
              type: SmartCacheFlexibleDateType.range),
          type: type);
    } else {
      return SmartCacheHopDate(
          fixedDate: date.flexibleFixedDates
              ? SmartCacheFixedDate(date: date.date, plusMinus: 3)
              : SmartCacheFixedDate(date: date.date),
          type: type);
    }
  }

  static SmartCacheHopDate toCalendar(
      RequestDate date, DateTime minDate, SmartCacheHopDateType type) {
    if (minDate != null) {
      return SmartCacheHopDate(
          fixedDate: SmartCacheFixedDate(date: minDate), type: type);
    } else {
      return SmartCacheHopDate(
          flexibleDate:
              SmartCacheFlexibleDate(type: SmartCacheFlexibleDateType.open),
          type: type);
    }
  }
}
