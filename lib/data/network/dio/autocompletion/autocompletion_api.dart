import 'package:dio/dio.dart';
import 'package:mowgli/data/network/dio/autocompletion/model/response/autocompletion_response.dart';
import 'package:retrofit/retrofit.dart';

part 'autocompletion_api.g.dart';

@RestApi()
abstract class RestAutoCompletionAPI {
  factory RestAutoCompletionAPI(Dio dio, {String baseUrl}) =
      _RestAutoCompletionAPI;

  @GET('/completion')
  Future<AutoCompletionResponse> getAutocompletionFor(
      @Query('val') String search, @Query('lang') String locale,
      {@CancelRequest() CancelToken cancelToken});
}
