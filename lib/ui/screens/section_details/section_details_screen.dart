import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/section_details/bloc/section_details_bloc.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/request_viewer.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/request_viewer_filters_button.dart';

class SectionDetailsScreen extends StatelessWidget {
  final SectionDetailsScreenArgs args;

  SectionDetailsScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SectionDetailsBloc>(
      create: (_) => SectionDetailsBloc(),
      lazy: true,
      child: RequestListViewerScreen(
        sectionData: args.sectionData,
        request: args.sectionData?.request,
        appBar: MowgliAppBar(
          context: context,
          title: Text(args.label),
          actions: <Widget>[
            const RequestListViewerFiltersButton(),
          ],
        ),
      ),
    );
  }
}

class SectionDetailsScreenArgs {
  final String label;
  final SectionListData sectionData;

  SectionDetailsScreenArgs({@required this.label, @required this.sectionData});
}
