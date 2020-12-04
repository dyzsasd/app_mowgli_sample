import 'package:hive/hive.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

part 'hive_subscription.g.dart';

@HiveType(typeId: 1)
class HiveSubscription extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String fromLabel;

  @HiveField(2)
  String toLabel;

  @HiveField(3)
  Map<String, Object> request;

  HiveSubscription(this.id, this.fromLabel, this.toLabel, this.request);

  HiveSubscription.fromNotificationSubscription(
      NotificationSubscription subscription)
      : id = subscription.subscriptionId,
        fromLabel = subscription.fromLabel,
        toLabel = subscription.toLabel,
        request = subscription.request.toJson();

  NotificationSubscription toNotificationSubscription() =>
      NotificationSubscription(
          subscriptionId: id,
          fromLabel: fromLabel,
          toLabel: toLabel,
          request: Request.fromJson(request));

  HiveSubscription replaceIdWith(String newSubscriptionId) => HiveSubscription(
      newSubscriptionId, this.fromLabel, this.toLabel, this.request);
}
