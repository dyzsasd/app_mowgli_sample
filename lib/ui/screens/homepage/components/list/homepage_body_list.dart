import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/list/section/section_list_homepage.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';

class HomePageSectionList extends StatelessWidget {
  final HomePageSection section;

  HomePageSectionList({@required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListItemTitle(label: section.label),
          SectionListHomePage(
            section: section.toSectionListData(),
            shrinkWrap: true,
          ),
        ]);
  }
}
