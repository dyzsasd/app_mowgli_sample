import 'package:json_annotation/json_annotation.dart';

part 'device_update_subscription_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceUpdateSubscriptionResponse {
  bool value;

  DeviceUpdateSubscriptionResponse({this.value});

  factory DeviceUpdateSubscriptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeviceUpdateSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeviceUpdateSubscriptionResponseToJson(this);
}
