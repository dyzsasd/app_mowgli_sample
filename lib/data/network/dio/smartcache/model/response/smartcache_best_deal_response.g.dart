// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_best_deal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheBestDealResponse _$SmartCacheBestDealResponseFromJson(
    Map<String, dynamic> json) {
  return SmartCacheBestDealResponse(
    offers: (json['offers'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheOffer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextRequestKey: json['continuation_token'] as String,
  );
}

Map<String, dynamic> _$SmartCacheBestDealResponseToJson(
    SmartCacheBestDealResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('offers', instance.offers?.map((e) => e?.toJson())?.toList());
  writeNotNull('continuation_token', instance.nextRequestKey);
  return val;
}
