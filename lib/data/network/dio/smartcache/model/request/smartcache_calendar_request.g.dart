// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_calendar_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheCalendarRequest _$SmartCacheCalendarRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'origin',
    'destination',
    'outbound_date',
    'inbound_date',
    'type',
    'calendar_field'
  ]);
  return SmartCacheCalendarRequest(
    origin: json['origin'] == null
        ? null
        : SmartCacheRequestOrigin.fromJson(
            json['origin'] as Map<String, dynamic>),
    destination: json['destination'] == null
        ? null
        : SmartCacheRequestDestination.fromJson(
            json['destination'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$SmartCacheJourneyTypeEnumMap, json['type']),
    outboundDate: json['outbound_date'] == null
        ? null
        : SmartCacheHopDate.fromJson(
            json['outbound_date'] as Map<String, dynamic>),
    inboundDate: json['inbound_date'] == null
        ? null
        : SmartCacheHopDate.fromJson(
            json['inbound_date'] as Map<String, dynamic>),
    field: _$enumDecodeNullable(
        _$SmartCacheCalendarFieldEnumMap, json['calendar_field']),
    journeyDays: json['journey_days'] == null
        ? null
        : SmartCacheJourneyDays.fromJson(
            json['journey_days'] as Map<String, dynamic>),
    maxStopOvers: json['max_stopovers'] as int,
    distance: json['distance'] == null
        ? null
        : SmartCacheDistance.fromJson(json['distance'] as Map<String, dynamic>),
    hopDuration: json['hop_duration'] == null
        ? null
        : SmartCacheHopDuration.fromJson(
            json['hop_duration'] as Map<String, dynamic>),
    checkedBaggage: json['checked_baggage'] as int,
    cabin: _$enumDecodeNullable(_$SmartCacheCabinTypeEnumMap, json['cabin']),
    currency:
        _$enumDecodeNullable(_$SmartCacheCurrencyEnumMap, json['currency']),
  );
}

Map<String, dynamic> _$SmartCacheCalendarRequestToJson(
    SmartCacheCalendarRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('outbound_date', instance.outboundDate?.toJson());
  writeNotNull('inbound_date', instance.inboundDate?.toJson());
  writeNotNull('type', _$SmartCacheJourneyTypeEnumMap[instance.type]);
  writeNotNull('journey_days', instance.journeyDays?.toJson());
  writeNotNull('max_stopovers', instance.maxStopOvers);
  writeNotNull('distance', instance.distance?.toJson());
  writeNotNull('hop_duration', instance.hopDuration?.toJson());
  writeNotNull('checked_baggage', instance.checkedBaggage);
  writeNotNull('cabin', _$SmartCacheCabinTypeEnumMap[instance.cabin]);
  writeNotNull('currency', _$SmartCacheCurrencyEnumMap[instance.currency]);
  writeNotNull(
      'calendar_field', _$SmartCacheCalendarFieldEnumMap[instance.field]);
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

const _$SmartCacheCalendarFieldEnumMap = {
  SmartCacheCalendarField.outbound: 'OUTBOUND_DEPARTURE_DATE',
  SmartCacheCalendarField.inbound: 'INBOUND_DEPARTURE_DATE',
};

const _$SmartCacheCabinTypeEnumMap = {
  SmartCacheCabinType.economy: 'ECONOMY',
  SmartCacheCabinType.premium: 'PREMIUM',
  SmartCacheCabinType.business: 'BUSINESS',
  SmartCacheCabinType.first: 'FIRST',
};

const _$SmartCacheCurrencyEnumMap = {
  SmartCacheCurrency.euro: 'EUR',
  SmartCacheCurrency.gbp: 'GBP',
  SmartCacheCurrency.brl: 'BRL',
};
