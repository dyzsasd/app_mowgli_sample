import 'package:mowgli/data/network/dio/subscription/model/response/device_notification_response.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

class NotificationItems {
  final Map<String, NotificationItem> _items;

  NotificationItems.empty() : _items = <String, NotificationItem>{};

  NotificationItems.fromNetwork(Iterable<DeviceNotificationResult> resp)
      : _items = _extractNotifications(resp);

  static Map<String, NotificationItem> _extractNotifications(
      Iterable<DeviceNotificationResult> resp) {
    Map<String, NotificationItem> notifications = <String, NotificationItem>{};

    if (resp != null) {
      for (DeviceNotificationResult notification in resp) {
        String key = notification.id;
        notifications[key] = NotificationItem.fromNetwork(notification);
      }
    }

    return notifications;
  }

  NotificationItem operator [](String subscriptionId) => _items[subscriptionId];

  Iterable<NotificationItem> get list => _items.values;
}

class NotificationItem {
  final String id;
  final String title;
  final String description;
  final String departureCity;
  final String arrivalCity;
  final String deviceId;
  final String subscriptionId;
  final String offerId;
  final String currency;
  final double price;
  final DateTime lastCheck;
  final DateTime outboundDate;
  final DateTime inboundDate;
  final Request request;

  NotificationItem._(
      {this.id,
      this.title,
      this.description,
      this.departureCity,
      this.arrivalCity,
      this.deviceId,
      this.subscriptionId,
      this.offerId,
      this.currency,
      this.price,
      this.lastCheck,
      this.outboundDate,
      this.inboundDate,
      this.request});

  NotificationItem.fromNetwork(DeviceNotificationResult resp)
      : id = resp.id,
        subscriptionId = resp.subscriptionId,
        title = resp.title,
        description = resp.description,
        departureCity = resp.departureCity,
        arrivalCity = resp.arrivalCity,
        deviceId = resp.deviceId,
        offerId = resp.offerId,
        currency = resp.currency,
        price = resp.price,
        lastCheck = resp.lastCheck,
        outboundDate = resp.outboundDate,
        inboundDate = resp.inboundDate,
        request = RequestUtils.fromBestDealRequest(resp.request);

  NotificationItem updateNotificationId(String subscriptionId) =>
      NotificationItem._(subscriptionId: subscriptionId);

  NotificationItem(
      {this.id,
      this.title,
      this.description,
      this.departureCity,
      this.arrivalCity,
      this.deviceId,
      this.subscriptionId,
      this.offerId,
      this.currency,
      this.price,
      this.lastCheck,
      this.outboundDate,
      this.inboundDate,
      this.request});
}
