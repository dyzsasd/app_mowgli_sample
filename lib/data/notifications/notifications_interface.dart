import 'package:flutter/foundation.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_notification_model.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

abstract class NotificationsService {
  Future<void> init();

  Future<bool> enableNotifications();

  Future<bool> areNotificationsEnabled();

  Future<void> openNotificationsSettings();

  Future<void> generateNotification(int id, String title, String body,
      {String payload});

  Future<Iterable<ReceivedNotification>> getNotificationsHistory();

  Stream<Iterable<ReceivedNotification>> listenToNotificationsHistory();

  Future<void> removeNotification(int id);

  Future<bool> addSubscription(NotificationSubscription subscription);

  Future<void> removeSubscription(String id);

  Future<NotificationSubscription> getSubscription(String subscriptionId);

  Future<bool> updateSubscriptionId(
      String oldSubscriptionId, String newSubscriptionId);

  Future<bool> clearObsoleteSubscriptions(
      Iterable<String> currentSubscriptions);

  Future<bool> isAlreadySubscribedTo(Request request);

  Future<Iterable<NotificationItem>> getNotificationItemHistory();

  Stream<Iterable<NotificationItem>> listenToNotificationsItemHistory();

  Future<void> removeNotificationItem(String id);

  Future<void> saveNotificationItem(Iterable<NotificationItem> items);
}

class ReceivedNotification {
  final int id;
  final String subscriptionId;
  final String initialSubscriptionId;
  final DateTime publicationDate;
  final String dealId;
  final DateTime dealDate;
  final String title;
  final String description;
  final num price;
  final String currency;
  final Map<Object, Object> data;

  ReceivedNotification(
      {this.id,
      this.subscriptionId,
      this.initialSubscriptionId,
      this.publicationDate,
      this.dealId,
      this.dealDate,
      this.title,
      this.description,
      this.price,
      this.currency,
      this.data});
}

class NotificationSubscription {
  final String subscriptionId;
  final String fromLabel;
  final String toLabel;
  final Request request;

  NotificationSubscription(
      {@required this.subscriptionId,
      @required this.fromLabel,
      @required this.toLabel,
      @required this.request});
}
