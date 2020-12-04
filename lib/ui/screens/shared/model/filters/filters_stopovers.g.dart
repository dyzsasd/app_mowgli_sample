// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_stopovers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StopOversFilter _$_$_StopOversFilterFromJson(Map json) {
  return _$_StopOversFilter(
    direct: json['direct'] as bool ?? true,
    one: json['one'] as bool ?? true,
    many: json['many'] as bool ?? true,
  );
}

Map<String, dynamic> _$_$_StopOversFilterToJson(_$_StopOversFilter instance) =>
    <String, dynamic>{
      'direct': instance.direct,
      'one': instance.one,
      'many': instance.many,
    };
