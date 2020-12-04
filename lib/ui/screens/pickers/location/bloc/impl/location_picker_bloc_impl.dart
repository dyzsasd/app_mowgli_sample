import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/autocompletion/model/response/autocompletion_response.dart';
import 'package:mowgli/ui/screens/pickers/location/bloc/impl/location_picker_state.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/text_utils.dart';
import 'package:rxdart/rxdart.dart';

part 'location_picker_event.dart';

class LocationPickerBloc
    extends BaseBloc<_LocationPickerEvent, LocationPickerState> {
  final PublishSubject<String> _subject = PublishSubject<String>();
  final Iterable<LocationType> filters;
  CancelToken _cancelToken;
  StreamSubscription<String> _searchSubscription;
  LocationPickerSuggestionItem initialLocation;
  Iterable<LocationPickerSuggestionItem> _airports;
  LocationPickerSuggestions _data;

  LocationPickerBloc(this.filters, {this.initialLocation})
      : super(_initialState()) {
    _searchSubscription = _subject
        .distinct()
        .debounceTime(const Duration(milliseconds: 500))
        .listen((String search) {
      dispatch(_LoadSuggestionsEvent(search));
    });
  }

  static LocationPickerState _initialState() => LocationPickerState.initial();

  void loadSuggestionsFor(String search) {
    if (TextUtils.isNotEmpty(search)) {
      _subject.add(search);
    }
  }

  void generateFilter() {
    dispatch(const _GenerateFilterEvent());
  }

  void addAirport(LocationPickerSuggestionItem airport,
      LocationPickerSuggestionItem location) {
    dispatch(_AddAirportEvent(airport, location));
  }

  void removeAirport(LocationPickerSuggestionItem airport,
      LocationPickerSuggestionItem location) {
    dispatch(_RemoveAirportEvent(airport, location));
  }

  void addLocation(LocationPickerSuggestionItem location,
      Iterable<LocationPickerSuggestionItem> airports) {
    dispatch(_AddLocationEvent(location, airports));
  }

  void removeLocation(LocationPickerSuggestionItem location) {
    dispatch(_RemoveLocationEvent(location));
  }

  void keyboardAction(bool open) {
    dispatch(_KeyboardActionEvent(open));
  }

  @override
  Stream<LocationPickerState> mapEventToState(
      _LocationPickerEvent event) async* {
    List<LocationPickerSuggestionItem> airports =
        <LocationPickerSuggestionItem>[];
    if (event is _LoadSuggestionsEvent) {
      if (_cancelToken?.isCancelled == false) {
        _cancelToken?.cancel();
      }

      yield LocationPickerState.loading(
          previousSuggestions: state.map(
              (LocationPickerDataState value) => value.data,
              initial: (_) => null,
              empty: (_) => null,
              loading: (_) => null,
              error: (_) => null,
              ready: (_) => null));

      yield await _onLoadSuggestions(event.search);
    } else if (event is _AddAirportEvent) {
      _airports = event.location.airports;
      LocationPickerSuggestionItem location = LocationPickerSuggestionItem(
          code: event.location.code,
          name: event.location.name,
          countryCode: event.location.countryCode,
          countryName: event.location.countryName,
          type: event.location.type,
          airports: []);
      if (initialLocation?.airports != null) {
        airports = initialLocation?.airports?.toList();
      }
      airports.add(event.airport);
      initialLocation = location.replaceAirports(airports);
      yield LocationPickerState(
          data: _data,
          location: initialLocation,
          showValidateButton: initialLocation != null);
    } else if (event is _AddLocationEvent) {
      _airports = event.location.airports;
      initialLocation = LocationPickerSuggestionItem(
          code: event.location.code,
          name: event.location.name,
          countryCode: event.location.countryCode,
          countryName: event.location.countryName,
          type: event.location.type,
          airports: event.airports);
      yield LocationPickerState(
          data: _data,
          location: initialLocation,
          showValidateButton: initialLocation != null);
    } else if (event is _RemoveAirportEvent) {
      LocationPickerSuggestionItem location = LocationPickerSuggestionItem(
          code: event.location.code,
          name: event.location.name,
          countryCode: event.location.countryCode,
          countryName: event.location.countryName,
          type: event.location.type,
          airports: []);
      if (initialLocation?.airports != null) {
        airports = initialLocation?.airports?.toList();
      } else {
        airports = event.location.airports.toList();
      }
      airports.removeWhere((LocationPickerSuggestionItem item) =>
          item.code == event.airport.code);
      if (airports.isEmpty) {
        initialLocation = null;
      } else {
        initialLocation = location.replaceAirports(airports);
      }
      yield LocationPickerState(
          data: _data,
          location: initialLocation,
          showValidateButton: initialLocation != null);
    } else if (event is _RemoveLocationEvent) {
      initialLocation = null;
      _airports = null;
      yield LocationPickerState(
          data: _data,
          location: initialLocation,
          showValidateButton: initialLocation != null);
    } else if (event is _KeyboardActionEvent) {
      yield LocationPickerState(
          data: _data,
          location: initialLocation,
          showValidateButton: !event.open ? initialLocation != null : false);
    } else if (event is _GenerateFilterEvent) {
      yield LocationPickerState.ready(
          location: initialLocation, airports: _airports);
    }
  }

  Future<LocationPickerState> _onLoadSuggestions(String search) {
    return ApplicationServices.network
        .listAutoCompleteSuggestions(search,
            cancelToken: _cancelToken = CancelToken())
        .then((AutoCompletionResponse response) =>
            LocationPickerSuggestions.fromNetwork(response))
        .then((LocationPickerSuggestions value) => value.filter(filters))
        .then((LocationPickerSuggestions value) {
      if (value.totalCount == 0) {
        return LocationPickerState.empty();
      } else {
        _data = value;
        return LocationPickerState(
            data: value, location: initialLocation, showValidateButton: false);
      }
    }).catchError((Object error) {
      if (error is DioError && error.type == DioErrorType.CANCEL) {
        return state;
      } else {
        logError(message: 'Unable to load events', error: error);
        return Future<LocationPickerState>.value(LocationPickerState.error());
      }
    });
  }

  @override
  Future<void> close() {
    _subject.close();
    _searchSubscription?.cancel();

    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
    }

    return super.close();
  }
}
