import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_homepage_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHomePageResponse {
  SmartCacheCity origin;
  List<SmartCacheHomePageSection> sections;
  List<SmartCacheHomePageDateRecommendation> filters;

  SmartCacheHomePageResponse({this.origin, this.sections, this.filters});

  factory SmartCacheHomePageResponse.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHomePageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHomePageResponseToJson(this);
}
