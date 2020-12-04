import 'package:dio/dio.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/add_subscription_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/update_push_token_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/update_subscription_request.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_notifications_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscription_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_subscriptions_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/device_update_subscription_response.dart';
import 'package:mowgli/data/network/dio/subscription/model/response/update_push_token_response.dart';
import 'package:retrofit/retrofit.dart';

part 'subscription_api.g.dart';

@RestApi()
abstract class RestSubscriptionAPI {
  factory RestSubscriptionAPI(Dio dio, {String baseUrl}) = _RestSubscriptionAPI;

  @PUT('/device/token')
  Future<UpdatePushTokenResponse> updatePushToken(
      @Body() UpdatePushTokenRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @GET('/notifications/')
  Future<DeviceNotificationsResponse> listDeviceNotifications(
      @Query('device_id') String deviceId,
      {@CancelRequest() CancelToken cancelToken});

  @GET('/subscription/')
  Future<DeviceSubscriptionsResponse> listDeviceSubscriptions(
      @Query('device_id') String deviceId,
      {@CancelRequest() CancelToken cancelToken});

  @POST('/subscription/')
  Future<DeviceSubscriptionResponse> addSubscription(
      @Body() AddSubscriptionRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @POST('/subscription/{subscriptionId}')
  Future<DeviceUpdateSubscriptionResponse> updateSubscription(
      @Path('subscriptionId') String subscriptionId,
      @Query('device_id') String deviceId,
      @Body() UpdateSubscriptionRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @DELETE('/subscription/')
  Future<DeviceSubscriptionResponse> removeSubscriptions(
      @Query('device_id') String deviceId,
      @Query('subscription_ids') String ids,
      {@CancelRequest() CancelToken cancelToken});
}
