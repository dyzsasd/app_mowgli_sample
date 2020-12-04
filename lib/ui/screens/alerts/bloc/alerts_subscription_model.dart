import 'package:mowgli/data/network/dio/subscription/model/response/device_subscription_response.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

class SubscriptionItems {
  final Map<String, SubscriptionItem> _items;

  SubscriptionItems.empty() : _items = <String, SubscriptionItem>{};

  SubscriptionItems.fromNetwork(Iterable<DeviceSubscriptionResult> resp)
      : _items = _extractSubscriptions(resp);

  static Map<String, SubscriptionItem> _extractSubscriptions(
      Iterable<DeviceSubscriptionResult> resp) {
    Map<String, SubscriptionItem> subscriptions = <String, SubscriptionItem>{};

    if (resp != null) {
      for (DeviceSubscriptionResult subscription in resp) {
        subscriptions[subscription.subscriptionId] =
            SubscriptionItem.fromNetwork(subscription);
      }
    }

    return subscriptions;
  }

  SubscriptionItem operator [](String subscriptionId) => _items[subscriptionId];

  Iterable<SubscriptionItem> get list => _items.values;
}

class SubscriptionItem {
  final String subscriptionId;
  final DateTime creationDate;
  final Request request;
  final DeviceSubscriptionResult rawResult;

  SubscriptionItem._(
      {this.subscriptionId, this.creationDate, this.request, this.rawResult});

  SubscriptionItem.fromNetwork(DeviceSubscriptionResult resp)
      : subscriptionId = resp.subscriptionId,
        creationDate = resp.creationDate,
        request = RequestUtils.fromBestDealRequest(resp.request),
        rawResult = resp;

  SubscriptionItem updateSubscriptionId(String subscriptionId) =>
      SubscriptionItem._(
          subscriptionId: subscriptionId,
          creationDate: creationDate,
          request: request,
          rawResult: rawResult);
}
