import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/inkwell.dart';
import 'package:mowgli/ui/components/placeholder.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/section_details/section_details_screen.dart';
import 'package:uuid/uuid.dart';

const BorderRadius _kImageRadius = BorderRadius.all(Radius.circular(6.0));
double _dateRecommendationCellHeight;

double dateRecommendationCellHeight(MediaQueryData mediaQuery) {
  return _dateRecommendationCellHeight ??=
      math.min(90.0, mediaQuery.size.width * 0.14);
}

final Uuid _uuid = Uuid();

class ListItemDateRecommendationCell extends StatelessWidget {
  final HomePageDateRecommendation dateRecommendation;
  final String id;

  ListItemDateRecommendationCell({@required this.dateRecommendation, Key key})
      : id = _uuid.v1(),
        assert(dateRecommendation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String heroTag = 'dest_picture_$id';

    return AppInkWell(
        onTap: () {
          ApplicationServices.analytics
              .eventDateRecommendationsClicked(dateRecommendation.label);

          Navigator.of(context).pushNamed(
            AppRoutes.routeSectionDetails,
            arguments: SectionDetailsScreenArgs(
              label: dateRecommendation.label,
              sectionData: dateRecommendation.toSectionListData(),
            ),
          );
        },
        borderRadius: _kImageRadius,
        child: ConstrainedBox(
            constraints: BoxConstraints.tight(
                Size(double.infinity, _dateRecommendationCellHeight)),
            child: _ListItemDestinationPicture(
                heroTag: heroTag, url: dateRecommendation.thumbnail)));
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
