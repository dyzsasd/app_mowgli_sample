import 'package:flutter/material.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/network_interface.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/model/request_viewer_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/image_utils.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';
import 'package:mowgli/utils/text_utils.dart';

const double kSectionListHorizontalPadding = 24.0;

class SectionListHomePage extends StatelessWidget {
  final SectionListData section;
  final bool shrinkWrap;
  final double bottomPadding;

  SectionListHomePage(
      {@required this.section,
      this.bottomPadding = 0.0,
      this.shrinkWrap = false});

  @override
  Widget build(BuildContext context) {
    bool shouldSkrinkWrap = shrinkWrap ?? false;
    double cellHeight = destinationCellHeight(MediaQuery.of(context));

    return CustomListView<ListItemDestinationData>(
      empty: _FullScreenWidget(
          child: EmptyList(label: Translations.of(context).genericListEmpty)),
      adapter: _ListAdapter(section: section, imageWidth: context.imagesWidth),
      shrinkWrap: shouldSkrinkWrap,
      physics: shouldSkrinkWrap ? const NeverScrollableScrollPhysics() : null,
      disableRefresh: true,
      pageSize: section.request.maxResults,
      itemBuilder: (BuildContext context, int position, Object item) {
        ListItemDestinationData destination = item;

        return Padding(
          padding: EdgeInsets.only(
              left: kSectionListHorizontalPadding,
              right: kSectionListHorizontalPadding,
              top: 16.0,
              bottom: 16.0),
          child: SizedBox(
            width: double.infinity,
            height: cellHeight + 32.0,
            child: ListItemDestinationCell(destination: destination),
          ),
        );
      },
      paginationMode: PaginationMode.page,
      loadingBuilder:
          (BuildContext context, CustomListViewState listViewState) =>
              _SectionListLoading(
                  listViewState: listViewState, shrinkWrap: shrinkWrap),
      errorBuilder: (BuildContext context, dynamic error,
              CustomListViewState listViewState) =>
          _SectionListError(
              listViewState: listViewState, shrinkWrap: shrinkWrap),
    );
  }
}

class _SectionListError extends StatelessWidget {
  final CustomListViewState listViewState;
  final bool shrinkWrap;

  _SectionListError({this.listViewState, this.shrinkWrap});

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    Widget child = ErrorList(
      errorLabel: translations.genericListError,
      retryLabel: translations.genericListRetry,
      retryCallback: () {
        try {
          listViewState.fetchFromAdapter(
            offset: listViewState.offset,
          );
        } catch (ignored) {}
      },
    );

    if (IterableUtils.isEmpty(listViewState.items) && shrinkWrap != true) {
      return _FullScreenWidget(
        child: child,
      );
    } else {
      return Column(
        children: <Widget>[
          const Separator(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
            child: child,
          ),
        ],
      );
    }
  }
}

class _SectionListLoading extends StatelessWidget {
  final CustomListViewState listViewState;
  final bool shrinkWrap;

  _SectionListLoading({this.listViewState, this.shrinkWrap});

  @override
  Widget build(BuildContext context) {
    if (IterableUtils.isEmpty(listViewState.items) && shrinkWrap != true) {
      return _FullScreenWidget(
        child: Center(
            child: Text(Translations.of(context).genericListLoadingNextItems)),
      );
    } else {
      return Column(
        children: <Widget>[
          const Separator(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircularProgressIndicator(),
                const SizedBox(width: 25.0),
                Expanded(
                    child: Text(
                        Translations.of(context).genericListLoadingNextItems))
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _FullScreenWidget extends StatelessWidget {
  final Widget child;

  _FullScreenWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}

class _ListAdapter implements BaseListAdapter<ListItemDestinationData> {
  final SectionListData section;
  final double imageWidth;
  final List<String> tokens;
  final List<ListItemDestinationData> items;

  _ListAdapter({this.section, this.imageWidth})
      : tokens = [section.nextRequestToken],
        items = List.from(section.offers);

  @override
  Future<ListItems<ListItemDestinationData>> getItems(
      int offset, int limit) async {
    if (offset == 0) {
      return ListItems(
        items,
        reachedToEnd: TextUtils.isEmpty(section.nextRequestToken),
      );
    }

    if (offset > tokens.length || TextUtils.isEmpty(tokens[offset - 1])) {
      return ListItems(items, reachedToEnd: true);
    }

    String token = tokens[offset - 1];

    NetworkCall<SmartCacheBestDealRequest, SmartCacheBestDealResponse> data =
        await ApplicationServices.network.listBestDealsFromRequest(
            section.request.createBestDealRequest(nextRequestKey: token),
            imageWidth: imageWidth?.toInt());

    RequestDetailsContent value = RequestDetailsContent.fromNetwork(
        data.response, RequestUtils.fromBestDealRequest(data.request));

    tokens.insert(offset, data.response.nextRequestKey);
    items.addAll(value.sectionData.offers);

    return ListItems(
      value.sectionData.offers,
      reachedToEnd: TextUtils.isEmpty(data.response.nextRequestKey),
    );
  }

  @override
  bool shouldUpdate(BaseListAdapter<ListItemDestinationData> old) {
    return true;
  }
}
