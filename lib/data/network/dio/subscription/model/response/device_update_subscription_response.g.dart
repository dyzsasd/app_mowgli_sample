// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_update_subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceUpdateSubscriptionResponse _$DeviceUpdateSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return DeviceUpdateSubscriptionResponse(
    value: json['value'] as bool,
  );
}

Map<String, dynamic> _$DeviceUpdateSubscriptionResponseToJson(
    DeviceUpdateSubscriptionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  return val;
}
