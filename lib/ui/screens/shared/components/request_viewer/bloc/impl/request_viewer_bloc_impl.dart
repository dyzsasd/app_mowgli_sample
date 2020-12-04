import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/network_interface.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/bloc/impl/request_viewer_state.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/model/request_viewer_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';

part 'request_viewer_event.dart';

class RequestViewerBloc
    extends BaseBloc<_RequestViewerEvent, RequestViewerState> {
  final SectionListData _initialData;
  Request _initialRequest;

  CancelToken _cancelToken;
  double imageWidth;

  RequestViewerBloc(
      SectionListData initialData, Request initialRequest, this.imageWidth)
      : _initialData = initialData,
        _initialRequest = initialRequest,
        super(_initialState(initialData, initialRequest)) {
    if (initialRequest != null &&
        (initialData == null || IterableUtils.isEmpty(initialData.offers))) {
      loadDeals();
    }
  }

  static RequestViewerState _initialState(
      SectionListData initialData, Request request) {
    if (initialData == null) {
      return RequestViewerState.loading(
          RequestDetailsContent(initialData, initialData?.request ?? request));
    } else if (initialData.request == null && request == null) {
      return RequestViewerState.loading(
          RequestDetailsContent(initialData, initialData?.request ?? request));
    } else {
      return RequestViewerState(
          RequestDetailsContent(initialData, initialData?.request ?? request));
    }
  }

  void loadDeals() {
    dispatch(const _LoadDealsEvent());
  }

  void updateLocation(Request request) {
    dispatch(_ChangeRequestLocationEvent(request));
  }

  void updateFilters(Filters res) {
    dispatch(_UpdateFiltersEvent(res));
  }

  @override
  Stream<RequestViewerState> mapEventToState(_RequestViewerEvent event) async* {
    Request request = state.data.request;

    if (event is _UpdateFiltersEvent) {
      request = (_initialData?.request ?? _initialRequest)
          .updateWithFiltersAllowingNullDates(
              (event as _UpdateFiltersEvent).filters);

      event = const _LoadDealsEvent();
    } else if (event is _ChangeRequestLocationEvent) {
      if (request != null) {
        request = request.copyWith(
          origin: (event as _ChangeRequestLocationEvent).request.origin,
          destination:
              (event as _ChangeRequestLocationEvent).request.destination,
        );
      } else {
        request = (event as _ChangeRequestLocationEvent)
            .request
            .completeLocationRequest();
      }

      _initialRequest = request;

      event = const _LoadDealsEvent();
    }

    if (event is _LoadDealsEvent) {
      if (_cancelToken?.isCancelled == false) {
        _cancelToken.cancel();
      }

      yield RequestViewerState.loading(
          RequestDetailsContent(state.data.sectionData, request));

      yield await _mapData(ApplicationServices.network.listBestDealsFromRequest(
          request.createBestDealRequest(),
          imageWidth: imageWidth?.toInt(),
          cancelToken: _cancelToken = CancelToken()));
    }
  }

  Future<RequestViewerState> _mapData(
      Future<NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>>
          request) async {
    try {
      NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse> call =
          await request;

      RequestDetailsContent value = RequestDetailsContent.fromNetwork(
          call.response, RequestUtils.fromBestDealRequest(call.request));

      if (IterableUtils.isEmpty(value.sectionData.offers)) {
        return RequestViewerState.empty(value);
      } else {
        return RequestViewerState(value);
      }
    } catch (error, stackTrace) {
      logError(
          message: 'Unable to load events',
          error: error,
          stackTrace: stackTrace);
      return Future<RequestViewerState>.value(
          RequestViewerState.error(state.data));
    }
  }

  @override
  Future<void> close() {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    return super.close();
  }
}
