import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_homepage_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHomePageRequest {
  @JsonKey(required: true)
  SmartCacheRequestOrigin origin;
  @JsonKey(required: true)
  String locale;
  @JsonKey(name: 'avatar_width')
  int imageWidth;

  SmartCacheHomePageRequest({@required this.origin, @required this.locale, this.imageWidth});

  factory SmartCacheHomePageRequest.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHomePageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHomePageRequestToJson(this);
}
