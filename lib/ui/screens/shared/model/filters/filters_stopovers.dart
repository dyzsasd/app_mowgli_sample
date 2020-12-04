import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';

part 'filters_stopovers.freezed.dart';
part 'filters_stopovers.g.dart';

@freezed
abstract class StopOversFilter with _$StopOversFilter {
  const StopOversFilter._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory StopOversFilter(
      {@Default(true) bool direct,
      @Default(true) bool one,
      @Default(true) bool many}) = _StopOversFilter;

  int get maxStopOvers {
    if (many == true) {
      return 2;
    } else if (one == true) {
      return 1;
    } else if (direct == true) {
      return 0;
    } else {
      return null;
    }
  }

  factory StopOversFilter.fromJson(Map<String, dynamic> json) =>
      _$StopOversFilterFromJson(json);
}

class StopOversFilterUtils {
  const StopOversFilterUtils._();

  static StopOversFilter extractStopOvers(SmartCacheBestDealRequest request) {
    if (request.maxStopOvers == null) {
      return null;
    }

    return StopOversFilter(
      direct: request.maxStopOvers >= 0,
      one: request.maxStopOvers >= 1,
      many: request.maxStopOvers >= 2,
    );
  }
}
