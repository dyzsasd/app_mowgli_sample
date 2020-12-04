// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionMetadata _$SubscriptionMetadataFromJson(Map<String, dynamic> json) {
  return SubscriptionMetadata(
    lastPrice: (json['last_price'] as num)?.toDouble(),
    lastCurrency: json['last_currency'] as String,
    lastDeal: json['last_deal'] as String,
  );
}

Map<String, dynamic> _$SubscriptionMetadataToJson(
    SubscriptionMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_price', instance.lastPrice);
  writeNotNull('last_currency', instance.lastCurrency);
  writeNotNull('last_deal', instance.lastDeal);
  return val;
}
