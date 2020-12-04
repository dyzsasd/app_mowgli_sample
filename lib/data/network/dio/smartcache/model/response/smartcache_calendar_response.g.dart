// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_calendar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheCalendarResponse _$SmartCacheCalendarResponseFromJson(
    Map<String, dynamic> json) {
  return SmartCacheCalendarResponse(
    cells: (json['calendar_cells'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheCalendarCell.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cats: (json['cats'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheAmountCat.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmartCacheCalendarResponseToJson(
    SmartCacheCalendarResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'calendar_cells', instance.cells?.map((e) => e?.toJson())?.toList());
  writeNotNull('cats', instance.cats?.map((e) => e?.toJson())?.toList());
  return val;
}
