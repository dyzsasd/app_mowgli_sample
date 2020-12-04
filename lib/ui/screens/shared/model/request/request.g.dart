// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$_$_RequestFromJson(Map json) {
  return _$_Request(
    origin: json['origin'] == null
        ? null
        : RequestOrigin.fromJson((json['origin'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    destination: json['destination'] == null
        ? null
        : RequestDestination.fromJson((json['destination'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    outboundDate: json['outboundDate'] == null
        ? null
        : RequestDate.fromJson((json['outboundDate'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    inboundDate: json['inboundDate'] == null
        ? null
        : RequestDate.fromJson((json['inboundDate'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    filters: json['filters'] == null
        ? null
        : Filters.fromJson((json['filters'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    journeyType: _$enumDecodeNullable(
            _$RequestJourneyTypeEnumMap, json['journeyType']) ??
        RequestJourneyType.roundTrip,
    maxStopOvers: json['maxStopOvers'] as int,
    distance: json['distance'] == null
        ? null
        : RequestDistance.fromJson((json['distance'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    maxBudget: json['maxBudget'] as int,
    maxResults: json['maxResults'] as int,
    nextRequestKey: json['nextRequestKey'] as String,
    sortOrder:
        _$enumDecodeNullable(_$RequestSortOrderEnumMap, json['sortOrder']) ??
            RequestSortOrder.price,
  );
}

Map<String, dynamic> _$_$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      'origin': instance.origin?.toJson(),
      'destination': instance.destination?.toJson(),
      'outboundDate': instance.outboundDate?.toJson(),
      'inboundDate': instance.inboundDate?.toJson(),
      'filters': instance.filters?.toJson(),
      'journeyType': _$RequestJourneyTypeEnumMap[instance.journeyType],
      'maxStopOvers': instance.maxStopOvers,
      'distance': instance.distance?.toJson(),
      'maxBudget': instance.maxBudget,
      'maxResults': instance.maxResults,
      'nextRequestKey': instance.nextRequestKey,
      'sortOrder': _$RequestSortOrderEnumMap[instance.sortOrder],
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

const _$RequestJourneyTypeEnumMap = {
  RequestJourneyType.roundTrip: 'roundTrip',
  RequestJourneyType.oneWay: 'oneWay',
};

const _$RequestSortOrderEnumMap = {
  RequestSortOrder.popularity: 'popularity',
  RequestSortOrder.price: 'price',
  RequestSortOrder.freshness: 'freshness',
};

_$RequestLocation _$_$RequestLocationFromJson(Map json) {
  return _$RequestLocation(
    origin: json['origin'] == null
        ? null
        : RequestOrigin.fromJson((json['origin'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    destination: json['destination'] == null
        ? null
        : RequestDestination.fromJson((json['destination'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    outboundDate: json['outboundDate'] == null
        ? null
        : RequestDate.fromJson((json['outboundDate'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    inboundDate: json['inboundDate'] == null
        ? null
        : RequestDate.fromJson((json['inboundDate'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    filters: json['filters'] == null
        ? null
        : Filters.fromJson((json['filters'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    journeyType:
        _$enumDecodeNullable(_$RequestJourneyTypeEnumMap, json['journeyType']),
    maxStopOvers: json['maxStopOvers'] as int,
    distance: json['distance'] == null
        ? null
        : RequestDistance.fromJson((json['distance'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    maxBudget: json['maxBudget'] as int,
    maxResults: json['maxResults'] as int,
    nextRequestKey: json['nextRequestKey'] as String,
    sortOrder:
        _$enumDecodeNullable(_$RequestSortOrderEnumMap, json['sortOrder']) ??
            RequestSortOrder.price,
  );
}

Map<String, dynamic> _$_$RequestLocationToJson(_$RequestLocation instance) =>
    <String, dynamic>{
      'origin': instance.origin?.toJson(),
      'destination': instance.destination?.toJson(),
      'outboundDate': instance.outboundDate?.toJson(),
      'inboundDate': instance.inboundDate?.toJson(),
      'filters': instance.filters?.toJson(),
      'journeyType': _$RequestJourneyTypeEnumMap[instance.journeyType],
      'maxStopOvers': instance.maxStopOvers,
      'distance': instance.distance?.toJson(),
      'maxBudget': instance.maxBudget,
      'maxResults': instance.maxResults,
      'nextRequestKey': instance.nextRequestKey,
      'sortOrder': _$RequestSortOrderEnumMap[instance.sortOrder],
    };
