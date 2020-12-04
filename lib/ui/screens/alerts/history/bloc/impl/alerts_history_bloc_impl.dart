import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_notification_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_notifications_response.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_subscription_model.dart';
import 'package:mowgli/ui/screens/alerts/bloc/impl/alerts_bloc_impl.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/alerts_notification_model.dart';
import 'package:mowgli/ui/screens/alerts/history/bloc/impl/alerts_history_state.dart';
import 'package:mowgli/ui/screens/alerts/history/model/alerts_history_data_content.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'alerts_history_event.dart';

class AlertsHistoryBloc
    extends BaseBloc<_AlertsHistoryEvent, AlertsHistoryState> {
  final AlertsBloc parentBloc;
  StreamSubscription<AlertsState> _subscriptionsSubscription;
  StreamSubscription<Iterable<ReceivedNotification>> _notificationsSubscription;
  Map<String, NotificationItem> _history;
  CancelToken _cancelToken;
  int notificationsQty;
  bool isInitialized;

  AlertsHistoryBloc(this.parentBloc) : super(_initialState()) {
    notificationsQty = 0;
    _history = Map<String, NotificationItem>();
    isInitialized = false;

    _subscriptionsSubscription = parentBloc.listen((AlertsState state) {
      state.maybeWhen(
          (SubscriptionItems subscriptions) =>
              _onNewSubscriptionsAvailable(subscriptions),
          orElse: () => <void>{});
    });

    _notificationsSubscription = ApplicationServices.notifications
        .listenToNotificationsHistory()
        .listen((Iterable<ReceivedNotification> notifications) {
      if (parentBloc.state is AlertsStateData) {
        _onNewSubscriptionsAvailable(
            (parentBloc.state as AlertsStateData).subscriptions);
      }
    });

    reloadHistory();
  }

  void _onNewSubscriptionsAvailable(SubscriptionItems subscriptions) {
    if (subscriptions != null) {
      dispatch(_LoadHistoryEvent(subscriptions));
    }
  }

  static AlertsHistoryState _initialState() => AlertsHistoryState.loading();

  void reloadHistory() {
    _onNewSubscriptionsAvailable(parentBloc.state.maybeWhen(
        (SubscriptionItems subscriptions) => subscriptions,
        orElse: () => null));
  }

  void clearNotificationQty() {
    dispatch(_ClearNotificationsQtyEvent());
  }

  void removeNotification(String notificationId) {
    dispatch(_RemoveNotificationEvent(notificationId));
  }

  @override
  Stream<AlertsHistoryState> mapEventToState(_AlertsHistoryEvent event) async* {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    if (!isInitialized) {
      DateTime curr = DateTime.now();
      List<NotificationItem> history =
          await ApplicationServices.notifications.getNotificationItemHistory();
      for (NotificationItem item in history) {
        if (curr.difference(item.lastCheck).inDays < 7)
          _history[item.id] = item;
      }
      isInitialized = true;
    }

    if (event is _LoadHistoryEvent) {
      yield AlertsHistoryState.loading();

      NotificationItems notifications = await ApplicationServices.network
          .listDeviceNotifications(cancelToken: _cancelToken = CancelToken())
          .then((DeviceNotificationsResponse value) => value.notifications)
          .then((List<DeviceNotificationResult> notifications) =>
              NotificationItems.fromNetwork(notifications));

      notificationsQty = 0;

      for (NotificationItem notification in notifications.list) {
        if (!_history.containsKey(notification.id)) {
          notificationsQty = notificationsQty + 1;
        }
        _history[notification.id] = notification;
      }

      if (notificationsQty > 0)
        ApplicationServices.notifications
            .saveNotificationItem(_history.values.toList());

      List<NotificationItem> sortedItems = _history.values.toList();
      sortedItems.sort((a, b) => -a.lastCheck.compareTo(b.lastCheck));

      yield AlertsHistoryState(AlertsHistoryContent(sortedItems));
    } else if (event is _RemoveNotificationEvent) {
      _history.remove(event.notificationId);
      ApplicationServices.notifications
          .saveNotificationItem(_history.values.toList());

      List<NotificationItem> sortedItems = _history.values.toList();
      sortedItems.sort((a, b) => -a.lastCheck.compareTo(b.lastCheck));

      yield AlertsHistoryState(AlertsHistoryContent(sortedItems));
    } else if (event is _ClearNotificationsQtyEvent) {
      notificationsQty = 0;

      List<NotificationItem> sortedItems = _history.values.toList();
      sortedItems.sort((a, b) => -a.lastCheck.compareTo(b.lastCheck));

      yield AlertsHistoryState(AlertsHistoryContent(sortedItems));
    }
  }

  @override
  Future<void> close() {
    _subscriptionsSubscription?.cancel();
    _notificationsSubscription?.cancel();
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }
    return super.close();
  }
}
