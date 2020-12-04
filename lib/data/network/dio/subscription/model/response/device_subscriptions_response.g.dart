// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_subscriptions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSubscriptionsResponse _$DeviceSubscriptionsResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return DeviceSubscriptionsResponse(
    value: json['ok'] as bool ?? false,
  )..subscriptions = (json['subscriptions'] as List)
      ?.map((e) => e == null
          ? null
          : DeviceSubscriptionResult.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$DeviceSubscriptionsResponseToJson(
    DeviceSubscriptionsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ok', instance.value);
  writeNotNull('subscriptions',
      instance.subscriptions?.map((e) => e?.toJson())?.toList());
  return val;
}
