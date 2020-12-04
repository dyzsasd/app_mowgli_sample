import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_body.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_offer.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

const double _kSectionListHorizontalPadding = 24.0;
const double _kDealOfferCellHeight = 280.0;

class DealDetailsSectionList extends StatelessWidget {
  final DealDetailsSection section;

  DealDetailsSectionList({@required this.section});

  @override
  Widget build(BuildContext context) {
    int itemCount = (section.offers?.length ?? 0) + 1;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return ListItemTitle(label: section.label);
          }

          DealDetailsOffer destination = section.offers.elementAt(position + 1);

          Request offerRequest =
              RequestUtils.fromBestDealRequest(section.request)
                  .updateWithDates(destination.fromDate, destination.toDate);

          return Padding(
            padding: EdgeInsets.only(
                left: _kSectionListHorizontalPadding,
                right: _kSectionListHorizontalPadding,
                top: 16.0,
                bottom: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: _kDealOfferCellHeight - 30.0,
              child: DealDetailsOfferCell(
                request: offerRequest,
                offer: destination,
                openByDefault: false,
              ),
            ),
          );
        });
  }
}

class DealDetailsSectionRow extends StatefulWidget {
  final DealDetailsSection section;
  final int maxOffers;

  DealDetailsSectionRow({@required this.section})
      : maxOffers = _findMaxOffers(section);

  static int _findMaxOffers(DealDetailsSection section) {
    int maxOffers = 0;

    for (DealDetailsOffer offer in section.offers) {
      maxOffers = max(
          maxOffers,
          offer.outboundHop.stopOvers.length +
              offer.inboundHop.stopOvers.length);
    }

    return maxOffers;
  }

  @override
  _DealDetailsSectionRowState createState() => _DealDetailsSectionRowState();
}

class _DealDetailsSectionRowState extends State<DealDetailsSectionRow> {
  final Set<Key> openedPositions = <Key>{};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    screenWidth -= (DealDetailsBodyData.of(context).horizontalPadding) * 2;
    screenWidth -= 28.0;

    double itemWidth = screenWidth;
    double height = (openedPositions.isNotEmpty ? 520.0 : 236.5);

    if (widget.maxOffers > 2) {
      height += 19.5 * (widget.maxOffers - 2);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListItemTitle(
          label: widget.section.label,
          padding: const EdgeInsetsDirectional.only(
              start: 23.0, end: 9.0, top: 10.0, bottom: 8.0),
        ),
        SizedBox(
          width: double.infinity,
          height: height * MediaQuery.of(context).textScaleFactor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.section.offers?.length ?? 0,
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
            cacheExtent: itemWidth,
            itemBuilder: (BuildContext context, int position) {
              DealDetailsOffer offer =
                  widget.section.offers.elementAt(position);
              Request offerRequest =
                  RequestUtils.fromBestDealRequest(widget.section.request)
                      .updateWithDates(offer.fromDate, offer.toDate);

              Key widgetKey = Key('${widget.section.label}_$position');

              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 4.0),
                child: SizedBox(
                  width: itemWidth,
                  child: Column(
                    children: <Widget>[
                      DealDetailsOfferCell(
                        request: offerRequest,
                        offer: offer,
                        openByDefault: openedPositions.contains(widgetKey),
                        key: widgetKey,
                        onItemClosed: (Key key) {
                          openedPositions.remove(key);

                          if (openedPositions.isEmpty) {
                            setState(() {});
                          }
                        },
                        onItemOpened: (Key key) {
                          openedPositions.add(key);

                          if (openedPositions.length == 1) {
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
