import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'filters_dates.freezed.dart';
part 'filters_dates.g.dart';

@freezed
abstract class DatesFilter with _$DatesFilter {
  const DatesFilter._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory DatesFilter(
      {FixedDatesFilter fixedDates,
      FlexibleDatesFilter flexibleDates}) = _DatesFilter;

  factory DatesFilter.fromJson(Map<String, dynamic> json) =>
      _$DatesFilterFromJson(json);
}

@freezed
abstract class FixedDatesFilter with _$FixedDatesFilter {
  const FixedDatesFilter._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory FixedDatesFilter(
      {DateTime fromDate,
      DateTime toDate,
      @Default(true) bool flexible}) = _FixedDatesFilter;

  factory FixedDatesFilter.fromJson(Map<String, dynamic> json) =>
      _$FixedDatesFilterFromJson(json);
}

@freezed
abstract class FlexibleDatesFilter with _$FlexibleDatesFilter {
  const FlexibleDatesFilter._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory FlexibleDatesFilter(
      {DateTime fromDate,
      DateTime toDate,
      int minDuration,
      int maxDuration}) = _FlexibleDatesFilter;

  factory FlexibleDatesFilter.fromJson(Map<String, dynamic> json) =>
      _$FlexibleDatesFilterFromJson(json);
}

class DatesFilterUtils {
  const DatesFilterUtils._();

  static DatesFilter extractDatesFilter(SmartCacheBestDealRequest request) {
    if (request.outboundDate?.flexibleDate != null) {
      if (request.outboundDate.flexibleDate.type ==
              SmartCacheFlexibleDateType.open ||
          request.journeyDays == null) {
        return null;
      } else {
        return DatesFilter(
          flexibleDates: FlexibleDatesFilter(
              fromDate: request.outboundDate.flexibleDate.min,
              toDate: request.inboundDate.flexibleDate.max,
              minDuration: request.journeyDays?.flexibleJourneyDays?.min,
              maxDuration: request.journeyDays?.flexibleJourneyDays?.max),
        );
      }
    } else {
      return DatesFilter(
        fixedDates: FixedDatesFilter(
            fromDate: request.outboundDate?.fixedDate?.date,
            toDate: request.inboundDate?.fixedDate?.date,
            flexible: request.outboundDate?.fixedDate?.plusMinus != null
                ? true
                : false),
      );
    }
  }
}
