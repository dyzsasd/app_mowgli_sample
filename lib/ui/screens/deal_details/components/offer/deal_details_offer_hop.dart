import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_hop.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/utils/date_ui_utils.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';
import 'package:mowgli/utils/date_utils.dart';

class DealDetailsHop extends StatelessWidget {
  final DealDetailsOfferHop hop;

  DealDetailsHop({@required this.hop}) : assert(hop != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DefaultTextStyle(
        style: TextStyle(
            fontSize: 13.0,
            height: 1.3,
            fontWeight: FontWeight.w500,
            color: AppColors.text3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListItemDestinationHop(hop: hop.toListItemDestinationHop()),
            const SizedBox(height: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _TravelDuration(hop: hop),
                Expanded(child: _TravelDetails(hop: hop)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TravelDuration extends StatelessWidget {
  final DealDetailsOfferHop hop;

  _TravelDuration({@required this.hop});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Icon(AppIcons.duration, size: 16.0, color: AppColors.text3),
        const SizedBox(width: 4.0),
        Text(
          DateUIUtils.formatDateTimeDifference(Translations.of(context),
              DateUtils.differenceFromDuration(hop.duration),
              showMinutesUnit: false),
        ),
        const SizedBox(width: 4.0)
      ],
    );
  }
}

class _TravelDetails extends StatelessWidget {
  final DealDetailsOfferHop hop;

  _TravelDetails({@required this.hop}) : assert(hop != null);

  @override
  Widget build(BuildContext context) {
    if (IterableUtils.isNotEmpty(hop.stopOvers)) {
      return _HopStopOvers(stopOvers: hop.stopOvers);
    } else {
      return Text(hop.mainMarketingCarrierName);
    }
  }
}

class _HopStopOvers extends StatelessWidget {
  final List<DealDetailsStopOver> stopOvers;

  _HopStopOvers({@required this.stopOvers}) : assert(stopOvers != null);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = DefaultTextStyle.of(context).style;

    return CustomMultiChildLayout(
      delegate: _HopStopOversItemDelegate(
          stopOvers.length, textStyle.fontSize * textStyle.height),
      children: <Widget>[
        LayoutId(
          id: 1,
          child: Column(
            children: stopOvers
                .map((DealDetailsStopOver stopOver) => Text(
                      stopOver.carrierName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))
                .toList(growable: false),
          ),
        ),
        LayoutId(
            id: 2,
            child: Text(_getText(Translations.of(context)),
                textAlign: TextAlign.end)),
      ],
    );
  }

  String _getText(Translations translations) {
    if (IterableUtils.isEmpty(stopOvers)) {
      return '';
    }

    StringBuffer buffer = StringBuffer();
    buffer.write(
        translations.detailsHopStopOversMultiple(count: stopOvers.length));

    for (int i = 0; i != stopOvers.length; i++) {
      DealDetailsStopOver stopOver = stopOvers[i];

      buffer.write(translations.detailsHopStopOversItem(
          destinationCode: stopOver.arrivalCity.code,
          duration: DateUIUtils.formatDateTimeDifference(translations,
              DateUtils.differenceFromDuration(stopOver.stopoverDuration))));

      if (i < stopOvers.length - 1) {
        buffer.write(translations.detailsHopStopOversItemSeparator);
      }
    }

    return buffer.toString();
  }
}

class _HopStopOversItemDelegate extends MultiChildLayoutDelegate {
  final int lines;
  final double lineHeight;

  _HopStopOversItemDelegate(this.lines, this.lineHeight);

  @override
  void performLayout(Size size) {
    var child = layoutChild(
        2,
        BoxConstraints(
            minWidth: 0.0,
            maxWidth: (size.width * 0.8) - 5.0,
            minHeight: 0.0,
            maxHeight: size.height));

    positionChild(2, Offset((size.width - child.width) + 5.0, 0.5));

    layoutChild(
        1,
        BoxConstraints(
            minWidth: 0.0,
            maxWidth: size.width - child.width,
            minHeight: 0.0,
            maxHeight: size.height));

    positionChild(1, Offset(0, 0.0));
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, (lineHeight + 1.5) * lines);
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}
