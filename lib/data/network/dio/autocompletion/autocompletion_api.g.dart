// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocompletion_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestAutoCompletionAPI implements RestAutoCompletionAPI {
  _RestAutoCompletionAPI(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<AutoCompletionResponse> getAutocompletionFor(search, locale,
      {cancelToken}) async {
    ArgumentError.checkNotNull(search, 'search');
    ArgumentError.checkNotNull(locale, 'locale');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'val': search, r'lang': locale};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/completion',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = AutoCompletionResponse.fromJson(_result.data);
    return value;
  }
}
