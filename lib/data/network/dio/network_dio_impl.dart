import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ip_geolocation_api/ip_geolocation_api.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/autocompletion/autocompletion_api.dart';
import 'package:mowgli/data/network/dio/autocompletion/model/response/autocompletion_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_calendar_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_destination_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_homepage_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_calendar_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_destination_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_homepage_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_offer_detail_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/data/network/dio/smartcache/smartcache_api.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/add_subscription_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/update_push_token_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/update_subscription_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_notifications_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscription_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscriptions_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_update_subscription_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/update_push_token_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/subscription_model.dart';
import 'package:mowgli/data/network/dio/subscription/subscription_api.dart';
import 'package:mowgli/data/network/network_interface.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/utils/app_utils.dart';
import 'package:mowgli/utils/date_utils.dart';
import 'package:mowgli/utils/platform_utils.dart';

class NetworkDioImpl extends NetworkService {
  Dio _dio;
  RestSubscriptionAPI _subscriptionAPI;
  RestAutoCompletionAPI _autoCompletionAPI;
  RestSmartCacheAPI _smartCacheAPI;

  NetworkDioImpl();

  @override
  Future<void> init() async {
    _dio = Dio(BaseOptions(
        contentType: ContentType.json.value,
        followRedirects: true,
        maxRedirects: 10,
        connectTimeout: const Duration(seconds: 15).inMilliseconds,
        receiveTimeout: const Duration(seconds: 15).inMilliseconds,
        sendTimeout: const Duration(seconds: 15).inMilliseconds,
        headers: await _defaultHeaders));

    if (env.isADebugBuild) {
      _dio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          logPrint: (Object object) => _logDebug(object?.toString())));
    }

    _subscriptionAPI =
        RestSubscriptionAPI(_dio, baseUrl: env.subscriptionAPIUrl);
    _autoCompletionAPI =
        RestAutoCompletionAPI(_dio, baseUrl: env.autocompletionAPIUrl);
    _smartCacheAPI = RestSmartCacheAPI(_dio, baseUrl: env.smartCacheAPIUrl);
  }

  @override
  Future<bool> updatePushToken(String newToken,
      {CancelToken cancelToken}) async {
    assert(_subscriptionAPI != null);
    return _subscriptionAPI
        .updatePushToken(
            UpdatePushTokenRequest(
                deviceId: await PlatformUtils.deviceUniqueId, token: newToken),
            cancelToken: cancelToken)
        .then((UpdatePushTokenResponse resp) => resp.value);
  }

  @override
  Future<DeviceNotificationsResponse> listDeviceNotifications(
      {CancelToken cancelToken}) async {
    assert(_subscriptionAPI != null);
    return _subscriptionAPI.listDeviceNotifications(
        await PlatformUtils.deviceUniqueId,
        cancelToken: cancelToken);
  }

  @override
  Future<DeviceSubscriptionsResponse> listDeviceSubscriptions(
      {CancelToken cancelToken}) async {
    assert(_subscriptionAPI != null);
    return _subscriptionAPI.listDeviceSubscriptions(
        await PlatformUtils.deviceUniqueId,
        cancelToken: cancelToken);
  }

  @override
  Future<String> addSubscription(
      SmartCacheBestDealRequest request,
      double currentPrice,
      String currentPriceCurrency,
      String dealId,
      SubscriptionType subscriptionType,
      {CancelToken cancelToken}) async {
    assert(_subscriptionAPI != null);
    return _subscriptionAPI
        .addSubscription(AddSubscriptionRequest(
            deviceId: await PlatformUtils.deviceUniqueId,
            request: request,
            offerId:
                subscriptionType == SubscriptionType.dealFollow ? dealId : null,
            metadata: SubscriptionMetadata(
                lastPrice: currentPrice,
                lastCurrency: currentPriceCurrency,
                lastDeal: dealId),
            subscriptionType: subscriptionType))
        .then((DeviceSubscriptionResponse resp) =>
            resp?.subscription?.subscriptionId);
  }

  @override
  Future<bool> updateSubscription(
      String subscriptionId,
      SmartCacheBestDealRequest request,
      double currentPrice,
      String currentPriceCurrency,
      {CancelToken cancelToken}) async {
    assert(_subscriptionAPI != null);
    return _subscriptionAPI
        .updateSubscription(
          subscriptionId,
          await PlatformUtils.deviceUniqueId,
          UpdateSubscriptionRequest(
            request: request,
            metadata: SubscriptionMetadata(
                lastPrice: currentPrice, lastCurrency: currentPriceCurrency),
          ),
        )
        .then((DeviceUpdateSubscriptionResponse resp) => resp.value);
  }

  @override
  Future<bool> removeSubscription(String subscriptionId,
      {CancelToken cancelToken}) async {
    assert(_subscriptionAPI != null);
    return _subscriptionAPI
        .removeSubscriptions(await PlatformUtils.deviceUniqueId, subscriptionId,
            cancelToken: cancelToken)
        .then((DeviceSubscriptionResponse value) => true);
  }

  @override
  Future<SmartCacheHomePageResponse> generateDefaultHomePage(
      {int imageWidth,
      CancelToken cancelToken,
      HomePageLocation location,
      Iterable<HomePageLocation> airports}) async {
    assert(_smartCacheAPI != null);
    Iterable<SmartCacheRequestOrigin> _airports;
    if (location != null && airports != null) {
      _airports = airports.map((HomePageLocation item) =>
          SmartCacheRequestOrigin(
              type: SmartCacheRequestOriginType.airport,
              code: item.code,
              codeTypes: SmartCacheCodeType.iata));
    }
    return GeolocationAPI.getData()
        .then((GeolocationData geoloc) => geoloc?.ip)
        .then((String ip) => _smartCacheAPI.homePage(
            SmartCacheHomePageRequest(
                origin: location != null
                    ? SmartCacheRequestOrigin(
                        type: SmartCacheRequestOriginType.city,
                        code: location.code,
                        customerLocations: _airports)
                    : SmartCacheRequestOrigin(
                        type: SmartCacheRequestOriginType.ip, code: ip ?? ''),
                locale: PlatformUtils.platformLanguage,
                imageWidth: imageWidth),
            cancelToken: cancelToken));
  }

  @override
  Future<SmartCacheHomePageResponse> generateHomePageFromCity(
      String cityCode, Iterable<Location> airports,
      {int imageWidth, CancelToken cancelToken}) async {
    assert(_smartCacheAPI != null);
    Iterable<SmartCacheRequestOrigin> _airports = airports?.map(
        (Location item) => SmartCacheRequestOrigin(
            type: SmartCacheRequestOriginType.airport,
            code: item.code,
            codeTypes: SmartCacheCodeType.iata));
    return _smartCacheAPI.homePage(
        SmartCacheHomePageRequest(
            origin: SmartCacheRequestOrigin(
                type: SmartCacheRequestOriginType.city,
                code: cityCode,
                customerLocations: _airports),
            locale: PlatformUtils.platformLanguage,
            imageWidth: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<SmartCacheHomePageResponse> generateHomePageFromAirport(String airport,
      {int imageWidth, CancelToken cancelToken}) async {
    assert(_smartCacheAPI != null);
    return _smartCacheAPI.homePage(
        SmartCacheHomePageRequest(
            origin: SmartCacheRequestOrigin(
                type: SmartCacheRequestOriginType.airport, code: airport),
            locale: PlatformUtils.platformLanguage,
            imageWidth: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<SmartCacheOfferDetailResponse> getDeal(String dealId,
      {int imageWidth, CancelToken cancelToken}) {
    assert(_smartCacheAPI != null);
    return _smartCacheAPI.offerDetail(dealId, true,
        thumbnail: imageWidth,
        locale: PlatformUtils.platformLanguage,
        cancelToken: cancelToken);
  }

  @override
  Future<SmartCacheDestinationResponse> getDealForDestination(
      SmartCacheDestinationRequest request,
      {int imageWidth,
      CancelToken cancelToken}) {
    assert(_smartCacheAPI != null);
    return _smartCacheAPI.findDestination(
        request.copyWith(imageSize: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<SmartCacheCalendarResponse> getCalendar(
      SmartCacheCalendarRequest request,
      {CancelToken cancelToken}) {
    assert(_smartCacheAPI != null);
    return _smartCacheAPI.calendar(request, cancelToken: cancelToken);
  }

  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      _listBestDeals(SmartCacheBestDealRequest request,
          {CancelToken cancelToken}) async {
    assert(_smartCacheAPI != null);
    return NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>(
        request,
        await _smartCacheAPI.findBestDeal(
            request.copyWith(locale: PlatformUtils.platformLanguage),
            cancelToken: cancelToken));
  }

  @override
  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromAirport(
          Location fromLocation, String airportCode, Filters filters,
          {int imageWidth, CancelToken cancelToken}) {
    return _listBestDeals(
        _generateFromFilters(
            origin: fromLocation,
            destination: SmartCacheRequestDestination(
                codes: <String>[airportCode],
                type: SmartCacheRequestDestinationType.airport),
            filters: filters,
            imageWidth: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromCity(
          Location fromLocation, String cityCode, Filters filters,
          {int imageWidth, CancelToken cancelToken}) {
    return _listBestDeals(
        _generateFromFilters(
            origin: fromLocation,
            destination: SmartCacheRequestDestination(
                codes: <String>[cityCode],
                type: SmartCacheRequestDestinationType.city),
            filters: filters,
            imageWidth: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromContinent(
          Location fromLocation, String continentId, Filters filters,
          {int imageWidth, CancelToken cancelToken}) {
    return _listBestDeals(
        _generateFromFilters(
            origin: fromLocation,
            destination: SmartCacheRequestDestination(
                codes: <String>[continentId],
                type: SmartCacheRequestDestinationType.continent),
            filters: filters,
            imageWidth: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromCountry(
          Location fromLocation, String countryId, Filters filters,
          {int imageWidth, CancelToken cancelToken}) {
    return _listBestDeals(
        _generateFromFilters(
            origin: fromLocation,
            destination: SmartCacheRequestDestination(
                codes: <String>[countryId],
                type: SmartCacheRequestDestinationType.country),
            filters: filters,
            imageWidth: imageWidth),
        cancelToken: cancelToken);
  }

  @override
  Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
      listBestDealsFromRequest(SmartCacheBestDealRequest request,
          {int imageWidth, CancelToken cancelToken}) {
    if (imageWidth != null) {
      return _listBestDeals(request.copyWith(imageSize: imageWidth),
          cancelToken: cancelToken);
    } else {
      return _listBestDeals(request, cancelToken: cancelToken);
    }
  }

  @override
  Future<AutoCompletionResponse> listAutoCompleteSuggestions(String search,
      {CancelToken cancelToken}) {
    assert(_autoCompletionAPI != null);
    return _autoCompletionAPI.getAutocompletionFor(
        search, PlatformUtils.platformLanguage,
        cancelToken: cancelToken);
  }

  void _logDebug(String message) {
    if (message != null) {
      ApplicationServices.logs.debug(tag: 'Network', message: message);
    }
  }

  Future<Map<String, Object>> get _defaultHeaders async => <String, Object>{
        'apikey': env.requestsApiKey,
        'device_id': await PlatformUtils.deviceUniqueId,
        'device_platform': PlatformUtils.platformName,
        'device_locale': PlatformUtils.platformLanguage,
        'app_version': await AppUtils.appVersion
      };

  SmartCacheBestDealRequest _generateFromFilters(
      {Location origin,
      SmartCacheRequestDestination destination,
      Filters filters,
      int imageWidth}) {
    int stopOvers;
    if (filters?.stopOvers != null) {
      if (filters.stopOvers.many == true) {
        stopOvers = 99;
      } else if (filters.stopOvers.one == true) {
        stopOvers = 1;
      } else if (filters.stopOvers.direct == true) {
        stopOvers = 0;
      }
    }

    SmartCacheHopDate outBoundDate;
    SmartCacheHopTime outBoundTime;

    SmartCacheHopDate inBoundDate;
    SmartCacheHopTime inBoundTime;

    SmartCacheJourneyDays journeyDays;

    if (filters?.dates == null) {
      outBoundDate = SmartCacheHopDate(
          date: DateTime.now(), type: SmartCacheHopDateType.departure);
      outBoundTime = SmartCacheHopTime(
          time: DateTime.now(), type: SmartCacheHopTimeType.departure);

      inBoundDate = SmartCacheHopDate(
          date: DateTime.now().addYear(), type: SmartCacheHopDateType.arrival);
      inBoundTime = SmartCacheHopTime(
          time: DateTime.now().addYear(), type: SmartCacheHopTimeType.arrival);
    } else if (filters?.dates?.flexibleDates != null) {
      outBoundDate = SmartCacheHopDate(
          flexibleDate: SmartCacheFlexibleDate(
              min: filters.dates.flexibleDates.fromDate,
              max: filters.dates.flexibleDates.toDate,
              type: SmartCacheFlexibleDateType.range),
          type: SmartCacheHopDateType.departure);
      outBoundTime = SmartCacheHopTime(
          flexibleTime: SmartCacheFlexibleTime(
              min: DateTime.now().minTime(), max: DateTime.now().maxTime()),
          type: SmartCacheHopTimeType.departure);

      inBoundDate = SmartCacheHopDate(
          flexibleDate: outBoundDate.flexibleDate,
          type: SmartCacheHopDateType.arrival);
      inBoundTime = SmartCacheHopTime(
          flexibleTime: outBoundTime.flexibleTime,
          type: SmartCacheHopTimeType.arrival);

      journeyDays = SmartCacheJourneyDays(
          flexibleJourneyDays: SmartCacheFlexibleJourneyDays(
              min: filters.dates.flexibleDates.minDuration,
              max: filters.dates.flexibleDates.maxDuration));
    }

    return SmartCacheBestDealRequest(
        destination: destination,
        origin: _originFromLocation(origin),
        outboundDate: outBoundDate,
        outboundTime: outBoundTime,
        inboundDate: inBoundDate,
        inboundTime: inBoundTime,
        journeyDays: journeyDays,
        maxStopOvers: stopOvers,
        orderBy: SmartCacheBestDealRequestOrderMetric.price,
        type: SmartCacheJourneyType.roundTrip,
        budget: filters?.budget?.max?.toDouble(),
        imageSize: imageWidth);
  }

  SmartCacheRequestOrigin _originFromLocation(Location location) {
    SmartCacheRequestOriginType type;

    switch (location.type) {
      case LocationType.airport:
        type = SmartCacheRequestOriginType.airport;
        break;
      case LocationType.city:
        type = SmartCacheRequestOriginType.city;
        break;
      case LocationType.category:
      case LocationType.continent:
      case LocationType.country:
        // TODO
        type = SmartCacheRequestOriginType.city;
        break;
    }

    return SmartCacheRequestOrigin(code: location.code, type: type);
  }
}
