// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_destination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheDestinationResponse _$SmartCacheDestinationResponseFromJson(
    Map<String, dynamic> json) {
  return SmartCacheDestinationResponse(
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

Map<String, dynamic> _$SmartCacheDestinationResponseToJson(
    SmartCacheDestinationResponse instance) {
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
