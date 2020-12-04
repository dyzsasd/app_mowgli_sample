// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_origin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestOrigin _$_$_RequestOriginFromJson(Map json) {
  return _$_RequestOrigin(
    code: json['code'] as String,
    type: _$enumDecodeNullable(_$RequestOriginTypeEnumMap, json['type']),
    codeType:
        _$enumDecodeNullable(_$RequestOriginCodeTypeEnumMap, json['codeType']),
    customerLocations: (json['customerLocations'] as List)?.map((e) => e == null
        ? null
        : RequestOrigin.fromJson((e as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))),
  );
}

Map<String, dynamic> _$_$_RequestOriginToJson(_$_RequestOrigin instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': _$RequestOriginTypeEnumMap[instance.type],
      'codeType': _$RequestOriginCodeTypeEnumMap[instance.codeType],
      'customerLocations':
          instance.customerLocations?.map((e) => e?.toJson())?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RequestOriginTypeEnumMap = {
  RequestOriginType.city: 'city',
  RequestOriginType.airport: 'airport',
};

const _$RequestOriginCodeTypeEnumMap = {
  RequestOriginCodeType.iata: 'iata',
};

_$_RequestOriginCity _$_$_RequestOriginCityFromJson(Map json) {
  return _$_RequestOriginCity(
    code: json['code'] as String,
    type: _$enumDecodeNullable(_$RequestOriginTypeEnumMap, json['type']) ??
        RequestOriginType.city,
    codeType: _$enumDecodeNullable(
            _$RequestOriginCodeTypeEnumMap, json['codeType']) ??
        RequestOriginCodeType.iata,
    customerLocations: (json['customerLocations'] as List)?.map((e) => e == null
        ? null
        : RequestOrigin.fromJson((e as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))),
  );
}

Map<String, dynamic> _$_$_RequestOriginCityToJson(
        _$_RequestOriginCity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': _$RequestOriginTypeEnumMap[instance.type],
      'codeType': _$RequestOriginCodeTypeEnumMap[instance.codeType],
      'customerLocations':
          instance.customerLocations?.map((e) => e?.toJson())?.toList(),
    };

_$_RequestOriginAirport _$_$_RequestOriginAirportFromJson(Map json) {
  return _$_RequestOriginAirport(
    code: json['code'] as String,
    type: _$enumDecodeNullable(_$RequestOriginTypeEnumMap, json['type']) ??
        RequestOriginType.airport,
    codeType: _$enumDecodeNullable(
            _$RequestOriginCodeTypeEnumMap, json['codeType']) ??
        RequestOriginCodeType.iata,
    customerLocations: (json['customerLocations'] as List)?.map((e) => e == null
        ? null
        : RequestOrigin.fromJson((e as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          ))),
  );
}

Map<String, dynamic> _$_$_RequestOriginAirportToJson(
        _$_RequestOriginAirport instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': _$RequestOriginTypeEnumMap[instance.type],
      'codeType': _$RequestOriginCodeTypeEnumMap[instance.codeType],
      'customerLocations':
          instance.customerLocations?.map((e) => e?.toJson())?.toList(),
    };
