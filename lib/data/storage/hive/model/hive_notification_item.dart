import 'package:hive/hive.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_notification_model.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

part 'hive_notification_item.g.dart';

@HiveType(typeId: 4)
class HiveNotificationItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String departureCity;

  @HiveField(4)
  String arrivalCity;

  @HiveField(5)
  String deviceId;

  @HiveField(6)
  String subscriptionId;

  @HiveField(7)
  String offerId;

  @HiveField(8)
  String currency;

  @HiveField(9)
  double price;

  @HiveField(10)
  DateTime lastCheck;

  @HiveField(11)
  DateTime outboundDate;

  @HiveField(12)
  DateTime inboundDate;

  @HiveField(13)
  Map<String, Object> request;

  HiveNotificationItem(
    this.id,
    this.title,
    this.description,
    this.departureCity,
    this.arrivalCity,
    this.deviceId,
    this.subscriptionId,
    this.offerId,
    this.currency,
    this.price,
    this.lastCheck,
    this.outboundDate,
    this.inboundDate,
    this.request,
  );

  HiveNotificationItem.fromNotificationItem(NotificationItem data)
      : id = data.id,
        title = data.title,
        description = data.description,
        departureCity = data.departureCity,
        arrivalCity = data.arrivalCity,
        deviceId = data.deviceId,
        subscriptionId = data.subscriptionId,
        offerId = data.offerId,
        currency = data.currency,
        price = data.price,
        lastCheck = data.lastCheck,
        outboundDate = data.outboundDate,
        inboundDate = data.inboundDate,
        request = data.request.toJson().cast<String, Object>();

  NotificationItem toNotificationItem() => NotificationItem(
        id: id,
        title: title,
        description: description,
        departureCity: departureCity,
        arrivalCity: arrivalCity,
        deviceId: deviceId,
        subscriptionId: subscriptionId,
        offerId: offerId,
        currency: currency,
        price: price,
        lastCheck: lastCheck,
        outboundDate: outboundDate,
        inboundDate: inboundDate,
        request: Request.fromJson(request?.cast<String, dynamic>()),
      );
}
