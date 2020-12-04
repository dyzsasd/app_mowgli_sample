import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_destination_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheDestinationResponse {
  SmartCacheOffer offer;
  List<SmartCacheRecommendationSection> sections;

  SmartCacheDestinationResponse({this.offer, this.sections});

  factory SmartCacheDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheDestinationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheDestinationResponseToJson(this);
}
