import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/screens/alerts/bloc/alerts_subscription_model.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/object_utils.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';

class AlertSubscription {
  final String subscriptionId;
  final DateTime creationDate;
  final Request rawRequest;
  final String origin;
  final List<String> destinations;
  final AlertSubscriptionDate outboundDate;
  final AlertSubscriptionDate inboundDate;
  final int notificationsCount;
  final String fromLabel;
  final String toLabel;
  final num lastPrice;
  final String lastCurrency;

  AlertSubscription._(
      {this.subscriptionId,
      this.creationDate,
      this.rawRequest,
      this.origin,
      this.destinations,
      this.outboundDate,
      this.inboundDate,
      this.notificationsCount,
      this.fromLabel,
      this.toLabel,
      this.lastPrice,
      this.lastCurrency});

  AlertSubscription.fromNetwork(SubscriptionItem subscription,
      this.notificationsCount, this.fromLabel, this.toLabel)
      : subscriptionId = subscription.subscriptionId,
        creationDate = subscription.creationDate,
        rawRequest = subscription.request,
        origin = subscription.request.origin.code,
        destinations = subscription.request.destination.codes,
        outboundDate = AlertSubscriptionDate._fromNetwork(
            subscription.rawResult.request.outboundDate,
            subscription.rawResult.request.outboundTime),
        inboundDate = AlertSubscriptionDate._fromNetwork(
            subscription.rawResult.request.inboundDate,
            subscription.rawResult.request.inboundTime),
        lastCurrency = subscription.rawResult.metadata.lastCurrency,
        lastPrice = subscription.rawResult.metadata.lastPrice;

  AlertSubscription copyWith({
    String subscriptionId,
    DateTime creationDate,
    Request rawRequest,
    String origin,
    List<String> destinations,
    AlertSubscriptionDate outboundDate,
    AlertSubscriptionDate inboundDate,
    int notificationsCount,
    String fromLabel,
    String toLabel,
    num lastPrice,
    String lastCurrency,
  }) =>
      AlertSubscription._(
        subscriptionId: subscriptionId ?? this.subscriptionId,
        creationDate: creationDate ?? this.creationDate,
        rawRequest: rawRequest ?? this.rawRequest,
        origin: origin ?? this.origin,
        destinations: destinations ?? this.destinations,
        outboundDate: outboundDate ?? this.outboundDate,
        inboundDate: inboundDate ?? this.inboundDate,
        notificationsCount: notificationsCount ?? this.notificationsCount,
        fromLabel: fromLabel ?? this.fromLabel,
        toLabel: toLabel ?? this.toLabel,
        lastPrice: lastPrice ?? this.lastPrice,
        lastCurrency: lastCurrency ?? this.lastCurrency,
      );
}

class AlertSubscriptionDate {
  final DateTime date;
  final AlertSubscriptionFlexibleDate flexibleDate;
  final DateTime time;
  final AlertSubscriptionFlexibleTime flexibleTime;

  AlertSubscriptionDate._fromNetwork(
      SmartCacheHopDate date, SmartCacheHopTime time)
      : date = date.date,
        flexibleDate = ObjectUtils.extract(
            date.flexibleDate,
            (SmartCacheFlexibleDate date) =>
                AlertSubscriptionFlexibleDate._fromNetwork(date)),
        time = time?.time,
        flexibleTime = ObjectUtils.extract(
            time?.flexibleTime,
            (SmartCacheFlexibleTime time) =>
                AlertSubscriptionFlexibleTime._fromNetwork(time));
}

class AlertSubscriptionFlexibleDate {
  final Iterable<int> dayOfWeek;
  final DateTime min;
  final DateTime max;
  final AlertSubscriptionFlexibleDateType type;

  AlertSubscriptionFlexibleDate._fromNetwork(SmartCacheFlexibleDate date)
      : dayOfWeek = ListUtils.toListFromObject(date.daysOfWeek,
            (SmartCacheDayOfWeek dayOfWeek) => _extractDay(dayOfWeek)),
        min = date.min,
        max = date.max,
        type = _extractType(date.type);

  static int _extractDay(SmartCacheDayOfWeek dayOfWeek) {
    switch (dayOfWeek) {
      case SmartCacheDayOfWeek.monday:
        return DateTime.monday;
      case SmartCacheDayOfWeek.tuesday:
        return DateTime.tuesday;
      case SmartCacheDayOfWeek.wednesday:
        return DateTime.wednesday;
      case SmartCacheDayOfWeek.thursday:
        return DateTime.thursday;
      case SmartCacheDayOfWeek.friday:
        return DateTime.friday;
      case SmartCacheDayOfWeek.saturday:
        return DateTime.saturday;
      case SmartCacheDayOfWeek.sunday:
        return DateTime.sunday;
    }

    return null;
  }

  static AlertSubscriptionFlexibleDateType _extractType(
      SmartCacheFlexibleDateType type) {
    switch (type) {
      case SmartCacheFlexibleDateType.open:
        return AlertSubscriptionFlexibleDateType.open;
      case SmartCacheFlexibleDateType.range:
        return AlertSubscriptionFlexibleDateType.range;
    }

    throw Exception('Unknown type $type!');
  }
}

enum AlertSubscriptionFlexibleDateType { open, range }

class AlertSubscriptionFlexibleTime {
  final DateTime min;
  final DateTime max;

  AlertSubscriptionFlexibleTime._fromNetwork(SmartCacheFlexibleTime time)
      : min = time.min,
        max = time.max;
}
