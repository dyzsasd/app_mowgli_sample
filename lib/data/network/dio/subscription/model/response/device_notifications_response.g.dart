// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceNotificationsResponse _$DeviceNotificationsResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return DeviceNotificationsResponse(
    value: json['ok'] as bool ?? false,
  )..notifications = (json['notifications'] as List)
      ?.map((e) => e == null
          ? null
          : DeviceNotificationResult.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$DeviceNotificationsResponseToJson(
    DeviceNotificationsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ok', instance.value);
  writeNotNull('notifications',
      instance.notifications?.map((e) => e?.toJson())?.toList());
  return val;
}
