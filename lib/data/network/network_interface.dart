import 'package:dio/dio.dart';
import 'package:mowgli/data/network/dio/autocompletion/model/response/autocompletion_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_calendar_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_destination_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_calendar_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_destination_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_homepage_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_offer_detail_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/add_subscription_request.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/utils/date_utils.dart';

import 'dio/subscription/model/response/device_notifications_response.dart';
import 'dio/subscription/model/response/device_subscriptions_response.dart';

abstract class NetworkService {
  Future<void> init();

  Future<bool> updatePushToken(String newToken);

  Future<DeviceNotificationsResponse> listDeviceNotifications(
      {CancelToken cancelToken});

  Future<DeviceSubscriptionsResponse> listDeviceSubscriptions(
      {CancelToken cancelToken});

  Future<String> addSubscription(
      SmartCacheBestDealRequest request,
      double currentPrice,
      String currentPriceCurrency,
      String dealId,
      SubscriptionType subscriptionType,
      {CancelToken cancelToken});

  Future<bool> updateSubscription(
      String subscriptionId,
      SmartCacheBestDealRequest request,
      double currentPrice,
      String currentPriceCurrency,
      {CancelToken cancelToken});

  Future<bool> removeSubscription(String subscriptionId,
      {CancelToken cancelToken});

  Future<AutoCompletionResponse> listAutoCompleteSuggestions(String search,
      {CancelToken cancelToken});

  Future<SmartCacheHomePageResponse> generateDefaultHomePage(
      {int imageWidth,
      CancelToken cancelToken,
      HomePageLocation location,
      Iterable<HomePageLocation> airports});

  Future<SmartCacheHomePageResponse> generateHomePageFromCity(
      String cityCode, Iterable<Location> airports,
      {int imageWidth, CancelToken cancelToken});

  Future<SmartCacheHomePageResponse> generateHomePageFromAirport(String airport,
      {int imageWidth, CancelToken cancelToken});

  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromCity(
          Location fromLocation, String cityCode, Filters filters,
          {int imageWidth, CancelToken cancelToken});

  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromAirport(
          Location fromLocation, String airportCode, Filters filters,
          {int imageWidth, CancelToken cancelToken});

  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromContinent(
          Location fromLocation, String continentCode, Filters filters,
          {int imageWidth, CancelToken cancelToken});

  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromCountry(
          Location fromLocation, String countryCode, Filters filters,
          {int imageWidth, CancelToken cancelToken});

  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromRequest(SmartCacheBestDealRequest request,
          {int imageWidth, CancelToken cancelToken});

  Future<SmartCacheCalendarResponse> getCalendar(
      SmartCacheCalendarRequest request,
      {CancelToken cancelToken});

  Future<SmartCacheDestinationResponse> getDealForDestination(
      SmartCacheDestinationRequest request,
      {int imageWidth,
      CancelToken cancelToken});

  Future<SmartCacheOfferDetailResponse> getDeal(String dealId,
      {int imageWidth, CancelToken cancelToken});
}

class NetworkCall<Req, Resp> {
  final Req request;
  final Resp response;

  NetworkCall(this.request, this.response);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkCall &&
          runtimeType == other.runtimeType &&
          request == other.request &&
          response == other.response;

  @override
  int get hashCode => request.hashCode ^ response.hashCode;
}

class NetworkDateRange {
  final DateTime start;
  final DateTime end;

  NetworkDateRange(this.start, this.end)
      : assert(start != null),
        assert(end != null);

  NetworkDateRange.year()
      : start = DateTime.now(),
        end = DateUtils.year();
}
