import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';

part 'filters_flight_duration.freezed.dart';
part 'filters_flight_duration.g.dart';

@freezed
abstract class FlightDurationFilter with _$FlightDurationFilter {
  const FlightDurationFilter._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory FlightDurationFilter({@Default(0) int minTime, int maxTime}) =
      _FlightDurationFilter;

  factory FlightDurationFilter.fromJson(Map<String, dynamic> json) =>
      _$FlightDurationFilterFromJson(json);
}

class FlightDurationFilterUtils {
  const FlightDurationFilterUtils._();

  static FlightDurationFilter extractFlightDuration(
      SmartCacheBestDealRequest request) {
    if (request.hopDuration?.max == null) {
      return null;
    }

    return FlightDurationFilter(
        minTime: (request.hopDuration.min ?? 0) ~/ 60,
        maxTime: request.hopDuration.max ~/ 60);
  }
}
