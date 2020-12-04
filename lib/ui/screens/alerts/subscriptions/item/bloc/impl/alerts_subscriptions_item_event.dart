part of 'alerts_subscriptions_item_bloc_impl.dart';

abstract class _AlertsSubscriptionsItemEvent {
  const _AlertsSubscriptionsItemEvent();
}

class _LoadSubscriptionsEvent extends _AlertsSubscriptionsItemEvent {
  const _LoadSubscriptionsEvent();
}

class _RemoveSubscriptionEvent extends _AlertsSubscriptionsItemEvent {
  const _RemoveSubscriptionEvent();
}

class _UpdateSubscriptionFiltersEvent extends _AlertsSubscriptionsItemEvent {
  final Filters filters;

  _UpdateSubscriptionFiltersEvent(this.filters);
}
