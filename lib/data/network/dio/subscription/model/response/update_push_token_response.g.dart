// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_push_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePushTokenResponse _$UpdatePushTokenResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return UpdatePushTokenResponse(
    value: json['ok'] as bool ?? false,
  );
}

Map<String, dynamic> _$UpdatePushTokenResponseToJson(
    UpdatePushTokenResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ok', instance.value);
  return val;
}
