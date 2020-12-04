import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/item/bloc/impl/alerts_subscriptions_item_state.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/model/alerts_subscription_data.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'alerts_subscriptions_item_event.dart';

class AlertsSubscriptionsItemBloc extends BaseBloc<
    _AlertsSubscriptionsItemEvent, AlertsSubscriptionsItemState> {
  final AlertsSubscriptionsBloc parentBloc;
  AlertSubscription subscription;
  CancelToken _cancelToken;

  AlertsSubscriptionsItemBloc(this.parentBloc, AlertSubscription subscription)
      : subscription = subscription,
        super(_initialState(subscription)) {
    loadSubscriptionsList();
  }

  static AlertsSubscriptionsItemState _initialState(subscription) =>
      AlertsSubscriptionsItemState.initial(subscription);

  void loadSubscriptionsList() {
    dispatch(const _LoadSubscriptionsEvent());
  }

  void removeSubscription() {
    dispatch(_RemoveSubscriptionEvent());
  }

  void updateFilters(Filters filters) {
    dispatch(_UpdateSubscriptionFiltersEvent(filters));
  }

  @override
  Stream<AlertsSubscriptionsItemState> mapEventToState(
      _AlertsSubscriptionsItemEvent event) async* {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    if (event is _RemoveSubscriptionEvent) {
      yield* _removeSubscription();
    } else if (event is _UpdateSubscriptionFiltersEvent) {
      yield* _updateSubscription(event);
    }
  }

  Stream<AlertsSubscriptionsItemState> _removeSubscription() async* {
    yield AlertsSubscriptionsItemState.loading(subscription);

    try {
      await ApplicationServices.network.removeSubscription(
          subscription.subscriptionId,
          cancelToken: _cancelToken = CancelToken());

      parentBloc.forceReloadSubscriptions();

      // The parent will automatically update us
    } catch (err, trace) {
      logError(
          message: 'Remove subscription failed', error: err, stackTrace: trace);
      yield AlertsSubscriptionsItemState.error(
          subscription, AlertsSubscriptionsItemStateError.remove);
    }
  }

  Stream<AlertsSubscriptionsItemState> _updateSubscription(
      _UpdateSubscriptionFiltersEvent event) async* {
    yield AlertsSubscriptionsItemState.loading(subscription);

    try {
      SmartCacheBestDealRequest bestDealRequest = subscription.rawRequest
          .updateWithFilters(event.filters)
          .createBestDealRequest();

      await ApplicationServices.network.updateSubscription(
          subscription.subscriptionId,
          bestDealRequest,
          subscription.lastPrice,
          subscription.lastCurrency,
          cancelToken: _cancelToken = CancelToken());

      yield AlertsSubscriptionsItemState(subscription = subscription.copyWith(
          rawRequest: RequestUtils.fromBestDealRequest(bestDealRequest)));
    } catch (err, trace) {
      logError(
          message: 'Update subscription failed', error: err, stackTrace: trace);

      yield AlertsSubscriptionsItemState.error(
          subscription, AlertsSubscriptionsItemStateError.edit);
    }
  }

  @override
  Future<void> close() {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    return super.close();
  }
}
