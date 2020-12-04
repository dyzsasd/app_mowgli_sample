import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_destination_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_offer_detail_response.dart';
import 'package:mowgli/ui/screens/deal_details/bloc/impl/deal_details_state.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'deal_details_event.dart';

class DealDetailsBloc extends BaseBloc<_DealDetailsEvent, DealDetailsState> {
  // ignore: unused_field
  final String _initialDealId;
  final Request _initialRequest;
  final Location _initialDestination;

  CancelToken _cancelToken;

  final double imageWidth;

  DealDetailsBloc(
      String dealId, Request request, Location destination, this.imageWidth)
      : _initialDealId = dealId,
        _initialRequest = request,
        _initialDestination = destination,
        super(_initialState()) {
    dispatch(_LoadDealEvent(dealId: dealId, request: request));
  }

  static DealDetailsState _initialState() => DealDetailsState.loading();

  void overrideContentWith(Filters filters, String dealId) {
    dispatch(_OverrideDealEvent(filters, dealId));
  }

  Request get initialRequest => _initialRequest;

  @override
  Stream<DealDetailsState> mapEventToState(_DealDetailsEvent event) async* {
    Filters filtersOverride;

    if (event is _OverrideDealEvent) {
      filtersOverride = (event as _OverrideDealEvent).filters;
      event = _LoadDealEvent(dealId: (event as _OverrideDealEvent).dealId);
    } else {
      filtersOverride = state.maybeWhen(
        (_, Filters filters) => filters,
        orElse: () => null,
      );
    }

    if (event is _LoadDealEvent) {
      yield DealDetailsState.loading();

      if (_cancelToken?.isCancelled == false) {
        _cancelToken?.cancel();
      }

      String dealId = event.dealId;

      try {
        DealDetailsContent content;
        if (dealId == null) {
          content = await _fromRequest(event, filtersOverride);
        } else {
          content = await _fromDealId(event, filtersOverride);
        }

        yield DealDetailsState(
          content,
          filters: filtersOverride ?? _initialRequest.filters,
        );
      } catch (err, trace) {
        logError(error: err, stackTrace: trace);
        yield DealDetailsState.error();
      }
    }
  }

  Future<DealDetailsContent> _fromDealId(
      _LoadDealEvent event, Filters filtersOverride) async {
    SmartCacheOfferDetailResponse response = await ApplicationServices.network
        .getDeal(event.dealId,
            imageWidth: imageWidth.toInt(),
            cancelToken: _cancelToken = CancelToken());

    return DealDetailsContent.fromOfferDetailNetworkResponse(
        response, rewriteRequest(event.request, filtersOverride));
  }

  Future<DealDetailsContent> _fromRequest(
      _LoadDealEvent event, Filters filtersOverride) async {
    SmartCacheDestinationResponse response = await ApplicationServices.network
        .getDealForDestination(
            event.request.createDestinationRequest(override: filtersOverride),
            imageWidth: imageWidth.toInt(),
            cancelToken: _cancelToken = CancelToken());

    return DealDetailsContent.fromDestinationNetworkResponse(
        response, rewriteRequest(event.request, filtersOverride));
  }

  Request rewriteRequest(Request request, Filters filtersOverride) {
    request ??= _initialRequest;

    if (filtersOverride != null) {
      request = request.updateWithFilters(filtersOverride);
    }

    if ([RequestDestinationType.category, RequestDestinationType.all]
        .contains(request.destination.type)) {
      request = request.copyWith(
          destination: RequestDestination(
              type: RequestDestinationType.city,
              codes: [_initialDestination.code],
              codeType: RequestDestinationCodeType.iata));
    }

    return request;
  }

  @override
  Future<void> close() {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    return super.close();
  }
}
