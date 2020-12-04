import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';

part 'request_origin.freezed.dart';
part 'request_origin.g.dart';

@freezed
abstract class RequestOrigin with _$RequestOrigin {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestOrigin(
      {@required String code,
      @required RequestOriginType type,
      @required RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) = _RequestOrigin;

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestOrigin.city(
      {@required String code,
      @Default(RequestOriginType.city) RequestOriginType type,
      @Default(RequestOriginCodeType.iata) RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) = _RequestOriginCity;

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestOrigin.airport(
      {@required String code,
      @Default(RequestOriginType.airport) RequestOriginType type,
      @Default(RequestOriginCodeType.iata) RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) = _RequestOriginAirport;

  factory RequestOrigin.fromJson(Map<String, dynamic> json) =>
      _$RequestOriginFromJson(json);
}

enum RequestOriginType { city, airport }

enum RequestOriginCodeType { iata }

class RequestOriginUtils {
  const RequestOriginUtils._();

  static RequestOrigin extractOrigin(SmartCacheRequestOrigin request) {
    return RequestOrigin.city(
        code: request.code,
        customerLocations: request.customerLocations?.map(
            (SmartCacheRequestOrigin airport) =>
                RequestOriginUtils.extractOrigin(airport)));
  }

  static SmartCacheRequestOrigin toBestDeal(RequestOrigin request) {
    return SmartCacheRequestOrigin(
        code: request.code,
        codeTypes: SmartCacheCodeType.iata,
        type: SmartCacheRequestOriginType.city,
        customerLocations: request.customerLocations?.map(
            (RequestOrigin airport) =>
                RequestOriginUtils.toAirportRequestOrigin(airport)));
  }

  static SmartCacheFixedLocation toFixedLocation(RequestOrigin request) {
    return SmartCacheFixedLocation(
        code: request.code,
        codeTypes: SmartCacheCodeType.iata,
        type: SmartCacheFixedLocationType.city,
        customerLocations: request.customerLocations?.map(
            (RequestOrigin airport) =>
                RequestOriginUtils.toAirportFixedLocation(airport)));
  }

  static SmartCacheFixedLocation toAirportFixedLocation(RequestOrigin request) {
    return SmartCacheFixedLocation(
        code: request.code,
        codeTypes: SmartCacheCodeType.iata,
        type: SmartCacheFixedLocationType.airport);
  }

  static SmartCacheRequestOrigin toAirportRequestOrigin(RequestOrigin request) {
    return SmartCacheRequestOrigin(
        code: request.code,
        codeTypes: SmartCacheCodeType.iata,
        type: SmartCacheRequestOriginType.airport);
  }

  static Location toLocation(RequestOrigin origin, String label,
      {String countryName, String countryCode}) {
    return Location(
        code: origin.code,
        label: label,
        countryCode: countryCode,
        countryName: countryName,
        direction: LocationDirection.from);
  }
}
