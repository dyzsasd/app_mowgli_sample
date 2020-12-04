import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'request_distance.freezed.dart';
part 'request_distance.g.dart';

@freezed
abstract class RequestDistance with _$RequestDistance {
  const RequestDistance._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestDistance({@nullable int min, @nullable int max}) =
      _RequestDistance;

  factory RequestDistance.fromJson(Map<String, dynamic> json) =>
      _$RequestDistanceFromJson(json);

  static RequestDistance empty() => _RequestDistance(min: null, max: null);
}

class RequestDistanceUtils {
  const RequestDistanceUtils._();

  static RequestDistance extractDistance(SmartCacheDistance distance) {
    if (distance == null) {
      return null;
    }
    return RequestDistance(min: distance.min, max: distance.max);
  }

  static SmartCacheDistance toBestDeal(RequestDistance distance) {
    if (distance == null) {
      return null;
    }
    return SmartCacheDistance(min: distance.min, max: distance.max);
  }
}
