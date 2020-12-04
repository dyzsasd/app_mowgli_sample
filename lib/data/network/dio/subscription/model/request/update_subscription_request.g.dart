// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_subscription_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateSubscriptionRequest _$UpdateSubscriptionRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateSubscriptionRequest(
    request: json['best_deal_request'] == null
        ? null
        : SmartCacheBestDealRequest.fromJson(
            json['best_deal_request'] as Map<String, dynamic>),
    metadata: json['metadata'] == null
        ? null
        : SubscriptionMetadata.fromJson(
            json['metadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateSubscriptionRequestToJson(
    UpdateSubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('best_deal_request', instance.request?.toJson());
  writeNotNull('metadata', instance.metadata?.toJson());
  return val;
}
