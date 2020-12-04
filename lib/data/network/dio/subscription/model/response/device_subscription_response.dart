import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/subscription_model.dart';
import 'package:mowgli/ui/utils/json_parser.dart';

part 'device_subscription_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceSubscriptionResponse {
  @JsonKey(defaultValue: false, name: 'ok', required: true)
  bool value;
  DeviceSubscriptionResult subscription;

  DeviceSubscriptionResponse({this.value});

  factory DeviceSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceSubscriptionResponseToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceSubscriptionResult {
  @JsonKey(name: 'id', required: true)
  String subscriptionId;
  @JsonKey(name: 'device_id')
  String deviceId;
  @JsonKey(name: 'created_at', fromJson: JSONParserUtils.parseTimestamp)
  DateTime creationDate;
  @JsonKey(name: 'best_deal_request')
  SmartCacheBestDealRequest request;
  SubscriptionMetadata metadata;

  DeviceSubscriptionResult(
      {this.subscriptionId,
      this.deviceId,
      this.creationDate,
      this.request,
      this.metadata});

  factory DeviceSubscriptionResult.fromJson(Map<String, dynamic> json) =>
      _$DeviceSubscriptionResultFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceSubscriptionResultToJson(this);
}
