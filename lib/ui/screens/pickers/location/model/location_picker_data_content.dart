import 'package:flutter/material.dart';
import 'package:mowgli/data/network/dio/autocompletion/model/response/autocompletion_response.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';
import 'package:provider/provider.dart';

class LocationPickerSuggestions {
  final Iterable<LocationPickerSuggestionItem> airportItems;
  final Iterable<LocationPickerSuggestionItem> categoryItems;
  final Iterable<LocationPickerSuggestionItem> countryItems;
  final Iterable<LocationPickerSuggestionItem> cityItems;

  LocationPickerSuggestions._(
      {this.airportItems,
      this.categoryItems,
      this.countryItems,
      this.cityItems});

  LocationPickerSuggestions.fromNetwork(AutoCompletionResponse results)
      : airportItems = _load(results, AutoCompletionResultType.airport),
        categoryItems = _load(results, AutoCompletionResultType.category),
        countryItems = _load(results, AutoCompletionResultType.country),
        cityItems = _load(results, AutoCompletionResultType.city);

  static Iterable<LocationPickerSuggestionItem> _load(
      AutoCompletionResponse results, AutoCompletionResultType type) {
    AutoCompletionResult autoCompletionResult = results[type];

    if (autoCompletionResult == null || autoCompletionResult.isEmpty) {
      return List<LocationPickerSuggestionItem>.empty();
    } else {
      return autoCompletionResult.items.map((AutoCompletionResultItem item) =>
          LocationPickerSuggestionItem._fromNetwork(
              item, LocationTypeUtils.from(type)));
    }
  }

  List<LocationPickerSuggestionItem> get items =>
      <LocationPickerSuggestionItem>[
        if (cityItems != null) ...cityItems,
        if (airportItems != null) ...airportItems,
        if (countryItems != null) ...countryItems,
        if (categoryItems != null) ...categoryItems,
      ];

  int get totalCount =>
      IterableUtils.length(airportItems) +
      IterableUtils.length(categoryItems) +
      IterableUtils.length(countryItems) +
      IterableUtils.length(cityItems);

  LocationPickerSuggestions filter(Iterable<LocationType> types) {
    if (IterableUtils.isEmpty(types)) {
      return this;
    } else {
      return LocationPickerSuggestions._(
          airportItems:
              types.contains(LocationType.airport) ? airportItems : null,
          categoryItems:
              types.contains(LocationType.category) ? categoryItems : null,
          countryItems:
              types.contains(LocationType.country) ? countryItems : null,
          cityItems: types.contains(LocationType.city) ? cityItems : null);
    }
  }
}

class LocationPickerSuggestionItem {
  final String code;
  final String name;
  final String countryCode;
  final String countryName;
  final LocationType type;
  Iterable<LocationPickerSuggestionItem> airports;

  LocationPickerSuggestionItem(
      {this.code,
      this.name,
      this.countryCode,
      this.countryName,
      this.type,
      this.airports});

  LocationPickerSuggestionItem._fromNetwork(
      AutoCompletionResultItem item, this.type)
      : code = item.code,
        name = item.name,
        countryCode = item.countryCode,
        countryName = item.countryName,
        airports = item.airports?.map((AutoCompletionResultItem item) =>
            LocationPickerSuggestionItem._fromNetwork(
                item, LocationType.airport));

  LocationPickerSuggestionItem.city(Location city)
      : code = city?.code,
        name = city?.label,
        type = LocationType.city,
        countryCode = city?.countryCode,
        countryName = city?.countryName,
        airports = city?.airports?.map((Location airport) =>
            LocationPickerSuggestionItem.airport(airport));

  LocationPickerSuggestionItem.airport(Location airport)
      : code = airport.code,
        name = airport.label,
        countryCode = airport.countryCode,
        countryName = airport.countryName,
        type = LocationType.airport;

  LocationPickerSuggestionItem replaceAirports(
          List<LocationPickerSuggestionItem> _airports) =>
      LocationPickerSuggestionItem(
          code: code,
          name: name,
          countryCode: countryCode,
          countryName: countryName,
          type: type,
          airports: _airports);

  Location toLocationItem(LocationDirection direction) => Location(
      type: type,
      code: code,
      label: name,
      countryCode: countryCode,
      countryName: countryName,
      airports: airports?.map((LocationPickerSuggestionItem airport) =>
          airport.toLocationItem(null)),
      direction: direction);

  bool containsAirport(LocationPickerSuggestionItem airport) {
    if (airports != null) {
      for (LocationPickerSuggestionItem _airport in airports) {
        if (_airport.code == airport.code) {
          return true;
        }
      }
    }
    return false;
  }
}

class LocationPickerScreenArgs {
  final Location existingLocation;
  final LocationDirection direction;
  final Iterable<LocationType> filters;

  LocationPickerScreenArgs.from(this.existingLocation)
      : direction = LocationDirection.from,
        filters = <LocationType>{LocationType.city};

  LocationPickerScreenArgs.to({this.existingLocation, this.filters})
      : direction = LocationDirection.to;

  static LocationPickerScreenArgs of(BuildContext context) {
    return Provider.of<LocationPickerScreenArgs>(context, listen: false);
  }
}
