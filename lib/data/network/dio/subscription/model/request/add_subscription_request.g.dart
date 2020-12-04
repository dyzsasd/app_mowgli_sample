// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_subscription_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSubscriptionRequest _$AddSubscriptionRequestFromJson(
    Map<String, dynamic> json) {
  return AddSubscriptionRequest(
    deviceId: json['device_id'] as String,
    request: json['best_deal_request'] == null
        ? null
        : SmartCacheBestDealRequest.fromJson(
            json['best_deal_request'] as Map<String, dynamic>),
    offerId: json['offer_id'] as String,
    metadata: json['metadata'] == null
        ? null
        : SubscriptionMetadata.fromJson(
            json['metadata'] as Map<String, dynamic>),
    subscriptionType:
        _$enumDecodeNullable(_$SubscriptionTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$AddSubscriptionRequestToJson(
    AddSubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('device_id', instance.deviceId);
  writeNotNull('best_deal_request', instance.request?.toJson());
  writeNotNull('offer_id', instance.offerId);
  writeNotNull('type', _$SubscriptionTypeEnumMap[instance.subscriptionType]);
  writeNotNull('metadata', instance.metadata?.toJson());
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

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.dealGroup: 'DealGroup',
  SubscriptionType.dealFollow: 'DealFollow',
  SubscriptionType.destinationGroup: 'DestinationGroup',
};
