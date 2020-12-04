import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/subscription_model.dart';

part 'update_subscription_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UpdateSubscriptionRequest {
  @JsonKey(name: 'best_deal_request')
  SmartCacheBestDealRequest request;
  SubscriptionMetadata metadata;

  UpdateSubscriptionRequest({this.request, this.metadata});

  factory UpdateSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSubscriptionRequestToJson(this);
}
