// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSubscriptionResponse _$DeviceSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return DeviceSubscriptionResponse(
    value: json['ok'] as bool ?? false,
  )..subscription = json['subscription'] == null
      ? null
      : DeviceSubscriptionResult.fromJson(
          json['subscription'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DeviceSubscriptionResponseToJson(
    DeviceSubscriptionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ok', instance.value);
  writeNotNull('subscription', instance.subscription?.toJson());
  return val;
}

DeviceSubscriptionResult _$DeviceSubscriptionResultFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return DeviceSubscriptionResult(
    subscriptionId: json['id'] as String,
    deviceId: json['device_id'] as String,
    creationDate: JSONParserUtils.parseTimestamp(json['created_at']),
    request: json['best_deal_request'] == null
        ? null
        : SmartCacheBestDealRequest.fromJson(
            json['best_deal_request'] as Map<String, dynamic>),
    metadata: json['metadata'] == null
        ? null
        : SubscriptionMetadata.fromJson(
            json['metadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeviceSubscriptionResultToJson(
    DeviceSubscriptionResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.subscriptionId);
  writeNotNull('device_id', instance.deviceId);
  writeNotNull('created_at', instance.creationDate?.toIso8601String());
  writeNotNull('best_deal_request', instance.request?.toJson());
  writeNotNull('metadata', instance.metadata?.toJson());
  return val;
}
