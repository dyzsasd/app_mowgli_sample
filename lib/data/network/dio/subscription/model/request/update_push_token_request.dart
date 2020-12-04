import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_push_token_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UpdatePushTokenRequest {
  @JsonKey(name: 'device_id')
  String deviceId;
  String token;

  UpdatePushTokenRequest({@required this.deviceId, @required this.token});

  factory UpdatePushTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePushTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePushTokenRequestToJson(this);
}
