import 'dart:math';

import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/airports/airports_interface.dart';
import 'package:mowgli/data/location/location_interface.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_homepage_response.dart';
import 'package:mowgli/data/storage/hive/model/hive_airport.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';

part 'homepage_event.dart';

class HomePageBloc extends BaseBloc<_HomePageEvent, HomePageState> {
  CancelToken _cancelToken;
  double imageWidth;

  HomePageBloc(this.imageWidth) : super(_initialState()) {
    loadDefaultHomepage();
  }

  static HomePageState _initialState() => HomePageState.loading();

  void loadDefaultHomepage() {
    dispatch(const _LoadDefaultHomePageEvent());
  }

  void changeLocationTo(Location res) {
    dispatch(_ChangeLocationEvent(res));
  }

  void updateFilters(Filters filters) {
    dispatch(_UpdateFiltersEvent(filters));
  }

  @override
  Stream<HomePageState> mapEventToState(_HomePageEvent event) async* {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    if (event is _LoadDefaultHomePageEvent) {
      StoredLocation storedLocation =
          await ApplicationServices.location.getStoredLocation();
      Iterable<StoredAirport> storedAirports =
          await ApplicationServices.airports.getStoredAirports();
      Iterable<HomePageLocation> airports = storedAirports?.map(
          (StoredAirport airport) =>
              HomePageLocation.airport(code: airport.code));
      HomePageLocation location;
      if (storedLocation?.code != null && storedLocation?.label != null) {
        location = HomePageLocation.city(
            code: storedLocation.code, label: storedLocation.label);
      }
      yield HomePageState.loading(location: location);
      yield await _onLoadDefaultEvents(location, airports);
    } else if (event is _ChangeLocationEvent) {
      switch (event.location.type) {
        case LocationType.city:
          HomePageLocation fallbackLocation = HomePageLocation.city(
            code: event.location.code,
            label: event.location.label,
          );

          _onStoreLocationEvent(event.location);
          _onStoreAirportsEvent(event.location.airports);

          yield HomePageState.loading(location: fallbackLocation);
          yield await _onLoadFromCity(
              event.location.code, event.location.airports, fallbackLocation);
          break;
        default:
          throw Exception(
              'Location of type ${event.location.type} is not supported on the '
              'homepage!');
      }
    }
  }

  Future<void> _onStoreLocationEvent(Location location) async {
    int localLocationId = Random().nextInt(0x80000000);
    LocationService locationService =
        await ApplicationServices.location.locationServices;

    locationService.generateLocation(localLocationId, location);
  }

  Future<void> _onStoreAirportsEvent(Iterable<Location> airports) async {
    AirportsService airportsService =
        await ApplicationServices.airports.airportsServices;
    List<HiveAirport> _airports = <HiveAirport>[];
    if (airports != null) {
      for (Location airport in airports) {
        int localAirportId = Random().nextInt(0x80000000);

        _airports.add(HiveAirport.fromAirport(airport, localAirportId));
      }
    }
    airportsService.generateAirports(_airports);
  }

  Future<HomePageState> _onLoadDefaultEvents(HomePageLocation cacheLocation,
          Iterable<HomePageLocation> airports) =>
      _mapData(ApplicationServices.network.generateDefaultHomePage(
          imageWidth: imageWidth.toInt(),
          cancelToken: _cancelToken = CancelToken(),
          location: cacheLocation,
          airports: airports));

  Future<HomePageState> _onLoadFromCity(String cityCode,
          Iterable<Location> airports, HomePageLocation fallbackLocation) =>
      _mapData(
          ApplicationServices.network.generateHomePageFromCity(
              cityCode, airports,
              imageWidth: imageWidth.toInt(),
              cancelToken: _cancelToken = CancelToken()),
          fallbackLocation: fallbackLocation);

  Future<HomePageState> _mapData(Future<SmartCacheHomePageResponse> request,
          {HomePageLocation fallbackLocation}) =>
      request
          .then((SmartCacheHomePageResponse response) =>
              HomePageContent.fromNetwork(response))
          .then((HomePageContent value) {
        if (IterableUtils.isEmpty(value.sections)) {
          return HomePageState.empty(location: value.location);
        } else {
          return HomePageState(data: value);
        }
      }).catchError((Object error, StackTrace trace) {
        logError(
            message: 'Unable to load events', error: error, stackTrace: trace);
        return Future<HomePageState>.value(
            HomePageState.error(location: fallbackLocation));
      });

  @override
  Future<void> close() {
    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    return super.close();
  }
}
