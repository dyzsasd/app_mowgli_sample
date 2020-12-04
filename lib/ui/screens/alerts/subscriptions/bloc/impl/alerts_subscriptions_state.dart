import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/model/alerts_subscription_data.dart';

part 'alerts_subscriptions_state.freezed.dart';

@freezed
abstract class AlertsSubscriptionsState with _$AlertsSubscriptionsState {
  factory AlertsSubscriptionsState(Iterable<AlertSubscription> subscriptions) =
      _Subscriptions;

  factory AlertsSubscriptionsState.empty() = _Empty;

  factory AlertsSubscriptionsState.loading() = _Loading;

  factory AlertsSubscriptionsState.error() = _Error;
}
