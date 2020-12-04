import 'package:mowgli/ui/screens/destination_viewer/bloc/impl/destination_viewer_state.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_origin.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/ui/utils/object_utils.dart';

part 'destination_viewer_event.dart';

class DestinationViewerBloc
    extends BaseBloc<_DestinationViewerEvent, DestinationViewerState> {
  final Location _originLocation;
  final Location _initialDestinationLocation;

  DestinationViewerBloc(
      Location originLocation, Location destinationLocation, Request request)
      : _originLocation = originLocation,
        _initialDestinationLocation = destinationLocation,
        super(_initialState(destinationLocation, request: request)) {
    if (_initialDestinationLocation != null) {
      changeLocationTo(_initialDestinationLocation);
    }
  }

  static DestinationViewerState _initialState(Location location,
          {Request request}) =>
      DestinationViewerState.initial(location: location, request: request);

  void changeLocationTo(Location location) {
    dispatch(_ChangeDestinationDataEvent(location));
  }

  @override
  Stream<DestinationViewerState> mapEventToState(
      _DestinationViewerEvent event) async* {
    if (event is _ChangeDestinationDataEvent) {
      yield DestinationViewerState(
          location: event.location,
          request: createRequest(_originLocation, event.location));
    }
  }

  Request createRequest(Location originLocation, Location destinationLocation) {
    return Request.location(
        origin: RequestOrigin(
            code: originLocation.code,
            type: RequestOriginType.city,
            codeType: RequestOriginCodeType.iata,
            customerLocations: originLocation.airports?.map(
                (Location airport) =>
                    RequestOrigin.airport(code: airport.code))),
        destination: RequestDestination(
            codes: <String>[destinationLocation.code],
            type: ObjectUtils.extract(destinationLocation.type,
                (LocationType type) {
              switch (type) {
                case LocationType.airport:
                  return RequestDestinationType.airport;
                case LocationType.category:
                  return RequestDestinationType.category;
                case LocationType.country:
                  return RequestDestinationType.country;
                case LocationType.city:
                default:
                  return RequestDestinationType.city;
              }
            })));
  }
}
