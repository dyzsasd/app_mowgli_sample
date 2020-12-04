import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/destination_viewer/bloc/destination_viewer_bloc.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/request_viewer.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/request_viewer_filters_button.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/ui/utils/bloc.dart';

class DestinationViewerScreen extends StatelessWidget {
  final DestinationViewerScreenArgs args;

  DestinationViewerScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithBuilder<DestinationViewerBloc,
        DestinationViewerState>(
      create: (_) =>
          DestinationViewerBloc(args.origin, args.destination, args.request),
      builder: (BuildContext context, DestinationViewerState state) {
        return RequestListViewerScreen(
          request: state.request,
          appBar: _DestinationViewerAppBar(
              !state.isInitial || state.hasNoDestination),
        );
      },
    );
  }
}

class DestinationViewerScreenArgs {
  final Location origin;
  final Location destination;
  final Request request;

  DestinationViewerScreenArgs.fromLocation(
      {@required this.origin, @required this.destination})
      : request = null,
        assert(destination != null);

  DestinationViewerScreenArgs.fromRequest(
      {@required this.request, @required this.origin})
      : destination = null,
        assert(request != null);
}

class _DestinationViewerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isEditable;

  _DestinationViewerAppBar(this.isEditable);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DestinationViewerBloc, DestinationViewerState>(
      builder: (BuildContext context, DestinationViewerState state) {
        Translations translations = Translations.of(context);

        return MowgliAppBar(
          context: context,
          bottomLineBorder: false,
          title: AppBarSearchContainer(
            value: getTitle(translations, state.location),
            hint: translations.homePageAppBarSearchHint,
            onPressed: isEditable
                ? () async {
                    Object res = await Navigator.of(context).pushNamed(
                        AppRoutes.routeDestinationPicker,
                        arguments:
                            LocationPickerScreenArgs.to(filters: <LocationType>{
                          LocationType.airport,
                          LocationType.category,
                          LocationType.city,
                          LocationType.country
                        }, existingLocation: state.location));

                    if (res is Location) {
                      if (res.type == LocationType.city) {
                        Navigator.of(context).pushNamed(
                            AppRoutes.routeDealDetails,
                            arguments: DealDetailsScreenArgs.request(
                              request: state.request.copyWith(
                                  destination: RequestDestination(
                                      codes: <String>[res.code],
                                      type: LocationTypeUtils
                                          .toRequestDestinationType(res.type),
                                      codeType:
                                          RequestDestinationCodeType.iata)),
                              departure: state.location,
                              arrival: res,
                            ));
                      } else {
                        context
                            .bloc<DestinationViewerBloc>()
                            .changeLocationTo(res);
                      }
                    }
                  }
                : null,
          ),
          actions: const <Widget>[RequestListViewerFiltersButton()],
        );
      },
    );
  }

  String getTitle(Translations translations, Location location) {
    switch (location?.type) {
      case LocationType.airport:
        return '${location.label} (${location.code})';
      case LocationType.category:
        return location.label;
      case LocationType.country:
        return location.label;
      case LocationType.city:
        return '${location.label} (${location.code})';
      default:
        return null;
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10.0);
}
