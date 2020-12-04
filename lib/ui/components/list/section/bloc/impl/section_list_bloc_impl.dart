import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/network_interface.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/list/section/bloc/impl/section_list_state.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/model/request_viewer_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/text_utils.dart';

part 'section_list_event.dart';

class SectionListBloc extends BaseBloc<_SectionListEvent, SectionListState> {
  CancelToken _cancelToken;
  final Request request;
  final double imagesWidth;
  int offset;
  List<String> tokens;
  List<ListItemDestinationData> items;

  SectionListBloc(Request request, List<String> tokens,
      List<ListItemDestinationData> items, double imagesWidth)
      : request = request,
        offset = 0,
        tokens = tokens,
        items = items,
        imagesWidth = imagesWidth,
        super(_initialState()) {
    dispatch(_LoadDealsEvent());
  }

  static SectionListState _initialState() => SectionListState.loading();

  void loadMoreDeals() {
    if (this.request != null && this.tokens != null) {
      dispatch(_LoadDealsEvent());
    }
  }

  @override
  Stream<SectionListState> mapEventToState(_SectionListEvent event) async* {
    if (event is _LoadDealsEvent) {
      if (offset == 0 && items.length > 10) {
        String token = tokens[0];
        offset = offset + 1;
        yield SectionListState(SectionListData(
            offers: items, request: request, nextRequestToken: token));
      } else if (offset == 0 || offset <= tokens.length) {
        String token;
        if (offset > 0) {
          token = tokens[offset - 1];
        } else {
          token = tokens[0];
        }
        if (!TextUtils.isEmpty(token)) {
          try {
            NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse>
                data = await ApplicationServices.network
                    .listBestDealsFromRequest(
                        request.createBestDealRequest(nextRequestKey: token),
                        imageWidth: imagesWidth?.toInt());

            RequestDetailsContent value = RequestDetailsContent.fromNetwork(
                data.response, RequestUtils.fromBestDealRequest(data.request));

            tokens.insert(offset, data.response.nextRequestKey);
            offset = offset + 1;
            items.addAll(value.sectionData.offers);
            if (TextUtils.isEmpty(data.response.nextRequestKey)) {
              yield SectionListState.noMoreDeals(SectionListData(
                  offers: items,
                  request: request,
                  nextRequestToken: tokens[0]));
            } else {
              yield SectionListState(SectionListData(
                  offers: items,
                  request: request,
                  nextRequestToken: tokens[0]));
            }
          } catch (err, trace) {
            logError(
                message: 'Unable to load more deals',
                error: err,
                stackTrace: trace);
            yield SectionListState.error();
          }
        } else {
          yield SectionListState.noMoreDeals(SectionListData(
              offers: items, request: request, nextRequestToken: tokens[0]));
        }
      } else {
        yield SectionListState.error();
      }
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
