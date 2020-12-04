import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/add_subscription_request.dart';
import 'package:mowgli/data/notifications/notifications_interface.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_offer.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/impl/notifications_state.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/text_utils.dart';
import 'package:overlay_support/overlay_support.dart';

part 'notifications_event.dart';

class NotificationsBloc
    extends BaseBloc<_NotificationsEvent, NotificationsState> {
  CancelToken _cancelToken;
  final Request request;
  final double currentPrice;
  final String currentPriceCurrency;
  final String fromLabel;
  final String toLabel;
  final String dealId;
  final SubscriptionType subscriptionType;
  String subscriptionId;

  NotificationsBloc(
      [this.request,
      this.currentPrice,
      this.currentPriceCurrency,
      this.subscriptionType,
      this.fromLabel,
      this.toLabel,
      this.dealId])
      : super(_initialState());

  static NotificationsState _initialState() => NotificationsState.initial();

  void subscribeToNotifications(
      {Request request,
      double currentPrice,
      String currentPriceCurrency,
      String fromLabel,
      SubscriptionType subscriptionType,
      String toLabel,
      String dealId}) {
    if (request != null || this.request != null) {
      dispatch(_SubscribeToNotificationsEvent(
          request: request ?? this.request,
          currentPrice: currentPrice ?? this.currentPrice,
          currentPriceCurrency:
              currentPriceCurrency ?? this.currentPriceCurrency,
          dealId: dealId ?? this.dealId,
          subscriptionType: subscriptionType ?? this.subscriptionType,
          fromLabel: fromLabel ?? this.fromLabel,
          toLabel: toLabel ?? this.toLabel));
    }
  }

  void unsubscribeToNotifications({String subscriptionId}) {
    dispatch(_UnsubscribeToNotificationsEvent(
      subscriptionId: subscriptionId ?? this.subscriptionId,
    ));
  }

  @override
  Stream<NotificationsState> mapEventToState(_NotificationsEvent event) async* {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }
    if (event is _SubscribeToNotificationsEvent) {
      yield NotificationsState.loading();

      bool notificationsEnabled =
          await ApplicationServices.notifications.enableNotifications();

      if (notificationsEnabled == false) {
        yield NotificationsState.error(
            NotificationsErrorType.notificationsDisabled);
      } else {
        try {
          subscriptionId = await ApplicationServices.network.addSubscription(
              event.request.createBestDealRequest(),
              event.currentPrice,
              event.currentPriceCurrency,
              event.dealId,
              event.subscriptionType,
              cancelToken: _cancelToken = CancelToken());

          await ApplicationServices.notifications.addSubscription(
              NotificationSubscription(
                  subscriptionId: subscriptionId,
                  fromLabel: event.fromLabel ?? fromLabel,
                  toLabel: event.toLabel ?? toLabel,
                  request: event.request ?? request));

          showOverlayNotification(
            (context) => MessageNotification(),
            duration: const Duration(milliseconds: 4000),
          );

          yield NotificationsState(TextUtils.isNotEmpty(subscriptionId));
        } catch (err, trace) {
          logError(error: err, stackTrace: trace);
          yield NotificationsState.error(NotificationsErrorType.generic);
        }
      }
    } else if (event is _UnsubscribeToNotificationsEvent) {
      yield NotificationsState.loading();

      bool notificationsEnabled =
          await ApplicationServices.notifications.enableNotifications();

      if (notificationsEnabled == false) {
        yield NotificationsState.error(
            NotificationsErrorType.notificationsDisabled);
      } else {
        try {
          await ApplicationServices.network.removeSubscription(
              event.subscriptionId ?? subscriptionId,
              cancelToken: _cancelToken = CancelToken());

          await ApplicationServices.notifications
              .removeSubscription(event.subscriptionId ?? subscriptionId);

          yield NotificationsState.initial();
        } catch (err, trace) {
          logError(error: err, stackTrace: trace);
          yield NotificationsState.error(NotificationsErrorType.generic);
        }
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
