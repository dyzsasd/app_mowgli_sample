import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_hop.dart';
import 'package:mowgli/ui/components/placeholder.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/utils/date_ui_utils.dart';
import 'package:mowgli/ui/utils/text_ui_utils.dart';
import 'package:uuid/uuid.dart';

const BorderRadius _kImageRadius = BorderRadius.all(Radius.circular(6.0));
const double _destinationCellHeightWithoutImage = 70.0;
double _destinationCellHeight;

double destinationCellHeight(MediaQueryData mediaQuery) {
  return _destinationCellHeight ??= _destinationCellHeightWithoutImage +
      math.min(300.0, mediaQuery.size.width * 0.49);
}

final Uuid _uuid = Uuid();

class ListItemDestinationCell extends StatelessWidget {
  final ListItemDestinationData destination;
  final String id;

  ListItemDestinationCell({@required this.destination, Key key})
      : id = _uuid.v1(),
        assert(destination != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String heroTag = 'dest_picture_$id';

    return AppInkWell(
      onTap: () {
        ApplicationServices.analytics.eventDealClicked(
            destination.departureCityCode,
            destination.destinationCityCode,
            destination.outBoundHop?.departureDate,
            destination.arrivalDate);

        Navigator.of(context).pushNamed(AppRoutes.routeDealDetails,
            arguments: DealDetailsScreenArgs.dealId(
                dealId: destination.id,
                request: destination.request,
                departure: destination.departureLocation,
                arrival: destination.arrivalLocation,
                mainThumbnail: destination.thumbnail,
                heroTag: heroTag));
      },
      borderRadius: _kImageRadius,
      child: CustomMultiChildLayout(
        delegate: _ListItemDestinationCellLayoutDelegate(),
        children: <Widget>[
          LayoutId(
              id: 1,
              child: _ListItemDestinationPicture(
                  heroTag: heroTag, url: destination.thumbnail)),
          LayoutId(
            id: 2,
            child: _ListItemPrice(
              price: destination.price,
              currency: destination.currency,
              date: destination.date,
            ),
          ),
          LayoutId(
            id: 3,
            child: Text(
              '${destination.destinationCityName} (${destination.destinationCityCode})',
              maxLines: 1,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          LayoutId(
            id: 4,
            child: DefaultTextStyle.merge(
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (destination.outBoundHop != null)
                    ListItemDestinationHop(hop: destination.outBoundHop),
                  if (destination.inBoundHop != null)
                    ListItemDestinationHop(hop: destination.inBoundHop),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ListItemDestinationCellLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    double imageHeight =
        _destinationCellHeight - _destinationCellHeightWithoutImage;
    layoutChild(1, BoxConstraints.tight(Size(size.width, imageHeight)));

    layoutChild(2, BoxConstraints.tight(Size(100.0, 50.0)));
    positionChild(2, Offset(size.width - 100.0 - 18.0, imageHeight - 25.0));

    layoutChild(3, BoxConstraints.loose(Size(size.width, 22.0)));
    positionChild(3, Offset(0, imageHeight + 18.0));

    double offset = 18.0 + 18.0 + 14.0;

    layoutChild(
        4,
        BoxConstraints.loose(
            Size(size.width, size.height - imageHeight - offset - 8.0)));
    positionChild(4, Offset(0, imageHeight + offset));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

class _ListItemPrice extends StatelessWidget {
  final num price;
  final String currency;
  final DateTime date;

  _ListItemPrice(
      {@required this.price, @required this.currency, @required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100.0),
      decoration: BoxDecoration(
          color: AppColors.priceContainerBackground,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: AppColors.priceContainerShadow,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(TextUIUtils.formatPriceWithCurrency(price, currency),
              style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.priceContainerValue,
                  fontWeight: FontWeight.bold)),
          Text(
              Translations.of(context).genericTimeItem(
                  duration: DateUIUtils.getDiffDuration(
                      Translations.of(context), date)),
              style:
                  TextStyle(fontSize: 8.0, color: AppColors.priceContainerDate))
        ],
      ),
    );
  }
}

class _ListItemDestinationPicture extends StatelessWidget {
  final String url;
  final String heroTag;

  _ListItemDestinationPicture({@required this.url, @required this.heroTag})
      : assert(heroTag != null);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: ClipRRect(
        borderRadius: _kImageRadius,
        child: url != null
            ? CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) =>
                    const ImagePlaceholder(),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const ImagePlaceholder(),
              )
            : const ImagePlaceholder(),
      ),
    );
  }
}
