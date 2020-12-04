import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

enum RequestSortOrder { popularity, price, freshness }

class RequestSortOrderUtils {
  const RequestSortOrderUtils._();

  static RequestSortOrder extractSortOrder(
      SmartCacheBestDealRequestOrderMetric sortOrder) {
    if (sortOrder == null) {
      return null;
    }

    switch (sortOrder) {
      case SmartCacheBestDealRequestOrderMetric.popularity:
        return RequestSortOrder.popularity;
      case SmartCacheBestDealRequestOrderMetric.price:
        return RequestSortOrder.price;
      case SmartCacheBestDealRequestOrderMetric.freshness:
        return RequestSortOrder.freshness;
      default:
        return null;
    }
  }

  static SmartCacheBestDealRequestOrderMetric toBestDeal(
      RequestSortOrder sortOrder) {
    if (sortOrder == null) {
      return null;
    }

    switch (sortOrder) {
      case RequestSortOrder.popularity:
        return SmartCacheBestDealRequestOrderMetric.popularity;
      case RequestSortOrder.price:
        return SmartCacheBestDealRequestOrderMetric.price;
      case RequestSortOrder.freshness:
        return SmartCacheBestDealRequestOrderMetric.freshness;
      default:
        return null;
    }
  }
}
