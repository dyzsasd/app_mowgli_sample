import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/ui/utils/json_parser.dart';
import 'package:mowgli/utils/collections/collections_utils.dart';

part 'smartcache_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheError {
  String code;
  String message;

  SmartCacheError({this.code, this.message});

  factory SmartCacheError.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheErrorFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheErrorToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheAmount {
  @JsonKey(required: true)
  String currency;
  @JsonKey(required: true)
  num value;

  SmartCacheAmount({@required this.currency, @required this.value});

  factory SmartCacheAmount.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheAmountFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheAmountToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheAmountCat {
  @JsonKey(name: 'ID', required: true)
  SmartCacheAmountCatID catId;
  double lower;
  double upper;

  SmartCacheAmountCat({@required this.catId, this.lower, this.upper});

  factory SmartCacheAmountCat.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheAmountCatFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheAmountCatToJson(this);
}

enum SmartCacheAmountCatID {
  @JsonValue('LOWEST')
  lowest,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('HIGH')
  high
}

enum SmartCacheBestDealRequestOrderMetric {
  @JsonValue('POPULARITY')
  popularity,
  @JsonValue('PRICE')
  price,
  @JsonValue('FRESHNESS')
  freshness
}

enum SmartCacheCabinType {
  @JsonValue('ECONOMY')
  economy,
  @JsonValue('PREMIUM')
  premium,
  @JsonValue('BUSINESS')
  business,
  @JsonValue('FIRST')
  first
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCalendarCell {
  SmartCacheAmount amount;
  SmartCacheAmountCatID cat;
  @JsonKey(name: 'inbound_departure_date', fromJson: JSONParserUtils.parseDate)
  DateTime inboundDepartureDate;
  @JsonKey(name: 'offer_id')
  String offerId;
  @JsonKey(name: 'outbound_departure_date', fromJson: JSONParserUtils.parseDate)
  DateTime outboundDepartureDate;

  SmartCacheCalendarCell(
      {this.amount,
      this.cat,
      this.inboundDepartureDate,
      this.offerId,
      this.outboundDepartureDate});

  factory SmartCacheCalendarCell.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCalendarCellFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCalendarCellToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCoordinates {
  double altitude;
  double latitude;
  double longitude;

  SmartCacheCoordinates({this.altitude, this.latitude, this.longitude});

  factory SmartCacheCoordinates.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCoordinatesToJson(this);
}

enum SmartCacheCurrency {
  @JsonValue('EUR')
  euro,
  @JsonValue('GBP')
  gbp,
  @JsonValue('BRL')
  brl
}

enum SmartCacheDayOfWeek {
  @JsonValue('MONDAY')
  monday,
  @JsonValue('TUESDAY')
  tuesday,
  @JsonValue('WEDNESDAY')
  wednesday,
  @JsonValue('THURSDAY')
  thursday,
  @JsonValue('FRIDAY')
  friday,
  @JsonValue('SATURDAY')
  saturday,
  @JsonValue('SUNDAY')
  sunday
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheFlexibleDate {
  @JsonKey(name: 'days_of_week')
  List<SmartCacheDayOfWeek> daysOfWeek;
  @JsonKey(toJson: JSONParserUtils.formatDate)
  DateTime max;
  @JsonKey(toJson: JSONParserUtils.formatDate)
  DateTime min;
  @JsonKey(required: true)
  SmartCacheFlexibleDateType type;

  SmartCacheFlexibleDate(
      {@required this.type, this.daysOfWeek, this.max, this.min});

  factory SmartCacheFlexibleDate.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheFlexibleDateFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheFlexibleDateToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheFixedDate {
  @JsonKey(toJson: JSONParserUtils.formatDate)
  DateTime date;
  @JsonKey(name: 'plus_minus')
  int plusMinus;

  SmartCacheFixedDate({@required this.date, this.plusMinus});

  factory SmartCacheFixedDate.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheFixedDateFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheFixedDateToJson(this);
}

enum SmartCacheFlexibleDateType {
  @JsonValue('OPEN')
  open,
  @JsonValue('RANGE')
  range
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheFlexibleJourneyDays {
  int max;
  int min;

  SmartCacheFlexibleJourneyDays({this.min, this.max});

  factory SmartCacheFlexibleJourneyDays.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheFlexibleJourneyDaysFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheFlexibleJourneyDaysToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheFlexibleTime {
  @JsonKey(toJson: JSONParserUtils.formatTime)
  DateTime max;
  @JsonKey(toJson: JSONParserUtils.formatTime)
  DateTime min;

  SmartCacheFlexibleTime({this.min, this.max});

  factory SmartCacheFlexibleTime.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheFlexibleTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheFlexibleTimeToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheRecommendationSection {
  String name;
  List<SmartCacheOffer> offers;
  SmartCacheBestDealRequest request;
  SmartCacheRecommendationSectionType type;
  @JsonKey(name: 'continuation_token')
  String nextRequestKey;

  SmartCacheRecommendationSection(
      {this.name, this.offers, this.request, this.type, this.nextRequestKey});

  factory SmartCacheRecommendationSection.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheRecommendationSectionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SmartCacheRecommendationSectionToJson(this);
}

enum SmartCacheRecommendationSectionType {
  @JsonValue('RECOMMENDATION')
  recommendation,
  @JsonValue('LOWEST_FARE')
  lowestFare
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHomePageDateRecommendation {
  String name;
  List<SmartCacheOffer> offers;
  SmartCacheBestDealRequest request;
  SmartCacheHomePageSectionType type;
  @JsonKey(name: 'continuation_token')
  String nextRequestKey;
  @JsonKey(name: 'avatar')
  String thumbnail;

  SmartCacheHomePageDateRecommendation(
      {this.name,
      this.offers,
      this.request,
      this.type,
      this.nextRequestKey,
      this.thumbnail});

  factory SmartCacheHomePageDateRecommendation.fromJson(
          Map<String, dynamic> json) =>
      _$SmartCacheHomePageDateRecommendationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SmartCacheHomePageDateRecommendationToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHomePageSection {
  String name;
  List<SmartCacheOffer> offers;
  SmartCacheBestDealRequest request;
  SmartCacheHomePageSectionType type;
  @JsonKey(name: 'continuation_token')
  String nextRequestKey;

  SmartCacheHomePageSection(
      {this.name, this.offers, this.request, this.type, this.nextRequestKey});

  factory SmartCacheHomePageSection.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHomePageSectionFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHomePageSectionToJson(this);
}

enum SmartCacheHomePageSectionType {
  @JsonValue('RECOMMENDATION')
  recommendation,
  @JsonValue('LOWEST_FARE')
  lowestFare,
  @JsonValue('FILTER_RECO')
  dateRecommendation
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHop {
  @JsonKey(name: 'arrival_date')
  String arrivalDate;
  @JsonKey(name: 'arrival_time')
  String arrivalTime;
  @JsonKey(name: 'departure_date')
  String departureDate;
  @JsonKey(name: 'departure_time')
  String departureTime;
  @JsonKey(name: 'destination_city')
  SmartCacheCity destinationCity;
  int duration;
  String id;
  @JsonKey(name: 'origin_city')
  SmartCacheCity originCity;
  @JsonKey(name: 'stopover_duration')
  num stopoverDuration;
  @JsonKey(name: 'transport_services')
  List<SmartCacheTransportService> transportServices;
  SmartCacheHopType type;
  @JsonKey(name: 'airline_logo')
  String airlineLogo;

  SmartCacheHop(
      {this.arrivalDate,
      this.arrivalTime,
      this.departureDate,
      this.departureTime,
      this.destinationCity,
      this.duration,
      this.id,
      this.originCity,
      this.stopoverDuration,
      this.transportServices,
      this.type,
      this.airlineLogo});

  String get departureAirportCode {
    if (IterableUtils.isEmpty(transportServices)) {
      return null;
    }

    for (SmartCacheTransportService tp in transportServices) {
      if (tp.departureDate == departureDate &&
          tp.departureTime == departureTime) {
        return tp.origin.code;
      }
    }

    return null;
  }

  String get arrivalAirportCode {
    if (IterableUtils.isEmpty(transportServices)) {
      return null;
    }

    for (SmartCacheTransportService tp in transportServices) {
      if (tp.arrivalDate == arrivalDate && tp.arrivalTime == arrivalTime) {
        return tp.destination.code;
      }
    }

    return null;
  }

  factory SmartCacheHop.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHopFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHopToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHopDate {
  @JsonKey(toJson: JSONParserUtils.formatDate)
  DateTime date;
  @JsonKey(name: 'flexible_date')
  SmartCacheFlexibleDate flexibleDate;
  @JsonKey(name: 'fixed_date')
  SmartCacheFixedDate fixedDate;
  SmartCacheHopDateType type;

  SmartCacheHopDate({this.date, this.flexibleDate, this.fixedDate, this.type});

  factory SmartCacheHopDate.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHopDateFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHopDateToJson(this);
}

enum SmartCacheHopDateType {
  @JsonValue('DEPARTURE')
  departure,
  @JsonValue('ARRIVAL')
  arrival
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHopDuration {
  int max;
  int min;

  SmartCacheHopDuration({this.min, this.max});

  factory SmartCacheHopDuration.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHopDurationFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHopDurationToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheHopTime {
  @JsonKey(name: 'flexible_time')
  SmartCacheFlexibleTime flexibleTime;
  @JsonKey(toJson: JSONParserUtils.formatTime)
  DateTime time;
  SmartCacheHopTimeType type;

  SmartCacheHopTime({this.flexibleTime, this.time, this.type});

  factory SmartCacheHopTime.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheHopTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheHopTimeToJson(this);
}

enum SmartCacheHopTimeType {
  @JsonValue('DEPARTURE')
  departure,
  @JsonValue('ARRIVAL')
  arrival
}

enum SmartCacheHopType {
  @JsonValue('OUTBOUND')
  outbound,
  @JsonValue('INBOUND')
  inbound
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheJourneyDays {
  @JsonKey(name: 'flexible_journey_days')
  SmartCacheFlexibleJourneyDays flexibleJourneyDays;
  @JsonKey(name: 'journey_days')
  int journeyDays;

  SmartCacheJourneyDays({this.flexibleJourneyDays, this.journeyDays});

  factory SmartCacheJourneyDays.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheJourneyDaysFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheJourneyDaysToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheDistance {
  int max;
  int min;

  SmartCacheDistance({this.min, this.max});

  factory SmartCacheDistance.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheDistanceFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheDistanceToJson(this);
}

enum SmartCacheJourneyType {
  @JsonValue('ONEWAY')
  oneWay,
  @JsonValue('ROUNDTRIP')
  roundTrip
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheLocation {
  String id;
  SmartCacheLocationType type;
  String name;
  String code;
  @JsonKey(name: 'code_type')
  SmartCacheCodeType codeType;
  @JsonKey(name: 'coordinate')
  SmartCacheCoordinates coordinates;

  SmartCacheLocation(
      {this.id,
      this.type,
      this.name,
      this.code,
      this.codeType,
      this.coordinates});

  factory SmartCacheLocation.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheLocationFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheLocationToJson(this);
}

enum SmartCacheLocationType {
  @JsonValue('AIRPORT')
  airport,
  @JsonValue('TRAINSTATION')
  trainStation,
  @JsonValue('FURRY')
  fairy,
  @JsonValue('UNKNOWN')
  unknown
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheFixedLocation {
  String code;
  @JsonKey(name: 'code_type')
  SmartCacheCodeType codeTypes;
  @JsonKey(required: true)
  SmartCacheFixedLocationType type;
  @JsonKey(name: 'customer_locations', nullable: true)
  Iterable<SmartCacheFixedLocation> customerLocations;

  SmartCacheFixedLocation(
      {@required this.type, this.code, this.codeTypes, this.customerLocations});

  factory SmartCacheFixedLocation.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheFixedLocationFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheFixedLocationToJson(this);
}

enum SmartCacheFixedLocationType {
  @JsonValue('AIRPORT')
  airport,
  @JsonValue('CITY')
  city,
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCity {
  String id;
  String name;
  String code;
  @JsonKey(name: 'code_type')
  SmartCacheCodeType codeType;
  @JsonKey(name: 'coordinate')
  SmartCacheCoordinates coordinates;
  @JsonKey(name: 'avatar')
  String thumbnail;
  SmartCacheRequestDestinationType type;
  @JsonKey(name: 'customer_locations', nullable: true)
  Iterable<SmartCacheLocation> customerLocations;

  SmartCacheCity(
      {this.id,
      this.name,
      this.code,
      this.codeType,
      this.coordinates,
      this.thumbnail,
      this.type,
      this.customerLocations});

  factory SmartCacheCity.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCityFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCityToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCountrySubdivision {
  String id;
  String name;
  String code;
  @JsonKey(name: 'code_type')
  SmartCacheCodeType codeType;
  String avatar;

  SmartCacheCountrySubdivision(
      {this.id, this.name, this.code, this.codeType, this.avatar});

  factory SmartCacheCountrySubdivision.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCountrySubdivisionFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCountrySubdivisionToJson(this);
}

enum SmartCacheCodeType {
  @JsonValue('IATA')
  iata,
  @JsonValue('ISO3316')
  iso3316,
  @JsonValue('IPv4')
  ipv4,
  @JsonValue('IPv6')
  ipv6,
  @JsonValue('MowgliCategory')
  mowgli,
  @JsonValue('CustomCategory')
  custom
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheOffer {
  List<SmartCacheHop> hops;
  String id;
  @JsonKey(name: 'service_bundles')
  List<SmartCacheServiceBundle> serviceBundles;
  @JsonKey(name: 'total_amount')
  SmartCacheAmount totalAmount;
  @JsonKey(name: 'total_tax')
  SmartCacheAmount totalTax;
  List<SmartCacheTraveler> travelers;
  @JsonKey(name: 'viewed_at', fromJson: JSONParserUtils.parseDateTime)
  DateTime viewedAt;
  @JsonKey(name: 'mowgli_tips', nullable: true)
  SmartCacheMowgliTips tips;

  SmartCacheOffer(
      {this.hops,
      this.id,
      this.serviceBundles,
      this.totalAmount,
      this.totalTax,
      this.travelers,
      this.viewedAt});

  SmartCacheHop findInboundHop() {
    return hops.firstWhere(
        (SmartCacheHop hop) => hop.type == SmartCacheHopType.inbound,
        orElse: () => null);
  }

  SmartCacheHop findOutboundHop() {
    return hops.firstWhere(
        (SmartCacheHop hop) => hop.type == SmartCacheHopType.outbound,
        orElse: () => null);
  }

  factory SmartCacheOffer.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheOfferFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheOfferToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheRequestOrigin {
  String code;
  @JsonKey(name: 'code_type')
  SmartCacheCodeType codeTypes;
  @JsonKey(required: true)
  SmartCacheRequestOriginType type;
  @JsonKey(name: 'customer_locations', nullable: true)
  Iterable<SmartCacheRequestOrigin> customerLocations;

  SmartCacheRequestOrigin(
      {@required this.type, this.code, this.codeTypes, this.customerLocations});

  factory SmartCacheRequestOrigin.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheRequestOriginFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheRequestOriginToJson(this);
}

enum SmartCacheRequestOriginType {
  @JsonValue('AIRPORT')
  airport,
  @JsonValue('CITY')
  city,
  @JsonValue('IP')
  ip
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheRequestDestination {
  List<String> codes;
  @JsonKey(name: 'code_type')
  SmartCacheCodeType codeTypes;
  @JsonKey(required: true)
  SmartCacheRequestDestinationType type;

  SmartCacheRequestDestination(
      {@required this.type, this.codes, this.codeTypes});

  factory SmartCacheRequestDestination.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheRequestDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheRequestDestinationToJson(this);
}

enum SmartCacheRequestDestinationType {
  @JsonValue('AIRPORT')
  airport,
  @JsonValue('CITY')
  city,
  @JsonValue('COUNTRY')
  country,
  @JsonValue('CONTINENT')
  continent,
  @JsonValue('CATEGORY')
  category,
  @JsonValue('OPEN')
  open
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheService {
  Map<String, Object> attributes;
  String description;
  String id;
  @JsonKey(name: 'marketing_name')
  String marketingName;
  String name;
  SmartCacheServiceType type;

  SmartCacheService(
      {this.attributes,
      this.description,
      this.id,
      this.marketingName,
      this.name,
      this.type});

  factory SmartCacheService.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheServiceFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheServiceToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheServiceBundle {
  String id;
  List<SmartCacheService> services;
  @JsonKey(name: 'transport_service_id')
  String transportServiceId;
  @JsonKey(name: 'traveler_ids')
  List<String> travelerIds;

  SmartCacheServiceBundle(
      {this.id, this.services, this.transportServiceId, this.travelerIds});

  factory SmartCacheServiceBundle.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheServiceBundleFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheServiceBundleToJson(this);
}

enum SmartCacheServiceType {
  @JsonValue('CABINCLASS')
  cabinBlass,
  @JsonValue('BAGGAGE')
  baggage,
  @JsonValue('OTHER')
  other
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheTransportService {
  @JsonKey(name: 'arrival_date')
  String arrivalDate;
  @JsonKey(name: 'arrival_time')
  String arrivalTime;
  @JsonKey(name: 'departure_date')
  String departureDate;
  @JsonKey(name: 'departure_time')
  String departureTime;
  SmartCacheLocation destination;
  int duration;
  String equipment;
  @JsonKey(name: 'equipment_name')
  String equipmentName;
  String id;
  @JsonKey(name: 'marketing_carrier')
  SmartCacheCarrier marketingCarrier;
  @JsonKey(name: 'marketing_designator')
  String marketingDesignator;
  @JsonKey(name: 'operating_carrier')
  SmartCacheCarrier operatingCarrier;
  @JsonKey(name: 'operating_designator')
  String operatingDesignator;
  SmartCacheLocation origin;
  @JsonKey(name: 'stopover_duration')
  int stopoverDuration;
  SmartCacheTransportServiceType type;

  SmartCacheTransportService(
      {this.arrivalDate,
      this.arrivalTime,
      this.departureDate,
      this.departureTime,
      this.destination,
      this.duration,
      this.equipment,
      this.equipmentName,
      this.id,
      this.marketingCarrier,
      this.marketingDesignator,
      this.operatingCarrier,
      this.operatingDesignator,
      this.origin,
      this.stopoverDuration,
      this.type});

  factory SmartCacheTransportService.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheTransportServiceFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheTransportServiceToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCarrier {
  String name;
  String code;
  @JsonKey(name: 'avatar')
  String logo;

  SmartCacheCarrier({this.name, this.code, this.logo});

  factory SmartCacheCarrier.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCarrierFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCarrierToJson(this);
}

enum SmartCacheTransportServiceType {
  @JsonValue('FLIGHT')
  flight,
  @JsonValue('TRAIN')
  train
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheTraveler {
  String id;
  @JsonKey(name: 'service_bundle_ids')
  List<String> serviceBundleIds;
  SmartCacheTravelerType type;

  SmartCacheTraveler({this.id, this.serviceBundleIds, this.type});

  factory SmartCacheTraveler.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheTravelerFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheTravelerToJson(this);
}

enum SmartCacheTravelerType {
  @JsonValue('ADULT')
  adult,
  @JsonValue('CHILD')
  child,
  @JsonValue('INFANT')
  infant
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheMowgliTips {
  @JsonKey(name: 'is_average_price')
  SmartCacheMowgliTipAveragePrice averagePrice;
  @JsonKey(name: 'is_lowest_price')
  SmartCacheMowgliTipLowestPrice lowestPrice;

  SmartCacheMowgliTips({this.averagePrice, this.lowestPrice});

  factory SmartCacheMowgliTips.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheMowgliTipsFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheMowgliTipsToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheMowgliTipLowestPrice {
  String title;
  String description;
  SmartCacheMowgliTipLowestPriceType type;

  SmartCacheMowgliTipLowestPrice({this.title, this.description, this.type});

  factory SmartCacheMowgliTipLowestPrice.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheMowgliTipLowestPriceFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheMowgliTipLowestPriceToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheMowgliTipAveragePrice {
  String title;
  String description;
  SmartCacheMowgliTipAveragePriceType type;

  SmartCacheMowgliTipAveragePrice({this.title, this.description, this.type});

  factory SmartCacheMowgliTipAveragePrice.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheMowgliTipAveragePriceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SmartCacheMowgliTipAveragePriceToJson(this);
}

enum SmartCacheMowgliTipLowestPriceType {
  @JsonValue('LOWESTPRICE')
  lowestPrice,
  @JsonValue('NONLOWESTPRICE')
  nonLowestPrice
}

enum SmartCacheMowgliTipAveragePriceType {
  @JsonValue('AVERAGEPRICE')
  average,
  @JsonValue('EXPENSIVE')
  expensive,
  @JsonValue('SUPERDEAL')
  superDeal
}
