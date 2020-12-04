import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/destination_viewer/bloc/destination_viewer_bloc.dart';
import 'package:mowgli/ui/screens/filters/filters_screen.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/bloc/request_viewer_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

class RequestListViewerFiltersButton extends StatelessWidget {
  const RequestListViewerFiltersButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestViewerBloc, RequestViewerState>(
      buildWhen: (RequestViewerState oldState, RequestViewerState newState) =>
          oldState.data.filters != newState.data.filters,
      builder: (BuildContext context, RequestViewerState state) {
        return AppBarFiltersButton(
          filters: state.data.filters,
          onPressed: () async {
            Object res = await Navigator.of(context).pushNamed(
                AppRoutes.routeFilters,
                arguments: FiltersScreenArgs(filters: state.data.filters));

            if (res is Filters) {
              context.bloc<RequestViewerBloc>().updateFilters(res);
            }
          },
        );
      },
    );
  }
}
