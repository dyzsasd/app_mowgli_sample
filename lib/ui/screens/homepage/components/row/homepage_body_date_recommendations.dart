import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list/date_recommendations/list_item_date_recommendation.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';

class HomePageDateRecommendations extends StatelessWidget {
  final Iterable<HomePageDateRecommendation> dateRecommendations;

  HomePageDateRecommendations({@required this.dateRecommendations});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.53;
    int totalCount = dateRecommendations?.length ?? 0;

    return SizedBox(
      width: double.infinity,
      height: totalCount > 0
          ? dateRecommendationCellHeight(MediaQuery.of(context)) + 33.0
          : 0.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: totalCount,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
          cacheExtent: itemWidth,
          itemBuilder: (BuildContext context, int position) {
            HomePageDateRecommendation dateRecommendation =
                dateRecommendations.elementAt(position);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: itemWidth,
                child: ListItemDateRecommendationCell(
                  dateRecommendation: dateRecommendation,
                  key: Key('${dateRecommendation.label}_$position'),
                ),
              ),
            );
          }),
    );
  }
}
