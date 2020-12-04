import 'package:mowgli/data/network/dio/autocompletion/model/response/autocompletion_response.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_origin.dart';

class Location {
  final LocationType type;
  final String code;
  final String countryCode;
  final String countryName;
  final String label;
  final Iterable<Location> airports;
  final LocationDirection direction;

  Location(
      {this.type,
      this.code,
      this.countryCode,
      this.countryName,
      this.label,
      this.airports,
      this.direction});

  Location.to(
      {this.type,
      this.code,
      this.countryCode,
      this.countryName,
      this.label,
      this.airports})
      : direction = LocationDirection.to;

  Location.from(
      {this.type,
      this.code,
      this.countryCode,
      this.countryName,
      this.label,
      this.airports})
      : direction = LocationDirection.from;

  RequestOrigin toOriginLocation() {
    return RequestOrigin(
        code: code,
        codeType: RequestOriginCodeType.iata,
        type: RequestOriginType.city,
        customerLocations:
            airports?.map((Location airport) => airport.toCustomerLocations()));
  }

  RequestOrigin toCustomerLocations() {
    return RequestOrigin(
        code: code,
        codeType: RequestOriginCodeType.iata,
        type: RequestOriginType.airport);
  }
}

enum LocationType {
  airport,
  category,
  country,
  continent,
  city,
}

class LocationTypeUtils {
  const LocationTypeUtils._();

  static LocationType from(AutoCompletionResultType type) {
    switch (type) {
      case AutoCompletionResultType.airport:
        return LocationType.airport;
      case AutoCompletionResultType.category:
        return LocationType.category;
      case AutoCompletionResultType.continent:
        return LocationType.continent;
      case AutoCompletionResultType.country:
        return LocationType.country;
      case AutoCompletionResultType.city:
        return LocationType.city;
    }

    throw Exception('Unknown type $type!');
  }

  static RequestDestinationType toRequestDestinationType(LocationType type) {
    switch (type) {
      case LocationType.airport:
        return RequestDestinationType.airport;
      case LocationType.category:
        return RequestDestinationType.category;
      case LocationType.country:
        return RequestDestinationType.country;
      case LocationType.city:
        return RequestDestinationType.city;
      default:
        return null;
    }
  }
}

enum LocationDirection { from, to }
