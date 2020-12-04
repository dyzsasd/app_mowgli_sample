import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/section_details/section_details_screen.dart';

class HomePageSectionRow extends StatelessWidget {
  final HomePageSection section;

  HomePageSectionRow({@required this.section});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.87;
    int totalCount = (section.offers?.length ?? 0) + 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListItemTitle(
            label: section.label, onPressed: () => _openDetails(context)),
        SizedBox(
          width: double.infinity,
          height: destinationCellHeight(MediaQuery.of(context)) + 61.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              cacheExtent: itemWidth,
              itemBuilder: (BuildContext context, int position) {
                if (position == totalCount - 1) {
                  return _HomePageSectionRowLastItem(
                      onPressed: () => _openDetails(context));
                } else {
                  HomePageOffer offer = section.offers.elementAt(position);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: itemWidth,
                      child: ListItemDestinationCell(
                        destination: offer.toDestinationData(section.request),
                        key: Key('${section.label}_$position'),
                      ),
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }

  void _openDetails(BuildContext context) {
    ApplicationServices.analytics.eventHomePageSectionClicked(section.label);

    Navigator.of(context).pushNamed(AppRoutes.routeSectionDetails,
        arguments: SectionDetailsScreenArgs(
            label: section.label, sectionData: section.toSectionListData()));
  }
}

class _HomePageSectionRowLastItem extends StatelessWidget {
  final VoidCallback onPressed;

  _HomePageSectionRowLastItem({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.55,
              child: InkWell(
                onTap: onPressed,
                customBorder: CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Ink(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.alertBackground),
                        child: Center(
                            child: RotatedBox(
                          quarterTurns: 2,
                          child: ClipRect(
                            child: Icon(
                              AppIcons.back,
                              size: 10.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )),
                      ),
                      const SizedBox(height: 11.0),
                      Text(
                        Translations.of(context).homePageListReadMore,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.listItemSecondaryText),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox())
          ],
        );
      },
    );
  }
}
