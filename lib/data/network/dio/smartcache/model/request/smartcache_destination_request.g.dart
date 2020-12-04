// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_destination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheDestinationRequest _$SmartCacheDestinationRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'origin',
    'destination',
    'outbound_date',
    'inbound_date',
    'type'
  ]);
  return SmartCacheDestinationRequest(
    origin: json['origin'] == null
        ? null
        : SmartCacheFixedLocation.fromJson(
            json['origin'] as Map<String, dynamic>),
    destination: json['destination'] == null
        ? null
        : SmartCacheFixedLocation.fromJson(
            json['destination'] as Map<String, dynamic>),
    outboundDate: json['outbound_date'] == null
        ? null
        : DateTime.parse(json['outbound_date'] as String),
    type: _$enumDecodeNullable(_$SmartCacheJourneyTypeEnumMap, json['type']),
    inboundDate: json['inbound_date'] == null
        ? null
        : DateTime.parse(json['inbound_date'] as String),
    maxStopOvers: json['stopovers'] as int,
    distance: json['distance'] == null
        ? null
        : SmartCacheDistance.fromJson(json['distance'] as Map<String, dynamic>),
    checkedBaggage: json['checkedBaggage'] as int,
    cabin: _$enumDecodeNullable(_$SmartCacheCabinTypeEnumMap, json['cabin']),
    locale: json['locale'] as String,
    imageSize: json['avatar_width'] as int,
  );
}

Map<String, dynamic> _$SmartCacheDestinationRequestToJson(
    SmartCacheDestinationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull(
      'outbound_date', JSONParserUtils.formatDate(instance.outboundDate));
  writeNotNull(
      'inbound_date', JSONParserUtils.formatDate(instance.inboundDate));
  writeNotNull('type', _$SmartCacheJourneyTypeEnumMap[instance.type]);
  writeNotNull('stopovers', instance.maxStopOvers);
  writeNotNull('distance', instance.distance?.toJson());
  writeNotNull('checkedBaggage', instance.checkedBaggage);
  writeNotNull('cabin', _$SmartCacheCabinTypeEnumMap[instance.cabin]);
  writeNotNull('locale', instance.locale);
  writeNotNull('avatar_width', instance.imageSize);
  return val;
}

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

const _$SmartCacheJourneyTypeEnumMap = {
  SmartCacheJourneyType.oneWay: 'ONEWAY',
  SmartCacheJourneyType.roundTrip: 'ROUNDTRIP',
};

const _$SmartCacheCabinTypeEnumMap = {
  SmartCacheCabinType.economy: 'ECONOMY',
  SmartCacheCabinType.premium: 'PREMIUM',
  SmartCacheCabinType.business: 'BUSINESS',
  SmartCacheCabinType.first: 'FIRST',
};
