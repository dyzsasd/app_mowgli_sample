import 'package:dio/dio.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_calendar_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_destination_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_homepage_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_calendar_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_destination_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_homepage_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_offer_detail_response.dart';
import 'package:retrofit/retrofit.dart';

part 'smartcache_api.g.dart';

@RestApi()
abstract class RestSmartCacheAPI {
  factory RestSmartCacheAPI(Dio dio, {String baseUrl}) = _RestSmartCacheAPI;

  @POST('/home_page')
  Future<SmartCacheHomePageResponse> homePage(
      @Body() SmartCacheHomePageRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @POST('/best_deal')
  Future<SmartCacheBestDealResponse> findBestDeal(
      @Body() SmartCacheBestDealRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @POST('/destination')
  Future<SmartCacheDestinationResponse> findDestination(
      @Body() SmartCacheDestinationRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @POST('/calendar')
  Future<SmartCacheCalendarResponse> calendar(
      @Body() SmartCacheCalendarRequest request,
      {@CancelRequest() CancelToken cancelToken});

  @GET('/offer_detail/{id}')
  Future<SmartCacheOfferDetailResponse> offerDetail(
      @Path('id') String offerId, @Query('with_reco') bool includeSections,
      {@Query('avatar_width') int thumbnail,
      @Query('locale') String locale,
      @CancelRequest() CancelToken cancelToken});
}
