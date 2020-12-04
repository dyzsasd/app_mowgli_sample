import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/placeholder.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/utils/date_utils.dart';
import 'package:mowgli/utils/text_utils.dart';

class ListItemDestinationHop extends StatelessWidget {
  final ListItemDestinationHopData hop;

  ListItemDestinationHop({@required this.hop}) : assert(hop != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 27,
            child: Text(
              hop.departureDate.formatDate(),
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )),
        Expanded(
            flex: 9,
            child: _ListItemDestinationHopCompanyLogo(
                companyPictureUrl: hop.companyPictureUrl)),
        Expanded(
          flex: 11,
          child: _ListItemDestinationHopCityOrAirport(
              airportCode: hop.departureAirportCode,
              cityCode: hop.departureCityCode),
        ),
        Expanded(
          flex: 12,
          child: _ListItemDestinationHopDepartureDate(
              departureDate: hop.departureDate),
        ),
        Expanded(
          flex: 13,
          child: _ListItemDestinationHopArrow(
              multipleStopOvers: hop.stopOvers > 0),
        ),
        Expanded(
          flex: 11,
          child: _ListItemDestinationHopCityOrAirport(
              airportCode: hop.arrivalAirportCode,
              cityCode: hop.arrivalCityCode),
        ),
        Expanded(
          flex: 18,
          child: _ListItemDestinationHopArrivalDate(
              arrivalDate: hop.arrivalDate, diffInDays: hop.arrivalDifference),
        ),
      ],
    );
  }
}

class _ListItemDestinationHopCityOrAirport extends StatelessWidget {
  final String airportCode;
  final String cityCode;

  _ListItemDestinationHopCityOrAirport(
      {@required this.airportCode, @required this.cityCode});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(airportCode ?? cityCode,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.itemCityCode,
        ),
        maxLines: 1,
        minFontSize: 5.0);
  }
}

class _ListItemDestinationHopCompanyLogo extends StatelessWidget {
  final String companyPictureUrl;

  _ListItemDestinationHopCompanyLogo({@required this.companyPictureUrl});

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (TextUtils.isNotEmpty(companyPictureUrl)) {
      if (companyPictureUrl.endsWith('svg')) {
        child = SvgPicture.network(companyPictureUrl,
            height: 18.0, placeholderBuilder: (_) => const ImagePlaceholder());
      } else {
        child = CachedNetworkImage(
          height: 18.0,
          imageUrl: companyPictureUrl,
          fit: BoxFit.fitHeight,
          placeholder: (BuildContext context, String url) =>
              const ImagePlaceholder(),
          errorWidget: (BuildContext context, String url, Object error) =>
              const ImagePlaceholder(),
        );
      }
    } else {
      child = const ImagePlaceholder();
    }

    return SizedBox(
      height: 18.0,
      child: child,
    );
  }
}

class _ListItemDestinationHopDepartureDate extends StatelessWidget {
  final DateTime departureDate;

  _ListItemDestinationHopDepartureDate({@required this.departureDate});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      departureDate.formatTime(),
      style: TextStyle(color: AppColors.itemTime, fontWeight: FontWeight.bold),
      maxLines: 1,
      minFontSize: 5.0,
    );
  }
}

class _ListItemDestinationHopArrivalDate extends StatelessWidget {
  final DateTime arrivalDate;
  final int diffInDays;

  _ListItemDestinationHopArrivalDate(
      {@required this.arrivalDate, @required this.diffInDays});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
          text: '${arrivalDate.formatTime()} ',
          style:
              TextStyle(color: AppColors.itemTime, fontWeight: FontWeight.bold),
          children: <InlineSpan>[
            if (diffInDays > 0)
              TextSpan(
                  text: '+$diffInDays', style: const TextStyle(fontSize: 10.0))
          ]),
      maxLines: 1,
      minFontSize: 5.0,
    );
  }
}

class _ListItemDestinationHopArrow extends StatelessWidget {
  final bool multipleStopOvers;

  _ListItemDestinationHopArrow({this.multipleStopOvers});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ListItemDestinationHopArrowPainter(multipleStopOvers),
      size: Size.fromHeight(10.0),
    );
  }
}

class _ListItemDestinationHopArrowPainter extends CustomPainter {
  static const double _arrowWidth = 8.0;

  final Paint _paint;
  final bool multipleStopOvers;

  _ListItemDestinationHopArrowPainter(this.multipleStopOvers)
      : _paint = Paint()
          ..color = AppColors.listItemTitle
          ..strokeWidth = 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    Offset endOffset = Offset(size.width, size.height / 2);

    canvas.drawLine(Offset(0.0, size.height / 2), endOffset, _paint);

    canvas.drawLine(endOffset, Offset(endOffset.dx - _arrowWidth, 0.0), _paint);
    canvas.drawLine(
        endOffset, Offset(endOffset.dx - _arrowWidth, size.height), _paint);

    if (multipleStopOvers == true) {
      canvas.drawCircle(
          Offset((endOffset.dx / 2.0) - 1.0, endOffset.dy), 5.0, _paint);
    }
  }

  @override
  bool shouldRepaint(_ListItemDestinationHopArrowPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(
          _ListItemDestinationHopArrowPainter oldDelegate) =>
      false;
}
