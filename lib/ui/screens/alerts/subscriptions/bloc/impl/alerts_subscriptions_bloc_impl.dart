import 'dart:async';

import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_bloc.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_subscription_model.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/impl/alerts_subscriptions_state.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/model/alerts_subscription_data.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';

part 'alerts_subscriptions_event.dart';

class AlertsSubscriptionsBloc
    extends BaseBloc<_AlertsSubscriptionsEvent, AlertsSubscriptionsState> {
  final AlertsBloc parentBloc;
  StreamSubscription<AlertsState> _subscriptionsSubscription;
  StreamSubscription<Iterable<ReceivedNotification>> _notificationsSubscription;

  AlertsSubscriptionsBloc(this.parentBloc) : super(_initialState()) {
    _subscriptionsSubscription = parentBloc.listen((AlertsState state) {
      state.maybeWhen(
          (SubscriptionItems subscriptions) => _onNewSubscriptionsAvailable(),
          error: () => _onParentError(),
          orElse: () => <void>{});
    });

    _notificationsSubscription = ApplicationServices.notifications
        .listenToNotificationsHistory()
        .listen((Iterable<ReceivedNotification> notifications) {
      if (parentBloc.state is AlertsStateData) {
        _onNewSubscriptionsAvailable();
      }
    });

    reloadHistory();
  }

  void _onNewSubscriptionsAvailable() {
    dispatch(_LoadListEvent());
  }

  void _onParentError() {
    dispatch(_ParentErrorEvent());
  }

  void reloadHistory() {
    _onNewSubscriptionsAvailable();
  }

  void forceReloadSubscriptions() {
    parentBloc.loadList();
  }

  static AlertsSubscriptionsState _initialState() =>
      AlertsSubscriptionsState.loading();

  @override
  Stream<AlertsSubscriptionsState> mapEventToState(
      _AlertsSubscriptionsEvent event) async* {
    if (event is _LoadListEvent) {
      yield AlertsSubscriptionsState.loading();

      try {
        List<AlertSubscription> subscriptions = <AlertSubscription>[];

        SubscriptionItems subscriptionItems = parentBloc.state.maybeWhen(
            (SubscriptionItems subscriptions) => subscriptions,
            orElse: () => null);

        Iterable<ReceivedNotification> notifications =
            await ApplicationServices.notifications.getNotificationsHistory();

        if (subscriptionItems != null) {
          for (SubscriptionItem subscription in subscriptionItems.list) {
            NotificationSubscription notificationSubscription =
                await ApplicationServices.notifications
                    .getSubscription(subscription.subscriptionId);

            if (notificationSubscription != null) {
              subscriptions.add(AlertSubscription.fromNetwork(
                subscription,
                notifications
                    .where((ReceivedNotification notif) =>
                        notif.subscriptionId == subscription.subscriptionId)
                    .length,
                notificationSubscription.fromLabel,
                notificationSubscription.toLabel,
              ));
            }
          }
        }

        if (IterableUtils.isEmpty(subscriptions)) {
          yield AlertsSubscriptionsState.empty();
        } else {
          yield AlertsSubscriptionsState(subscriptions);
        }
      } catch (err, trace) {
        logError(
            message: 'List subscriptions failed',
            error: err,
            stackTrace: trace);
        yield AlertsSubscriptionsState.error();
      }
    } else if (event is _ParentErrorEvent) {
      yield AlertsSubscriptionsState.error();
    }
  }

  @override
  Future<void> close() {
    _subscriptionsSubscription?.cancel();
    _notificationsSubscription?.cancel();
    return super.close();
  }
}
