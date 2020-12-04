import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/ui/utils/json_parser.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';

part 'device_notification_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceNotificationResponse {
  @JsonKey(defaultValue: false, name: 'ok', required: true)
  bool value;
  DeviceNotificationResult notification;

  DeviceNotificationResponse({this.value});

  factory DeviceNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceNotificationResponseToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DeviceNotificationResult {
  @JsonKey(name: 'id', required: true)
  String id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'departure_city')
  String departureCity;
  @JsonKey(name: 'arrival_city')
  String arrivalCity;
  @JsonKey(name: 'device_id')
  String deviceId;
  @JsonKey(name: 'subscription_id')
  String subscriptionId;
  @JsonKey(name: 'offer_id')
  String offerId;
  @JsonKey(name: 'currency')
  String currency;
  @JsonKey(name: 'price')
  double price;
  @JsonKey(
      name: 'last_check',
      fromJson: JSONParserUtils.parseTimestamp,
      nullable: true)
  DateTime lastCheck;
  @JsonKey(name: 'outbound_date', toJson: JSONParserUtils.formatDate)
  DateTime outboundDate;
  @JsonKey(name: 'inbound_date', toJson: JSONParserUtils.formatDate)
  DateTime inboundDate;
  @JsonKey(name: 'request', nullable: false)
  SmartCacheBestDealRequest request;

  DeviceNotificationResult(
      {this.id,
      this.title,
      this.description,
      this.departureCity,
      this.arrivalCity,
      this.subscriptionId,
      this.deviceId,
      this.offerId,
      this.currency,
      this.price,
      this.lastCheck,
      this.outboundDate,
      this.inboundDate,
      this.request});

  factory DeviceNotificationResult.fromJson(Map<String, dynamic> json) =>
      _$DeviceNotificationResultFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceNotificationResultToJson(this);
}
