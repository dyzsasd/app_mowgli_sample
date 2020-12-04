import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/destination_viewer/destination_viewer_screen.dart';
import 'package:mowgli/ui/screens/filters/filters_screen.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_date.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';

class HomePageAppBarSecondLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 6.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AppBarSearchContainer(
              hint: Translations.of(context).homePageAppBarSearchHint,
              onPressed: () async {
                Object res = await Navigator.of(context).pushNamed(
                    AppRoutes.routeDestinationPicker,
                    arguments: LocationPickerScreenArgs.to());

                if (res is Location) {
                  Location location = context.bloc<HomePageBloc>().state.when(
                      (HomePageContent data) => data.location?.toLocation(),
                      loading: (HomePageLocation location) =>
                          location?.toLocation(),
                      empty: (HomePageLocation location) =>
                          location?.toLocation(),
                      error: (HomePageLocation location) =>
                          location?.toLocation());

                  if (<LocationType>[LocationType.city, LocationType.airport]
                      .contains(res.type)) {
                    Navigator.of(context).pushNamed(AppRoutes.routeDealDetails,
                        arguments: DealDetailsScreenArgs.request(
                          request: Request.location(
                              origin: location.toOriginLocation(),
                              destination: RequestDestination(
                                  codes: <String>[res.code],
                                  type: LocationTypeUtils
                                      .toRequestDestinationType(res.type),
                                  codeType: RequestDestinationCodeType.iata)),
                          departure: location,
                          arrival: res,
                        ));
                  } else {
                    Navigator.of(context).pushNamed(
                        AppRoutes.routeDestinationDetails,
                        arguments: DestinationViewerScreenArgs.fromLocation(
                            origin: context.bloc<HomePageBloc>().state.when(
                                (HomePageContent data) =>
                                    data.location?.toLocation(),
                                loading: (HomePageLocation location) =>
                                    location?.toLocation(),
                                empty: (HomePageLocation location) =>
                                    location?.toLocation(),
                                error: (HomePageLocation location) =>
                                    location?.toLocation()),
                            destination: res));
                  }
                }
              },
            ),
          ),
          const SizedBox(width: 3.0),
          AppBarFiltersButton.fixed(onPressed: () async {
            Object filters = await Navigator.of(context).pushNamed(
                AppRoutes.routeFilters,
                arguments: FiltersScreenArgs());

            if (filters is Filters) {
              HomePageState state = context.bloc<HomePageBloc>().state;

              RequestDate outboundDate;
              RequestDate inboundDate;
              if (filters.dates?.flexibleDates != null) {
                outboundDate = RequestDate(
                    flexibleDatesMin: filters.dates.flexibleDates.fromDate,
                    flexibleDatesMax: filters.dates.flexibleDates.toDate);
                inboundDate = RequestDate(
                    flexibleDatesMin: filters.dates.flexibleDates.fromDate,
                    flexibleDatesMax: filters.dates.flexibleDates.toDate);
              } else if (filters.dates?.fixedDates != null &&
                  filters.dates?.fixedDates?.flexible == true) {
                outboundDate =
                    RequestDate(date: filters.dates.fixedDates.fromDate);
                inboundDate =
                    RequestDate(date: filters.dates.fixedDates.toDate);
              } else if (filters.dates?.fixedDates != null) {
                outboundDate = RequestDate(
                    date: filters.dates.fixedDates.fromDate,
                    flexibleFixedDates: false);
                inboundDate = RequestDate(
                    date: filters.dates.fixedDates.toDate,
                    flexibleFixedDates: false);
              }

              state.maybeWhen((HomePageContent content) async {
                Navigator.of(context).pushNamed(
                  AppRoutes.routeDestinationDetails,
                  arguments: DestinationViewerScreenArgs.fromRequest(
                    origin: content.location.toLocation(),
                    request: Request(
                        origin:
                            content.location.toLocation().toOriginLocation(),
                        destination: RequestDestination.none(),
                        filters: filters,
                        outboundDate: outboundDate ?? RequestDate.empty(),
                        inboundDate: inboundDate ?? RequestDate.empty(),
                        maxStopOvers: filters.stopOvers?.maxStopOvers),
                  ),
                );
              }, orElse: () => <void>{});
            }
          })
        ],
      ),
    );
  }
}
