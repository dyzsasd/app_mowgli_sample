import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_homepage_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/object_utils.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';
import 'package:mowgli/utils/collections/list_utils.dart';
import 'package:mowgli/utils/date_utils.dart';

class HomePageContent {
  final HomePageLocation location;
  final HomePageContentType type;
  final Iterable<HomePageSection> sections;
  final Iterable<HomePageDateRecommendation> dateRecommendations;

  HomePageContent.fromNetwork(SmartCacheHomePageResponse response)
      : location = HomePageLocation._fromNetwork(response.origin),
        type = HomePageContentType.city,
        sections = ListUtils.toListFromObject(
            response.sections,
            (SmartCacheHomePageSection section) =>
                HomePageSection._fromNetwork(section))?.where(
            (HomePageSection section) =>
                IterableUtils.isNotEmpty(section.offers)),
        dateRecommendations = ListUtils.toListFromObject(
            response.filters,
            (SmartCacheHomePageDateRecommendation dateRecommendation) =>
                HomePageDateRecommendation._fromNetwork(dateRecommendation));
}

enum HomePageContentType { city, airport, type }

class HomePageSection {
  final String label;
  final HomePageSectionType type;
  final Iterable<HomePageOffer> offers;
  final Request request;
  final String nextRequestKey;

  HomePageSection._fromNetwork(SmartCacheHomePageSection section)
      : label = section.name,
        type = section.type == SmartCacheHomePageSectionType.recommendation
            ? HomePageSectionType.row
            : HomePageSectionType.list,
        offers = ListUtils.toListFromObject(section.offers,
            (SmartCacheOffer offer) => HomePageOffer._fromNetwork(offer)),
        request = RequestUtils.fromBestDealRequest(section.request),
        nextRequestKey = section.nextRequestKey;

  SectionListData toSectionListData() => SectionListData(
      offers:
          offers.map((HomePageOffer offer) => offer.toDestinationData(request)),
      request: request,
      nextRequestToken: nextRequestKey);
}

class HomePageDateRecommendation {
  final String label;
  final HomePageSectionType type;
  final Iterable<HomePageOffer> offers;
  final Request request;
  final String nextRequestKey;
  final String thumbnail;

  HomePageDateRecommendation._fromNetwork(
      SmartCacheHomePageDateRecommendation dateRecommendation)
      : label = dateRecommendation.name,
        type = HomePageSectionType.row,
        offers = ListUtils.toListFromObject(dateRecommendation.offers,
            (SmartCacheOffer offer) => HomePageOffer._fromNetwork(offer)),
        request = RequestUtils.fromBestDealRequest(dateRecommendation.request),
        nextRequestKey = dateRecommendation.nextRequestKey,
        thumbnail = dateRecommendation.thumbnail;

  SectionListData toSectionListData() => SectionListData(
      offers: offers?.map(
        (HomePageOffer offer) => offer.toDestinationData(request),
      ),
      request: request,
      nextRequestToken: nextRequestKey);
}

enum HomePageSectionType { row, list }

class HomePageOffer {
  final String id;
  final DateTime date;
  final Iterable<HomePageOfferHop> hops;
  final num price;
  final String currency;

  final String thumbnail;
  final HomePageLocation _destinationCity;

  HomePageOffer._fromNetwork(SmartCacheOffer offer)
      : id = offer.id,
        _destinationCity = HomePageLocation._fromNetwork(
            offer.findInboundHop()?.originCity ??
                offer.findOutboundHop()?.destinationCity),
        date = offer.viewedAt,
        hops = ListUtils.toListFromObject(offer.hops,
            (SmartCacheHop hop) => HomePageOfferHop._fromNetwork(hop)),
        price = offer.totalAmount.value,
        currency = '€',
        thumbnail = ObjectUtils.extract(
            offer.findOutboundHop(),
            (SmartCacheHop outboundHop) =>
                outboundHop.destinationCity.thumbnail);

  String get name => _destinationCity?.label;

  HomePageOfferHop get inboundHop => hops.firstWhere(
      (HomePageOfferHop hop) => hop.type == HomePageOfferHopType.inbound,
      orElse: () => null);

  HomePageOfferHop get outboundHop => hops.firstWhere(
      (HomePageOfferHop hop) => hop.type == HomePageOfferHopType.outbound,
      orElse: () => null);

  ListItemDestinationData toDestinationData(
          Request request) =>
      ListItemDestinationData(
          id: id,
          date: date,
          destinationCityName: _destinationCity.label,
          destinationCityCode: _destinationCity.code,
          destinationCountry: '?',
          thumbnail: thumbnail,
          price: price,
          currency: currency,
          inBoundHop: ObjectUtils.extract(inboundHop,
              (HomePageOfferHop hop) => hop._toListItemDestinationHop()),
          outBoundHop: ObjectUtils.extract(outboundHop,
              (HomePageOfferHop hop) => hop._toListItemDestinationHop()),
          request: request);
}

class HomePageOfferHop {
  final HomePageLocation departureCity;
  final String departureAirportCode;
  final DateTime departureDate;
  final HomePageLocation arrivalCity;
  final String arrivalAirportCode;
  final DateTime arrivalDate;
  final HomePageOfferHopType type;
  final String mainCarrierName;
  final String mainCarrierThumbnailUrl;
  final bool hasMultipleCompanies;
  final int stopOvers;

  HomePageOfferHop._fromNetwork(SmartCacheHop hop)
      : departureCity = HomePageLocation._fromNetwork(hop.originCity),
        departureAirportCode = hop.departureAirportCode,
        departureDate =
            DateUtils.mergeFromText(hop.departureDate, hop.departureTime),
        arrivalCity = HomePageLocation._fromNetwork(hop.destinationCity),
        arrivalAirportCode = hop.arrivalAirportCode,
        arrivalDate = DateUtils.mergeFromText(hop.arrivalDate, hop.arrivalTime),
        stopOvers = ((hop.transportServices?.length ?? 0) - 1) ?? 0,
        mainCarrierName = ObjectUtils.extract(hop.transportServices,
            (List<SmartCacheTransportService> companies) {
          return companies.first.marketingCarrier.name;
        }),
        mainCarrierThumbnailUrl = hop.airlineLogo,
        hasMultipleCompanies = ObjectUtils.extract(hop.transportServices,
            (List<SmartCacheTransportService> companies) {
          if (companies == null || companies.length <= 1) {
            return false;
          }

          String company = companies.first.marketingDesignator;

          for (SmartCacheTransportService service in companies) {
            if (service.marketingDesignator != company) {
              return true;
            }
          }

          return false;
        }),
        type = hop.type == SmartCacheHopType.inbound
            ? HomePageOfferHopType.inbound
            : HomePageOfferHopType.outbound;

  ListItemDestinationHopData _toListItemDestinationHop() {
    if (type == HomePageOfferHopType.inbound) {
      return ListItemDestinationHopData.inbound(
          departureCityName: departureCity.label,
          departureCityCode: departureCity.code,
          departureAirportCode: departureAirportCode,
          departureDate: departureDate,
          arrivalCityName: arrivalCity.label,
          arrivalCityCode: arrivalCity.code,
          arrivalAirportCode: arrivalAirportCode,
          arrivalDate: arrivalDate,
          companyName: mainCarrierName,
          companyPictureUrl: mainCarrierThumbnailUrl,
          hasMultipleCompanies: hasMultipleCompanies,
          stopOvers: stopOvers);
    } else {
      return ListItemDestinationHopData.outbound(
          departureCityName: departureCity.label,
          departureCityCode: departureCity.code,
          departureAirportCode: departureAirportCode,
          departureDate: departureDate,
          arrivalCityName: arrivalCity.label,
          arrivalCityCode: arrivalCity.code,
          arrivalAirportCode: arrivalAirportCode,
          arrivalDate: arrivalDate,
          companyName: mainCarrierName,
          companyPictureUrl: mainCarrierThumbnailUrl,
          hasMultipleCompanies: hasMultipleCompanies,
          stopOvers: stopOvers);
    }
  }
}

enum HomePageOfferHopType { inbound, outbound }

class HomePageLocation {
  final String code;
  final String label;
  final HomePageLocationType type;
  final Iterable<HomePageLocation> airports;

  HomePageLocation.city({this.code, this.label, this.airports})
      : type = HomePageLocationType.city;

  HomePageLocation.airport({this.code, this.label, this.airports})
      : type = HomePageLocationType.airport;

  factory HomePageLocation._fromNetwork(SmartCacheCity city) {
    return HomePageLocation.city(
        code: city.code,
        label: city.name,
        airports: city.customerLocations?.map((SmartCacheLocation airport) =>
            HomePageLocation._fromAirports(airport)));
  }

  factory HomePageLocation._fromAirports(SmartCacheLocation airport) {
    return HomePageLocation.airport(code: airport.code, label: airport.name);
  }

  Location toLocation() => Location(
      code: code,
      label: label,
      type: ObjectUtils.extract(type, (HomePageLocationType type) {
        switch (type) {
          case HomePageLocationType.airport:
            return LocationType.airport;
          case HomePageLocationType.city:
            return LocationType.city;
          default:
            return null;
        }
      }),
      airports:
          airports?.map((HomePageLocation airport) => airport.toLocation()));
}

enum HomePageLocationType { airport, city }
