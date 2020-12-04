import 'dart:convert';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/data/storage/hive/model/hive_notification.dart';
import 'package:mowgli/data/storage/hive/model/hive_notification_item.dart';
import 'package:mowgli/data/storage/hive/model/hive_subscription.dart';
import 'package:mowgli/data/storage/storage.dart';
import 'package:mowgli/ui/main.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_notification_model.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/utils/text_utils.dart';

class NotificationsMobileImpl extends NotificationsService {
  final FlutterLocalNotificationsPlugin localPlugin =
      FlutterLocalNotificationsPlugin();

  bool isInitialized = false;
  StorageBox _box;

  @override
  Future<void> init() async {
    isInitialized = false;
    await _initNotificationsPlugin();
    await _initStorage();
    isInitialized = true;
  }

  Future<void> _initStorage() async {
    _box = await ApplicationServices.storage.create('notifications');
  }

  Future<void> _initNotificationsPlugin() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notif');

    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await localPlugin.initialize(initializationSettings,
        onSelectNotification: onNotificationClicked);
  }

  static Future<dynamic> onNotificationClicked(String payload) async {
    try {
      if (TextUtils.isNotEmpty(payload) && MowgliApp.appNavigatorKey != null) {
        Map<String, Object> data = jsonDecode(payload);
        String dealId = data['local_notification_id']?.toString();
        String subscriptionId = data['subscription_id']?.toString();
        NotificationSubscription subscription = await ApplicationServices
            .notifications
            .getSubscription(subscriptionId);

        if (dealId != null && subscription != null) {
          NavigatorState navigator = MowgliApp.appNavigatorKey.currentState;

          navigator.pushNamed(
            AppRoutes.routeDealDetails,
            arguments: DealDetailsScreenArgs.dealId(
                dealId: dealId,
                departure: Location.from(label: subscription.fromLabel),
                arrival: Location.to(label: subscription.toLabel),
                request: subscription.request),
          );
        }
      }
    } catch (_) {}

    return null;
  }

  @override
  Future<bool> enableNotifications() async {
    if (Platform.isIOS) {
      IOSFlutterLocalNotificationsPlugin plugin =
          localPlugin.resolvePlatformSpecificImplementation();

      return plugin.requestPermissions(sound: true, alert: true, badge: true);
    } else {
      return true;
    }
  }

  @override
  Future<bool> areNotificationsEnabled() async {
    if (Platform.isIOS) {
      IOSFlutterLocalNotificationsPlugin plugin =
          localPlugin.resolvePlatformSpecificImplementation();

      return plugin.requestPermissions();
    } else {
      return false;
    }
  }

  @override
  Future<void> openNotificationsSettings() =>
      AppSettings.openNotificationSettings();

  @override
  Future<void> generateNotification(int id, String title, String body,
      {String payload}) async {
    if (!isInitialized) {
      await init();
    }

    Map<Object, Object> data = jsonDecode(payload);

    Object subscriptionId = data['subscription_id'];

    if (await _findSubscriptionObject(subscriptionId) != null) {
      await _saveNotificationToHistory(id, data);

      return localPlugin.show(
          id,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                'alerts', 'Alertes', 'Les deals de Mowgli',
                color: AppColors.primary),
            iOS: IOSNotificationDetails(),
          ),
          payload: payload);
    } else {
      // ignore: avoid_print
      print('Unknown subscriptionId $subscriptionId');
    }
  }

  Future<void> _saveNotificationToHistory(
      int id, Map<Object, Object> data) async {
    List<HiveNotification> history =
        (await _box.getList('history', <HiveNotification>[])).cast();

    history.add(HiveNotification.fromData(data, id));
    await _box.saveList('history', history);
  }

  @override
  Future<Iterable<ReceivedNotification>> getNotificationsHistory() async {
    List<HiveNotification> history =
        (await _box.getList('history', <HiveNotification>[])).cast();

    history.sort((HiveNotification a, HiveNotification b) =>
        b.publicationDate.compareTo(a.publicationDate));

    return history.map((HiveNotification notification) =>
        notification.toReceivedNotification());
  }

  @override
  Stream<Iterable<ReceivedNotification>> listenToNotificationsHistory() {
    return _box.listenToListValues('history').map((List<Object> history) {
      List<HiveNotification> notifications = history.cast<HiveNotification>();

      notifications.sort((HiveNotification a, HiveNotification b) =>
          b.publicationDate.compareTo(a.publicationDate));

      return notifications.map((HiveNotification notification) =>
          notification.toReceivedNotification());
    });
  }

  Future<void> _replaceSubscriptionIdInNotifications(
      String oldSubscriptionId, String newSubscriptionId) async {
    Iterable<HiveNotification> history =
        (await _box.getList('history', <HiveNotification>[])).cast();

    return await _box.saveList(
        'history',
        history.map((HiveNotification notification) {
          if (notification.subscriptionId == oldSubscriptionId) {
            return notification.replaceSubscriptionId(
                oldSubscriptionId, newSubscriptionId);
          } else {
            return notification;
          }
        }).toList(growable: false));
  }

  @override
  Future<void> removeNotification(int id) async {
    localPlugin.cancel(id);

    List<HiveNotification> history =
        (await _box.getList('history', <HiveNotification>[])).cast();

    history
        .removeWhere((HiveNotification notification) => notification.id == id);

    return _box.saveList('history', history);
  }

  @override
  Future<bool> addSubscription(NotificationSubscription subscription) async {
    if ((await _findSubscriptionObject(subscription.subscriptionId)) != null) {
      // The subscription is already saved
      return false;
    }

    List<HiveSubscription> subscriptions = await listSubscriptions(false);
    subscriptions
        .add(HiveSubscription.fromNotificationSubscription(subscription));

    await _box.saveList('subscriptions', subscriptions);
    return true;
  }

  @override
  Future<void> removeSubscription(String id) async {
    List<HiveSubscription> subscriptions =
        (await _box.getList('subscriptions', <HiveSubscription>[])).cast();

    subscriptions
        .removeWhere((HiveSubscription subscription) => subscription.id == id);

    return _box.saveList('subscriptions', subscriptions);
  }

  Future<List<HiveSubscription>> listSubscriptions(
      [bool readOnly = true]) async {
    List<HiveSubscription> list =
        (await _box.getList('subscriptions', <HiveSubscription>[])).cast();

    if (!readOnly) {
      return list.toList(growable: true);
    } else {
      return list;
    }
  }

  @override
  Future<bool> clearObsoleteSubscriptions(
      Iterable<String> currentSubscriptions) async {
    List<HiveSubscription> subscriptions = await listSubscriptions();

    await _box.saveList(
        'subscriptions',
        subscriptions
            .where((HiveSubscription subscription) =>
                currentSubscriptions.contains(subscription.id))
            .toList(growable: false));

    return true;
  }

  @override
  Future<NotificationSubscription> getSubscription(
      String subscriptionId) async {
    return _findSubscriptionObject(subscriptionId).then(
        (HiveSubscription subscription) =>
            subscription?.toNotificationSubscription());
  }

  Future<HiveSubscription> _findSubscriptionObject(
      String subscriptionId) async {
    List<HiveSubscription> subscriptions = await listSubscriptions();

    HiveSubscription subscription = subscriptions.firstWhere(
        (HiveSubscription subscription) => subscription.id == subscriptionId,
        orElse: () => null);

    return subscription;
  }

  @override
  Future<bool> updateSubscriptionId(
      String oldSubscriptionId, String newSubscriptionId) async {
    HiveSubscription subscription =
        await _findSubscriptionObject(oldSubscriptionId);

    if (subscription == null) {
      return false;
    }

    List<HiveSubscription> subscriptions = await listSubscriptions();

    await _box.saveList(
        'subscriptions',
        subscriptions.map((HiveSubscription subscription) {
          if (subscription.id == oldSubscriptionId) {
            return subscription.replaceIdWith(newSubscriptionId);
          } else {
            return subscription;
          }
        }).toList(growable: false));

    await _replaceSubscriptionIdInNotifications(
        oldSubscriptionId, newSubscriptionId);

    return true;
  }

  @override
  Future<bool> isAlreadySubscribedTo(Request request) async {
    List<HiveSubscription> subscriptions = await listSubscriptions();

    return subscriptions.firstWhere(
            (HiveSubscription subscription) =>
                Request.fromJson(subscription.request) == request,
            orElse: () => null) !=
        null;
  }

  @override
  Future<void> removeNotificationItem(String id) async {
    List<HiveNotificationItem> items =
        (await _box.getList('notification_items', <HiveNotificationItem>[]))
            .cast();
    items.removeWhere((HiveNotificationItem item) => item.id == id);
    return _box.saveList('notification_items', items);
  }

  @override
  Future<Iterable<NotificationItem>> getNotificationItemHistory() async {
    List<HiveNotificationItem> history =
        (await _box.getList('notification_items', <HiveNotificationItem>[]))
            .cast();

    history.sort((HiveNotificationItem a, HiveNotificationItem b) =>
        b.lastCheck.compareTo(a.lastCheck));

    return history
        .map((HiveNotificationItem notification) =>
            notification.toNotificationItem())
        .toList();
  }

  @override
  Stream<Iterable<NotificationItem>> listenToNotificationsItemHistory() {
    return _box
        .listenToListValues('notification_items')
        .map((List<Object> history) {
      List<HiveNotificationItem> notifications =
          history.cast<HiveNotificationItem>();

      notifications.sort((HiveNotificationItem a, HiveNotificationItem b) =>
          b.lastCheck.compareTo(a.lastCheck));

      return notifications.map((HiveNotificationItem notification) =>
          notification.toNotificationItem());
    });
  }

  @override
  Future<void> saveNotificationItem(Iterable<NotificationItem> items) async {
    List<HiveNotificationItem> history = items
        .map((NotificationItem item) =>
            HiveNotificationItem.fromNotificationItem(item))
        .toList();
    return _box.saveList('notification_items', history);
  }
}
