import 'package:flutter/foundation.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/utils/date_utils.dart';

class ListItemDestinationData {
  final String id;
  final DateTime date;
  final String destinationCityName;
  final String destinationCityCode;
  final String destinationCountry;
  final ListItemDestinationHopData outBoundHop;
  final ListItemDestinationHopData inBoundHop;
  final String thumbnail;
  final num price;
  final String currency;
  final Request request;

  ListItemDestinationData(
      {@required this.id,
      @required this.date,
      @required this.destinationCityName,
      @required this.destinationCityCode,
      @required this.destinationCountry,
      @required this.outBoundHop,
      @required this.inBoundHop,
      @required this.thumbnail,
      @required this.price,
      @required this.currency,
      @required this.request})
      : assert(request != null);

  String get departureCityName => outBoundHop?.departureCityName;

  String get departureCityCode => outBoundHop?.departureCityCode;

  DateTime get arrivalDate =>
      inBoundHop?.arrivalDate ?? outBoundHop?.arrivalDate;

  Location get departureLocation {
    return Location.from(
        type: LocationType.city,
        code: outBoundHop.departureCityCode,
        label: outBoundHop.departureCityName);
  }

  Location get arrivalLocation {
    if (request.destination.type != RequestDestinationType.airport) {
      if (inBoundHop != null) {
        return Location.to(
            type: LocationType.city,
            code: inBoundHop.departureCityCode,
            label: inBoundHop.departureCityName);
      } else if (outBoundHop != null) {
        return Location.to(
            type: LocationType.city,
            code: outBoundHop.arrivalCityCode,
            label: outBoundHop.arrivalCityName);
      }
    } else {
      if (inBoundHop != null) {
        return Location.to(
            type: LocationType.airport,
            code: inBoundHop.departureAirportCode,
            label: inBoundHop.departureCityName);
      } else if (outBoundHop != null) {
        return Location.to(
            type: LocationType.airport,
            code: outBoundHop.arrivalAirportCode,
            label: outBoundHop.arrivalCityName);
      }
    }

    return Location.to(
        type: LocationType.city,
        code: destinationCityCode,
        label: destinationCityName,
        countryName: destinationCountry);
  }
}

class ListItemDestinationHopData {
  final String departureCityName;
  final String departureCityCode;
  final String departureAirportCode;
  final DateTime departureDate;
  final String arrivalCityName;
  final String arrivalCityCode;
  final String arrivalAirportCode;
  final DateTime arrivalDate;
  final String companyName;
  final String companyPictureUrl;
  final bool hasMultipleCompanies;
  final int stopOvers;
  final _ListItemDestinationHopDataType type;

  ListItemDestinationHopData._(
      {@required this.departureCityName,
      @required this.departureCityCode,
      @required this.departureAirportCode,
      @required this.departureDate,
      @required this.arrivalCityName,
      @required this.arrivalCityCode,
      @required this.arrivalAirportCode,
      @required this.arrivalDate,
      @required this.type,
      @required this.companyName,
      @required this.companyPictureUrl,
      @required this.hasMultipleCompanies,
      @required this.stopOvers});

  ListItemDestinationHopData.inbound(
      {@required String departureCityName,
      @required String departureCityCode,
      @required String departureAirportCode,
      @required DateTime departureDate,
      @required String arrivalCityName,
      @required String arrivalCityCode,
      @required String arrivalAirportCode,
      @required DateTime arrivalDate,
      @required String companyName,
      @required String companyPictureUrl,
      @required bool hasMultipleCompanies,
      @required int stopOvers})
      : this._(
          departureCityName: departureCityName?.trim(),
          departureCityCode: departureCityCode?.trim(),
          departureAirportCode: departureAirportCode?.trim(),
          departureDate: departureDate,
          arrivalCityName: arrivalCityName?.trim(),
          arrivalCityCode: arrivalCityCode?.trim(),
          arrivalAirportCode: arrivalAirportCode?.trim(),
          arrivalDate: arrivalDate,
          type: _ListItemDestinationHopDataType.inbound,
          companyName: companyName,
          companyPictureUrl: companyPictureUrl,
          hasMultipleCompanies: hasMultipleCompanies,
          stopOvers: stopOvers,
        );

  ListItemDestinationHopData.outbound(
      {@required String departureCityName,
      @required String departureCityCode,
      @required String departureAirportCode,
      @required DateTime departureDate,
      @required String arrivalCityName,
      @required String arrivalCityCode,
      @required String arrivalAirportCode,
      @required DateTime arrivalDate,
      @required String companyName,
      @required String companyPictureUrl,
      @required bool hasMultipleCompanies,
      @required int stopOvers})
      : this._(
          departureCityName: departureCityName?.trim(),
          departureCityCode: departureCityCode?.trim(),
          departureAirportCode: departureAirportCode?.trim(),
          departureDate: departureDate,
          arrivalCityName: arrivalCityName?.trim(),
          arrivalCityCode: arrivalCityCode?.trim(),
          arrivalAirportCode: arrivalAirportCode?.trim(),
          arrivalDate: arrivalDate,
          type: _ListItemDestinationHopDataType.outbound,
          companyName: companyName,
          companyPictureUrl: companyPictureUrl,
          hasMultipleCompanies: hasMultipleCompanies,
          stopOvers: stopOvers,
        );

  int get arrivalDifference => arrivalDate.diffInDays(departureDate);
}

enum _ListItemDestinationHopDataType { inbound, outbound }
