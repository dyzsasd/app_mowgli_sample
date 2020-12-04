// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestSmartCacheAPI implements RestSmartCacheAPI {
  _RestSmartCacheAPI(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<SmartCacheHomePageResponse> homePage(request, {cancelToken}) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/home_page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = SmartCacheHomePageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SmartCacheBestDealResponse> findBestDeal(request,
      {cancelToken}) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/best_deal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = SmartCacheBestDealResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SmartCacheDestinationResponse> findDestination(request,
      {cancelToken}) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/destination',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = SmartCacheDestinationResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SmartCacheCalendarResponse> calendar(request, {cancelToken}) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/calendar',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = SmartCacheCalendarResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SmartCacheOfferDetailResponse> offerDetail(offerId, includeSections,
      {thumbnail, locale, cancelToken}) async {
    ArgumentError.checkNotNull(offerId, 'offerId');
    ArgumentError.checkNotNull(includeSections, 'includeSections');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'with_reco': includeSections,
      r'avatar_width': thumbnail,
      r'locale': locale
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/offer_detail/$offerId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = SmartCacheOfferDetailResponse.fromJson(_result.data);
    return value;
  }
}
