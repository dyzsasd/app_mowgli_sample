import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/notifications/mobile/notifications_mobile.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/data/push/push_interface.dart';
import 'package:mowgli/data/storage/hive/storage_hive.dart';
import 'package:mowgli/data/storage/storage.dart';
import 'package:mowgli/utils/collections/map_utils.dart';
import 'package:mowgli/utils/platform_utils.dart';

class PushFCMImpl extends PushService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  Future<void> init() async {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint('On new message $message');
        return onMessage(message);
      },
      onBackgroundMessage:
          PlatformUtils.isIOS ? null : backgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        debugPrint('On new launch message $message');
        return onMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        debugPrint('On new resume message $message');
        return onMessage(message);
      },
    );

    _fcm.onTokenRefresh.listen((String newToken) {
      ApplicationServices.network.updatePushToken(newToken);
    });
  }

  static Future<dynamic> backgroundMessageHandler(
      Map<String, dynamic> message) async {
    debugPrint('On new background message $message');

    try {
      return onMessage(message, true);
    } catch (err, trace) {
      debugPrint(err);
      debugPrint(trace?.toString());
    }
  }

  static void onMessage(Map<String, dynamic> message,
      [bool fromBackground = false]) async {
    int localNotificationId = Random().nextInt(0x80000000);

    NotificationsService notificationsService = await _notificationsServices;

    if (message != null) {
      var data = message['data'] ?? message;

      notificationsService.generateNotification(localNotificationId, data, data,
          payload: json.encode((data as Map<Object, Object>)
              .add('local_notification_id', localNotificationId)));
    }
  }

  static Future<NotificationsService> get _notificationsServices async {
    NotificationsService notificationsService;
    try {
      notificationsService = ApplicationServices.notifications;
    } catch (err) {
      // Not initialized, let's do it manually
      notificationsService = NotificationsMobileImpl();
      GetIt.instance
          .registerSingleton<NotificationsService>(notificationsService);
      GetIt.instance.registerSingleton<Storage>(StorageWithHive());
      await notificationsService.init();
    }

    return notificationsService;
  }

  @override
  Future<String> get token => _fcm.getToken();
}
