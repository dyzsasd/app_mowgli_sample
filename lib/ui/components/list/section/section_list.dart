import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/list/section/bloc/section_list_bloc.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';

const double kSectionListHorizontalPadding = 24.0;

class SectionList extends StatefulWidget {
  final SectionListData section;
  final bool shrinkWrap;
  final double bottomPadding;
  final double imagesWidth;

  SectionList(
      {@required this.section,
      this.bottomPadding,
      this.shrinkWrap,
      this.imagesWidth});

  @override
  _SectionList createState() => _SectionList();
}

class _SectionList extends State<SectionList> {
  bool shouldShrinkWrap;
  double bottomPadding;
  List<String> tokens;
  bool isLoading;
  bool error;
  int offset;
  List<ListItemDestinationData> items;

  @override
  void initState() {
    super.initState();
    shouldShrinkWrap = widget.shrinkWrap ?? false;
    bottomPadding = widget.bottomPadding ?? 0.0;
    tokens = [widget.section.nextRequestToken];
    isLoading = false;
    error = false;
    offset = 1;
    items = List.from(widget.section.offers);
  }

  @override
  Widget build(BuildContext context) {
    double cellHeight = destinationCellHeight(MediaQuery.of(context));
    bool isLoading = false;
    return BlocCreatorWithBuilder<SectionListBloc, SectionListState>(
        create: (_) => SectionListBloc(
            widget.section.request, tokens, items, widget.imagesWidth),
        builder: (BuildContext context, SectionListState state) {
          items = state.when((SectionListData data) {
            isLoading = false;
            return data.offers;
          },
              error: () => items,
              loading: () => items,
              noMoreDeals: (SectionListData data) => data.offers);
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !state.noMoreDeals &&
                  !isLoading &&
                  !state.isError) {
                isLoading = true;
                context.bloc<SectionListBloc>().loadMoreDeals();
              }
              return true;
            },
            child: ListView.builder(
              physics: shouldShrinkWrap
                  ? const NeverScrollableScrollPhysics()
                  : null,
              shrinkWrap: shouldShrinkWrap,
              itemCount: items.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == items.length) {
                  if (state.isError) {
                    return _SectionListError(
                        items: items, shrinkWrap: shouldShrinkWrap);
                  } else if (state.noMoreDeals) {
                    return SizedBox();
                  } else {
                    return _SectionListLoading(
                        items: items, shrinkWrap: shouldShrinkWrap);
                  }
                } else {
                  ListItemDestinationData destination = items[index];

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
                }
              },
            ),
          );
        });
  }
}

class _SectionListError extends StatelessWidget {
  final List<ListItemDestinationData> items;
  final bool shrinkWrap;

  _SectionListError({this.items, this.shrinkWrap});

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocBuilder<SectionListBloc, SectionListState>(
        builder: (BuildContext context, SectionListState state) {
      Widget child = ErrorList(
        errorLabel: translations.genericListError,
        retryLabel: translations.genericListRetry,
        retryCallback: () {
          try {
            context.bloc<SectionListBloc>().loadMoreDeals();
          } catch (ignored) {}
        },
      );

      if (IterableUtils.isEmpty(items) && shrinkWrap != true) {
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
    });
  }
}

class _SectionListLoading extends StatelessWidget {
  final List<ListItemDestinationData> items;
  final bool shrinkWrap;

  _SectionListLoading({this.items, this.shrinkWrap});

  @override
  Widget build(BuildContext context) {
    if (IterableUtils.isEmpty(items) && shrinkWrap != true) {
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
