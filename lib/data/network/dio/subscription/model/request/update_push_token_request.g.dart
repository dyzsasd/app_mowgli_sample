// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_push_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePushTokenRequest _$UpdatePushTokenRequestFromJson(
    Map<String, dynamic> json) {
  return UpdatePushTokenRequest(
    deviceId: json['device_id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UpdatePushTokenRequestToJson(
    UpdatePushTokenRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('device_id', instance.deviceId);
  writeNotNull('token', instance.token);
  return val;
}
