import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_offer_detail_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheOfferDetailResponse {
  SmartCacheOffer offer;
  List<SmartCacheRecommendationSection> sections;

  SmartCacheOfferDetailResponse({this.offer, this.sections});

  factory SmartCacheOfferDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheOfferDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheOfferDetailResponseToJson(this);
}
