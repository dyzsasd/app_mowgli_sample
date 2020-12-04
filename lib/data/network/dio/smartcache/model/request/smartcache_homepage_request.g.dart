// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_homepage_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheHomePageRequest _$SmartCacheHomePageRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['origin', 'locale']);
  return SmartCacheHomePageRequest(
    origin: json['origin'] == null
        ? null
        : SmartCacheRequestOrigin.fromJson(
            json['origin'] as Map<String, dynamic>),
    locale: json['locale'] as String,
    imageWidth: json['avatar_width'] as int,
  );
}

Map<String, dynamic> _$SmartCacheHomePageRequestToJson(
    SmartCacheHomePageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull('locale', instance.locale);
  writeNotNull('avatar_width', instance.imageWidth);
  return val;
}
