part of 'alerts_subscriptions_bloc_impl.dart';

abstract class _AlertsSubscriptionsEvent {
  const _AlertsSubscriptionsEvent();
}

class _LoadListEvent extends _AlertsSubscriptionsEvent {
  const _LoadListEvent();
}

class _ParentErrorEvent extends _AlertsSubscriptionsEvent {
  const _ParentErrorEvent();
}
