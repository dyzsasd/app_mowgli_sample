import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_notification_response.dart';

part 'device_notifications_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceNotificationsResponse {
  @JsonKey(defaultValue: false, name: 'ok', required: true)
  bool value;
  List<DeviceNotificationResult> notifications;

  DeviceNotificationsResponse({this.value});

  factory DeviceNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceNotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceNotificationsResponseToJson(this);
}
