import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_offer.dart';

/// Border with an empty space for the chevron
class DealDetailsOfferBorder extends Border {
  final double chevronSpace;

  DealDetailsOfferBorder(this.chevronSpace)
      : super.fromBorderSide(BorderSide(color: AppColors.cardBorder));

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius borderRadius}) {
    if (chevronSpace > 0.0) {
      canvas.save();

      Path path = Path();
      path.lineTo(rect.right, rect.top);
      path.lineTo(rect.right, rect.bottom);
      path.lineTo(
          rect.right - (kDealDetailsOfferEndPadding + 1.0), rect.bottom);
      path.lineTo(rect.right - (kDealDetailsOfferEndPadding + 1.0),
          rect.bottom - (kDealDetailsOfferChevronSize / 2.0) - chevronSpace);
      path.lineTo(
          rect.right -
              (kDealDetailsOfferEndPadding + 1.0) -
              kDealDetailsOfferChevronSize,
          rect.bottom - (kDealDetailsOfferChevronSize / 2.0) - chevronSpace);
      path.lineTo(
          rect.right -
              (kDealDetailsOfferEndPadding + 1.0) -
              kDealDetailsOfferChevronSize,
          rect.bottom);
      path.lineTo(rect.left, rect.bottom);
      path.lineTo(rect.left, rect.top);

      canvas.clipPath(path);

      super.paint(
          canvas,
          Rect.fromLTWH(
              rect.left, rect.top, rect.width, rect.height - chevronSpace),
          shape: shape,
          borderRadius: borderRadius);

      canvas.restore();
    } else {
      super.paint(canvas, rect, shape: shape, borderRadius: borderRadius);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is DealDetailsOfferBorder &&
          runtimeType == other.runtimeType &&
          chevronSpace == other.chevronSpace;

  @override
  int get hashCode => super.hashCode ^ chevronSpace.hashCode;
}

class DealDetailsOfferInkWellBorder extends Border {
  final double chevronHeight;
  final double endPadding;

  DealDetailsOfferInkWellBorder(
      {@required this.chevronHeight, @required this.endPadding});

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..addRect(Rect.fromLTWH(
        rect.left,
        rect.top,
        rect.width - endPadding,
        rect.height - chevronHeight,
      ));
  }
}
