import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/utils/object_utils.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';

part 'request_destination.freezed.dart';
part 'request_destination.g.dart';

@freezed
abstract class RequestDestination with _$RequestDestination {
  const RequestDestination._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestDestination(
      {@required RequestDestinationType type,
      List<String> codes,
      RequestDestinationCodeType codeType}) = _RequestDestination;

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory RequestDestination.none(
      {@nullable List<String> codes,
      @Default(RequestDestinationType.all) RequestDestinationType type,
      @nullable RequestDestinationCodeType codeType}) = _NoRequestDestination;

  factory RequestDestination.fromJson(Map<String, dynamic> json) =>
      _$RequestDestinationFromJson(json);

  bool get hasNoDestination =>
      this is _NoRequestDestination ||
      (IterableUtils.isEmpty(codes) && type == RequestDestinationType.all);
}

enum RequestDestinationType { city, airport, country, continent, category, all }

enum RequestDestinationCodeType { iata }

class RequestDestinationUtils {
  const RequestDestinationUtils._();

  static RequestDestination extractDestination(
      SmartCacheRequestDestination request) {
    if (request == null) {
      return RequestDestination.none();
    }

    return RequestDestination(
        codes: request.codes,
        type: ObjectUtils.extract(request.type,
            (SmartCacheRequestDestinationType type) {
          switch (type) {
            case SmartCacheRequestDestinationType.airport:
              return RequestDestinationType.airport;
            case SmartCacheRequestDestinationType.city:
              return RequestDestinationType.city;
            case SmartCacheRequestDestinationType.country:
              return RequestDestinationType.country;
            case SmartCacheRequestDestinationType.continent:
              return RequestDestinationType.continent;
            case SmartCacheRequestDestinationType.category:
              return RequestDestinationType.category;
            case SmartCacheRequestDestinationType.open:
            default:
              return RequestDestinationType.all;
          }
        }),
        codeType: RequestDestinationCodeType.iata);
  }

  static SmartCacheRequestDestination toBestDeal(
      RequestDestination destination) {
    if (destination == null) {
      return SmartCacheRequestDestination(
          type: SmartCacheRequestDestinationType.open);
    }

    return SmartCacheRequestDestination(
        codes: destination.codes,
        type: ObjectUtils.extract<RequestDestinationType,
                SmartCacheRequestDestinationType>(destination.type,
            (RequestDestinationType type) {
          switch (type) {
            case RequestDestinationType.airport:
              return SmartCacheRequestDestinationType.airport;
            case RequestDestinationType.city:
              return SmartCacheRequestDestinationType.city;
            case RequestDestinationType.country:
              return SmartCacheRequestDestinationType.country;
            case RequestDestinationType.continent:
              return SmartCacheRequestDestinationType.continent;
            case RequestDestinationType.category:
              return SmartCacheRequestDestinationType.category;
            case RequestDestinationType.all:
            default:
              return SmartCacheRequestDestinationType.open;
          }
        }),
        codeTypes: destination.type != RequestDestinationType.all
            ? SmartCacheCodeType.iata
            : null);
  }

  static SmartCacheFixedLocation toFixedLocation(
      RequestDestination destination) {
    SmartCacheFixedLocationType type;

    if (destination.type != null) {
      switch (destination.type) {
        case RequestDestinationType.city:
          type = SmartCacheFixedLocationType.city;
          break;
        case RequestDestinationType.airport:
          type = SmartCacheFixedLocationType.airport;
          break;
        default:
        // Not supported
      }
    }

    return SmartCacheFixedLocation(
        code: destination.codes.first,
        codeTypes: SmartCacheCodeType.iata,
        type: type ?? SmartCacheFixedLocationType.city);
  }

  static Location toLocation(RequestDestination destination, String label,
      {String countryName, String countryCode}) {
    return Location(
        code: destination.codes?.first,
        label: label,
        countryCode: countryCode,
        countryName: countryName,
        direction: LocationDirection.to);
  }
}
