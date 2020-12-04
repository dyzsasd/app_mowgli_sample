// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_offer_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheOfferDetailResponse _$SmartCacheOfferDetailResponseFromJson(
    Map<String, dynamic> json) {
  return SmartCacheOfferDetailResponse(
    offer: json['offer'] == null
        ? null
        : SmartCacheOffer.fromJson(json['offer'] as Map<String, dynamic>),
    sections: (json['sections'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheRecommendationSection.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmartCacheOfferDetailResponseToJson(
    SmartCacheOfferDetailResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('offer', instance.offer?.toJson());
  writeNotNull(
      'sections', instance.sections?.map((e) => e?.toJson())?.toList());
  return val;
}
