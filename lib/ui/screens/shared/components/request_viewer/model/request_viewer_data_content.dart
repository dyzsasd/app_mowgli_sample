import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_best_deal_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/object_utils.dart';
import 'package:mowgli/utils/collections/list_utils.dart';
import 'package:mowgli/utils/date_utils.dart';

class RequestDetailsContent {
  final SectionListData sectionData;
  final Request request;

  Filters get filters => request?.filters ?? Filters.empty();

  RequestDetailsContent(this.sectionData, this.request);

  RequestDetailsContent.fromNetwork(
      SmartCacheBestDealResponse response, this.request)
      : sectionData = SectionListData(
            offers: ListUtils.toListFromObject(
              response.offers,
              (SmartCacheOffer offer) =>
                  SectionOffer.fromNetwork(offer, request).toDestinationData(),
            ),
            request: request,
            nextRequestToken: response.nextRequestKey);
}

class SectionOffer {
  final String id;
  final DateTime date;
  final DestinationOfferHop outboundHop;
  final DestinationOfferHop inboundHop;
  final num price;
  final String currency;

  final String thumbnail;
  final DestinationLocation _destinationCity;
  final Request request;

  SectionOffer.fromNetwork(SmartCacheOffer offer, this.request)
      : id = offer.id,
        _destinationCity = DestinationLocation._fromNetwork(
            offer.findOutboundHop()?.destinationCity),
        date = offer.viewedAt,
        outboundHop = ObjectUtils.extract(offer.findOutboundHop(),
            (SmartCacheHop hop) => DestinationOfferHop._fromNetwork(hop)),
        inboundHop = ObjectUtils.extract(offer.findInboundHop(),
            (SmartCacheHop hop) => DestinationOfferHop._fromNetwork(hop)),
        price = offer.totalAmount.value,
        currency = '€',
        thumbnail = offer.findOutboundHop()?.destinationCity?.thumbnail;

  String get name => _destinationCity?.label;

  ListItemDestinationData toDestinationData() => ListItemDestinationData(
      id: id,
      date: date,
      destinationCityName: _destinationCity.label,
      destinationCityCode: _destinationCity.code,
      destinationCountry: '?',
      thumbnail: thumbnail,
      price: price,
      currency: currency,
      inBoundHop: ObjectUtils.extract(inboundHop,
          (DestinationOfferHop hop) => hop._toListItemDestinationHop()),
      outBoundHop: ObjectUtils.extract(outboundHop,
          (DestinationOfferHop hop) => hop._toListItemDestinationHop()),
      request: request);
}

class DestinationOfferHop {
  final DestinationLocation departureCity;
  final String departureAirportCode;
  final DateTime departureDate;
  final DestinationLocation arrivalCity;
  final String arrivalAirportCode;
  final DateTime arrivalDate;
  final DestinationOfferHopType type;
  final String mainCarrierName;
  final String mainCarrierThumbnailUrl;
  final bool hasMultipleCompanies;
  final int stopOvers;

  DestinationOfferHop._fromNetwork(SmartCacheHop hop)
      : departureCity = DestinationLocation._fromNetwork(hop.originCity),
        departureAirportCode = hop.departureAirportCode,
        departureDate =
            DateUtils.mergeFromText(hop.departureDate, hop.departureTime),
        arrivalCity = DestinationLocation._fromNetwork(hop.destinationCity),
        arrivalAirportCode = hop.arrivalAirportCode,
        arrivalDate = DateUtils.mergeFromText(hop.arrivalDate, hop.arrivalTime),
        stopOvers = (hop.transportServices?.length ?? 1) - 1,
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
            ? DestinationOfferHopType.inbound
            : DestinationOfferHopType.outbound;

  ListItemDestinationHopData _toListItemDestinationHop() {
    if (type == DestinationOfferHopType.inbound) {
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

enum DestinationOfferHopType { inbound, outbound }

class DestinationLocation {
  final String code;
  final String label;
  final DestinationLocationType type;

  DestinationLocation.city({this.code, this.label})
      : type = DestinationLocationType.city;

  DestinationLocation.airport({this.code, this.label})
      : type = DestinationLocationType.airport;

  factory DestinationLocation._fromNetwork(SmartCacheCity city) {
    switch (city.type ?? SmartCacheRequestDestinationType.city) {
      case SmartCacheRequestDestinationType.airport:
        return DestinationLocation.airport(
          code: city.code,
          label: city.name,
        );
      case SmartCacheRequestDestinationType.city:
        return DestinationLocation.city(
          code: city.code,
          label: city.name,
        );
      default:
        throw Exception('City type ${city.type} not supported!');
    }
  }
}

enum DestinationLocationType { airport, city }
