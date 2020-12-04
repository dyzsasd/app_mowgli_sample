// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestDestination _$_$_RequestDestinationFromJson(Map json) {
  return _$_RequestDestination(
    type: _$enumDecodeNullable(_$RequestDestinationTypeEnumMap, json['type']),
    codes: (json['codes'] as List)?.map((e) => e as String)?.toList(),
    codeType: _$enumDecodeNullable(
        _$RequestDestinationCodeTypeEnumMap, json['codeType']),
  );
}

Map<String, dynamic> _$_$_RequestDestinationToJson(
        _$_RequestDestination instance) =>
    <String, dynamic>{
      'type': _$RequestDestinationTypeEnumMap[instance.type],
      'codes': instance.codes,
      'codeType': _$RequestDestinationCodeTypeEnumMap[instance.codeType],
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

const _$RequestDestinationTypeEnumMap = {
  RequestDestinationType.city: 'city',
  RequestDestinationType.airport: 'airport',
  RequestDestinationType.country: 'country',
  RequestDestinationType.continent: 'continent',
  RequestDestinationType.category: 'category',
  RequestDestinationType.all: 'all',
};

const _$RequestDestinationCodeTypeEnumMap = {
  RequestDestinationCodeType.iata: 'iata',
};

_$_NoRequestDestination _$_$_NoRequestDestinationFromJson(Map json) {
  return _$_NoRequestDestination(
    codes: (json['codes'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$RequestDestinationTypeEnumMap, json['type']) ??
        RequestDestinationType.all,
    codeType: _$enumDecodeNullable(
        _$RequestDestinationCodeTypeEnumMap, json['codeType']),
  );
}

Map<String, dynamic> _$_$_NoRequestDestinationToJson(
        _$_NoRequestDestination instance) =>
    <String, dynamic>{
      'codes': instance.codes,
      'type': _$RequestDestinationTypeEnumMap[instance.type],
      'codeType': _$RequestDestinationCodeTypeEnumMap[instance.codeType],
    };
