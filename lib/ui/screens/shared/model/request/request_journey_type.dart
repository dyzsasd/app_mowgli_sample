import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

enum RequestJourneyType { roundTrip, oneWay }

class RequestJourneyTypeUtils {
  const RequestJourneyTypeUtils._();

  static RequestJourneyType extractJourneyType(
      SmartCacheJourneyType journeyType) {
    if (journeyType == null) {
      return RequestJourneyType.roundTrip;
    }

    switch (journeyType) {
      case SmartCacheJourneyType.oneWay:
        return RequestJourneyType.oneWay;
      case SmartCacheJourneyType.roundTrip:
      default:
        return RequestJourneyType.roundTrip;
    }
  }

  static SmartCacheJourneyType toBestDeal(RequestJourneyType journeyType) {
    if (journeyType == null) {
      return SmartCacheJourneyType.roundTrip;
    }

    switch (journeyType) {
      case RequestJourneyType.oneWay:
        return SmartCacheJourneyType.oneWay;
      case RequestJourneyType.roundTrip:
      default:
        return SmartCacheJourneyType.roundTrip;
    }
  }
}
