import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SubscriptionMetadata {
  @JsonKey(name: 'last_price')
  double lastPrice;
  @JsonKey(name: 'last_currency')
  String lastCurrency;
  @JsonKey(name: 'last_deal')
  String lastDeal;

  SubscriptionMetadata({this.lastPrice, this.lastCurrency, this.lastDeal});

  factory SubscriptionMetadata.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionMetadataToJson(this);
}
