import 'package:hive/hive.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/utils/num_utils.dart';

part 'hive_notification.g.dart';

@HiveType(typeId: 0)
class HiveNotification extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String subscriptionId;

  @HiveField(2)
  DateTime publicationDate;

  @HiveField(3)
  String dealId;

  @HiveField(4)
  DateTime dealDate;

  @HiveField(5)
  String title;

  @HiveField(6)
  String description;

  @HiveField(7)
  num price;

  @HiveField(8)
  String currency;

  @HiveField(9)
  Map<Object, Object> data;

  @HiveField(10)
  String initialSubscriptionId;

  HiveNotification(
      this.id,
      this.subscriptionId,
      this.publicationDate,
      this.dealId,
      this.dealDate,
      this.title,
      this.description,
      this.price,
      this.currency,
      this.data,
      this.initialSubscriptionId);

  HiveNotification.fromData(Map<Object, Object> data, this.id)
      : subscriptionId = data['subscription_id'],
        initialSubscriptionId = data['subscription_id'],
        publicationDate = DateTime.now(),
        dealId = data['offer_id'],
        dealDate = DateTime.parse((data['last_check'] as String)
            .replaceFirst(RegExp(r'\s'), 'T')
            .replaceFirst(RegExp(r'\s'), '')
            .replaceFirst(RegExp(r'\s.*'), '')),
        title = data['title'],
        description = data['description'],
        price = NumUtils.parseNum(data['price'], 0.0),
        currency = data['currency'],
        data = data;

  HiveNotification replaceSubscriptionId(
          String oldSubscriptionId, String newSubscriptionId) =>
      HiveNotification(id, newSubscriptionId, publicationDate, dealId, dealDate,
          title, description, price, currency, data, initialSubscriptionId);

  ReceivedNotification toReceivedNotification() => ReceivedNotification(
        id: id,
        subscriptionId: subscriptionId,
        publicationDate: publicationDate,
        dealId: dealId,
        dealDate: dealDate,
        title: title,
        description: description,
        price: price,
        currency: currency,
        data: data,
      );
}
