import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/model/alerts_subscription_data.dart';

part 'alerts_subscriptions_item_state.freezed.dart';

@freezed
abstract class AlertsSubscriptionsItemState
    with _$AlertsSubscriptionsItemState {
  const AlertsSubscriptionsItemState._();

  factory AlertsSubscriptionsItemState(AlertSubscription subscription) =
      _Subscriptions;

  factory AlertsSubscriptionsItemState.initial(AlertSubscription subscription) =
      _Initial;

  factory AlertsSubscriptionsItemState.loading(AlertSubscription subscription) =
      _Loading;

  factory AlertsSubscriptionsItemState.error(AlertSubscription subscription,
      AlertsSubscriptionsItemStateError type) = _Error;

  bool get isLoading => this is _Loading;

  bool get hasError => this is _Error;
}

enum AlertsSubscriptionsItemStateError { remove, edit }
