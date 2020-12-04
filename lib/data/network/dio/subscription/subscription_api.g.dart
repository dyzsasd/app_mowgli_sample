// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestSubscriptionAPI implements RestSubscriptionAPI {
  _RestSubscriptionAPI(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UpdatePushTokenResponse> updatePushToken(request,
      {cancelToken}) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/device/token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = UpdatePushTokenResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DeviceNotificationsResponse> listDeviceNotifications(deviceId,
      {cancelToken}) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'device_id': deviceId};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/notifications/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = DeviceNotificationsResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DeviceSubscriptionsResponse> listDeviceSubscriptions(deviceId,
      {cancelToken}) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'device_id': deviceId};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/subscription/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = DeviceSubscriptionsResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DeviceSubscriptionResponse> addSubscription(request,
      {cancelToken}) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/subscription/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = DeviceSubscriptionResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DeviceUpdateSubscriptionResponse> updateSubscription(
      subscriptionId, deviceId, request,
      {cancelToken}) async {
    ArgumentError.checkNotNull(subscriptionId, 'subscriptionId');
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'device_id': deviceId};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/subscription/$subscriptionId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = DeviceUpdateSubscriptionResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DeviceSubscriptionResponse> removeSubscriptions(deviceId, ids,
      {cancelToken}) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(ids, 'ids');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'device_id': deviceId,
      r'subscription_ids': ids
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/subscription/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = DeviceSubscriptionResponse.fromJson(_result.data);
    return value;
  }
}
