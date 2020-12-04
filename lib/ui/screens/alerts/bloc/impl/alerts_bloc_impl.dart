import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscription_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscriptions_response.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_subscription_model.dart';
import 'package:mowgli/ui/screens/alerts/bloc/impl/alerts_state.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'alerts_event.dart';

class AlertsBloc extends BaseBloc<_AlertsEvent, AlertsState> {
  CancelToken _cancelToken;

  AlertsBloc() : super(_initialState()) {
    loadList();
  }

  static AlertsState _initialState() => AlertsState.loading();

  void loadList() {
    dispatch(const _ListSubscriptions());
  }

  @override
  Stream<AlertsState> mapEventToState(_AlertsEvent event) async* {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    if (event is _ListSubscriptions) {
      yield AlertsState.loading();

      try {
        SubscriptionItems subscriptions = await ApplicationServices.network
            .listDeviceSubscriptions(cancelToken: _cancelToken = CancelToken())
            .then((DeviceSubscriptionsResponse value) => value.subscriptions)
            .then((List<DeviceSubscriptionResult> subscriptions) =>
                SubscriptionItems.fromNetwork(subscriptions));

        await ApplicationServices.notifications.clearObsoleteSubscriptions(
            subscriptions.list.map((SubscriptionItem subscription) =>
                subscription.subscriptionId));

        yield AlertsState(subscriptions);
      } catch (err, trace) {
        logError(
            message: 'List subscription failed', error: err, stackTrace: trace);
        yield AlertsState.error();
      }
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
