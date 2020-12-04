import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscription_response.dart';

part 'device_subscriptions_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceSubscriptionsResponse {
  @JsonKey(defaultValue: false, name: 'ok', required: true)
  bool value;
  List<DeviceSubscriptionResult> subscriptions;

  DeviceSubscriptionsResponse({this.value});

  factory DeviceSubscriptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceSubscriptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceSubscriptionsResponseToJson(this);
}
