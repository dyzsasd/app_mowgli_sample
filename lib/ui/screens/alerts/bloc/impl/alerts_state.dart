import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_subscription_model.dart';

part 'alerts_state.freezed.dart';

@freezed
abstract class AlertsState with _$AlertsState {

  const AlertsState._();

  factory AlertsState(SubscriptionItems subscriptions) = AlertsStateData;

  const factory AlertsState.loading() = _Loading;

  const factory AlertsState.error() = _Error;

  bool get hasError => this is _Error;
}
