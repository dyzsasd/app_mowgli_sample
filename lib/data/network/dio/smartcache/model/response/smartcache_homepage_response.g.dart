// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_homepage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheHomePageResponse _$SmartCacheHomePageResponseFromJson(
    Map<String, dynamic> json) {
  return SmartCacheHomePageResponse(
    origin: json['origin'] == null
        ? null
        : SmartCacheCity.fromJson(json['origin'] as Map<String, dynamic>),
    sections: (json['sections'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheHomePageSection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    filters: (json['filters'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheHomePageDateRecommendation.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmartCacheHomePageResponseToJson(
    SmartCacheHomePageResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull(
      'sections', instance.sections?.map((e) => e?.toJson())?.toList());
  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  return val;
}
