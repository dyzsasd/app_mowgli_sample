// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceNotificationResponse _$DeviceNotificationResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return DeviceNotificationResponse(
    value: json['ok'] as bool ?? false,
  )..notification = json['notification'] == null
      ? null
      : DeviceNotificationResult.fromJson(
          json['notification'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DeviceNotificationResponseToJson(
    DeviceNotificationResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ok', instance.value);
  writeNotNull('notification', instance.notification?.toJson());
  return val;
}

DeviceNotificationResult _$DeviceNotificationResultFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return DeviceNotificationResult(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    departureCity: json['departure_city'] as String,
    arrivalCity: json['arrival_city'] as String,
    subscriptionId: json['subscription_id'] as String,
    deviceId: json['device_id'] as String,
    offerId: json['offer_id'] as String,
    currency: json['currency'] as String,
    price: (json['price'] as num)?.toDouble(),
    lastCheck: JSONParserUtils.parseTimestamp(json['last_check']),
    outboundDate: json['outbound_date'] == null
        ? null
        : DateTime.parse(json['outbound_date'] as String),
    inboundDate: json['inbound_date'] == null
        ? null
        : DateTime.parse(json['inbound_date'] as String),
    request: SmartCacheBestDealRequest.fromJson(
        json['request'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeviceNotificationResultToJson(
    DeviceNotificationResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('departure_city', instance.departureCity);
  writeNotNull('arrival_city', instance.arrivalCity);
  writeNotNull('device_id', instance.deviceId);
  writeNotNull('subscription_id', instance.subscriptionId);
  writeNotNull('offer_id', instance.offerId);
  writeNotNull('currency', instance.currency);
  writeNotNull('price', instance.price);
  writeNotNull('last_check', instance.lastCheck?.toIso8601String());
  writeNotNull(
      'outbound_date', JSONParserUtils.formatDate(instance.outboundDate));
  writeNotNull(
      'inbound_date', JSONParserUtils.formatDate(instance.inboundDate));
  val['request'] = instance.request.toJson();
  return val;
}
