part of 'notifications_bloc_impl.dart';

abstract class _NotificationsEvent {
  const _NotificationsEvent();
}

class _SubscribeToNotificationsEvent extends _NotificationsEvent {
  final Request request;
  final double currentPrice;
  final String currentPriceCurrency;
  final String fromLabel;
  final String toLabel;
  final String dealId;
  final SubscriptionType subscriptionType;

  _SubscribeToNotificationsEvent(
      {@required this.request,
      @required this.currentPrice,
      @required this.currentPriceCurrency,
      @required this.fromLabel,
      @required this.subscriptionType,
      @required this.toLabel,
      @required this.dealId});
}

class _UnsubscribeToNotificationsEvent extends _NotificationsEvent {
  final String subscriptionId;

  _UnsubscribeToNotificationsEvent({@required this.subscriptionId});
}
