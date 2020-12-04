part of 'alerts_history_bloc_impl.dart';

abstract class _AlertsHistoryEvent {
  const _AlertsHistoryEvent();
}

class _LoadHistoryEvent extends _AlertsHistoryEvent {
  final SubscriptionItems subscriptions;

  const _LoadHistoryEvent(this.subscriptions);
}

class _RemoveNotificationEvent extends _AlertsHistoryEvent {
  final String notificationId;

  _RemoveNotificationEvent(this.notificationId);
}

class _ClearNotificationsQtyEvent extends _AlertsHistoryEvent {
  _ClearNotificationsQtyEvent();
}
