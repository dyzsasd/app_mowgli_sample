import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_best_deal_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheBestDealResponse {
  List<SmartCacheOffer> offers;
  @JsonKey(name: 'continuation_token')
  String nextRequestKey;

  SmartCacheBestDealResponse({this.offers, this.nextRequestKey});

  factory SmartCacheBestDealResponse.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheBestDealResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheBestDealResponseToJson(this);
}
