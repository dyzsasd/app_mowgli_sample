import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/subscription_model.dart';

part 'add_subscription_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AddSubscriptionRequest {
  @JsonKey(name: 'device_id')
  String deviceId;
  @JsonKey(name: 'best_deal_request')
  SmartCacheBestDealRequest request;
  @JsonKey(name: 'offer_id')
  String offerId;
  @JsonKey(name: 'type')
  SubscriptionType subscriptionType;
  SubscriptionMetadata metadata;

  AddSubscriptionRequest(
      {this.deviceId,
      this.request,
      this.offerId,
      this.metadata,
      this.subscriptionType});

  factory AddSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$AddSubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddSubscriptionRequestToJson(this);
}

enum SubscriptionType {
  @JsonValue('DealGroup')
  dealGroup,
  @JsonValue('DealFollow')
  dealFollow,
  @JsonValue('DestinationGroup')
  destinationGroup
}
