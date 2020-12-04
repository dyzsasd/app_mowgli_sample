// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_best_deal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheBestDealRequest _$SmartCacheBestDealRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'origin',
    'destination',
    'outbound_date',
    'type',
    'order_by'
  ]);
  return SmartCacheBestDealRequest(
    origin: json['origin'] == null
        ? null
        : SmartCacheRequestOrigin.fromJson(
            json['origin'] as Map<String, dynamic>),
    destination: json['destination'] == null
        ? null
        : SmartCacheRequestDestination.fromJson(
            json['destination'] as Map<String, dynamic>),
    outboundDate: json['outbound_date'] == null
        ? null
        : SmartCacheHopDate.fromJson(
            json['outbound_date'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$SmartCacheJourneyTypeEnumMap, json['type']),
    orderBy: _$enumDecodeNullable(
        _$SmartCacheBestDealRequestOrderMetricEnumMap, json['order_by']),
    outboundTime: json['outbound_time'] == null
        ? null
        : SmartCacheHopTime.fromJson(
            json['outbound_time'] as Map<String, dynamic>),
    inboundDate: json['inbound_date'] == null
        ? null
        : SmartCacheHopDate.fromJson(
            json['inbound_date'] as Map<String, dynamic>),
    inboundTime: json['inbound_time'] == null
        ? null
        : SmartCacheHopTime.fromJson(
            json['inbound_time'] as Map<String, dynamic>),
    journeyDays: json['journey_days'] == null
        ? null
        : SmartCacheJourneyDays.fromJson(
            json['journey_days'] as Map<String, dynamic>),
    maxStopOvers: json['max_stopovers'] as int,
    hopDuration: json['hop_duration'] == null
        ? null
        : SmartCacheHopDuration.fromJson(
            json['hop_duration'] as Map<String, dynamic>),
    distance: json['distance'] == null
        ? null
        : SmartCacheDistance.fromJson(json['distance'] as Map<String, dynamic>),
    checkedBaggage: json['checked_baggage'] as int,
    cabin: _$enumDecodeNullable(_$SmartCacheCabinTypeEnumMap, json['cabin']),
    budget: (json['budget'] as num)?.toDouble(),
    currency:
        _$enumDecodeNullable(_$SmartCacheCurrencyEnumMap, json['currency']),
    locale: json['locale'] as String,
    continuationToken: json['continuation_token'] as String,
    size: json['size'] as int ?? 20,
    oneByDestination: json['one_by_destination'] as bool ?? false,
    imageSize: json['avatar_width'] as int,
  );
}

Map<String, dynamic> _$SmartCacheBestDealRequestToJson(
    SmartCacheBestDealRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('outbound_date', instance.outboundDate?.toJson());
  writeNotNull('outbound_time', instance.outboundTime?.toJson());
  writeNotNull('inbound_date', instance.inboundDate?.toJson());
  writeNotNull('inbound_time', instance.inboundTime?.toJson());
  writeNotNull('type', _$SmartCacheJourneyTypeEnumMap[instance.type]);
  writeNotNull('journey_days', instance.journeyDays?.toJson());
  writeNotNull('max_stopovers', instance.maxStopOvers);
  writeNotNull('hop_duration', instance.hopDuration?.toJson());
  writeNotNull('distance', instance.distance?.toJson());
  writeNotNull('checked_baggage', instance.checkedBaggage);
  writeNotNull('cabin', _$SmartCacheCabinTypeEnumMap[instance.cabin]);
  writeNotNull('budget', instance.budget);
  writeNotNull('currency', _$SmartCacheCurrencyEnumMap[instance.currency]);
  writeNotNull('locale', instance.locale);
  writeNotNull('continuation_token', instance.continuationToken);
  writeNotNull('size', instance.size);
  writeNotNull('order_by',
      _$SmartCacheBestDealRequestOrderMetricEnumMap[instance.orderBy]);
  writeNotNull('one_by_destination', instance.oneByDestination);
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

const _$SmartCacheBestDealRequestOrderMetricEnumMap = {
  SmartCacheBestDealRequestOrderMetric.popularity: 'POPULARITY',
  SmartCacheBestDealRequestOrderMetric.price: 'PRICE',
  SmartCacheBestDealRequestOrderMetric.freshness: 'FRESHNESS',
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
