import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_destination_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/response/smartcache_offer_detail_response.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/object_utils.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';
import 'package:mowgli/utils/collections/list_utils.dart';
import 'package:mowgli/utils/date_utils.dart';

class DealDetailsContent {
  final DealDetailsOffer mainOffer;
  final Iterable<DealDetailsSection> sections;
  final Request request;

  DealDetailsContent.fromOfferDetailNetworkResponse(
      SmartCacheOfferDetailResponse response, this.request)
      : mainOffer = DealDetailsOffer._fromNetwork(response.offer),
        sections = ListUtils.toListFromObject(
            response.sections,
            (SmartCacheRecommendationSection section) =>
                DealDetailsSection._fromNetwork(section))?.where(
            (DealDetailsSection section) =>
                IterableUtils.isNotEmpty(section.offers));

  DealDetailsContent.fromDestinationNetworkResponse(
      SmartCacheDestinationResponse response, this.request)
      : mainOffer = ObjectUtils.extract(response.offer,
            (SmartCacheOffer offer) => DealDetailsOffer._fromNetwork(offer)),
        sections = ListUtils.toListFromObject(
            response.sections,
            (SmartCacheRecommendationSection section) =>
                DealDetailsSection._fromNetwork(section))?.where(
            (DealDetailsSection section) =>
                IterableUtils.isNotEmpty(section.offers));
}

enum DealDetailsContentType { city, airport, type }

class DealDetailsSection {
  final String label;
  final DealDetailsSectionType type;
  final Iterable<DealDetailsOffer> offers;
  final SmartCacheBestDealRequest request;

  DealDetailsSection._fromNetwork(SmartCacheRecommendationSection section)
      : label = section.name,
        type =
            section.type == SmartCacheRecommendationSectionType.recommendation
                ? DealDetailsSectionType.row
                : DealDetailsSectionType.list,
        offers = ListUtils.toListFromObject(section.offers,
            (SmartCacheOffer offer) => DealDetailsOffer._fromNetwork(offer)),
        request = section.request;
}

enum DealDetailsSectionType { row, list }

class DealDetailsOffer {
  final String id;
  final DateTime date;
  final Iterable<DealDetailsOfferHop> hops;
  final num price;
  final String currency;
  final DealDetailsOfferTips tips;
  final String thumbnail;
  final DealDetailsLocation _destinationCity;

  DealDetailsOffer._fromNetwork(SmartCacheOffer offer)
      : id = offer.id,
        _destinationCity = DealDetailsLocation._fromNetworkCity(
            offer.findOutboundHop()?.destinationCity),
        date = offer.viewedAt,
        hops = ListUtils.toListFromObject(offer.hops,
            (SmartCacheHop hop) => DealDetailsOfferHop._fromNetwork(hop)),
        price = offer.totalAmount.value,
        currency = offer.totalAmount.currency,
        thumbnail = offer.findOutboundHop()?.destinationCity?.thumbnail,
        tips = DealDetailsOfferTips._fromNetwork(offer.tips);

  String get name => _destinationCity?.label;

  DealDetailsOfferHop get inboundHop => hops.firstWhere(
      (DealDetailsOfferHop hop) => hop.type == DealDetailsOfferHopType.inbound,
      orElse: () => null);

  DealDetailsOfferHop get outboundHop => hops.firstWhere(
      (DealDetailsOfferHop hop) => hop.type == DealDetailsOfferHopType.outbound,
      orElse: () => null);

  String get originName =>
      outboundHop?.departureCity?.label ?? outboundHop?.departureCity?.code;

  String get destinationName =>
      outboundHop?.arrivalCity?.label ?? outboundHop?.arrivalCity?.code;

  DateTime get fromDate => outboundHop?.departureDate;

  DateTime get toDate => inboundHop?.departureDate;
}

class DealDetailsOfferTips {
  final DealDetailsOfferTipAveragePrice averagePrice;
  final DealDetailsOfferTipLowestPrice lowestPrice;

  DealDetailsOfferTips._fromNetwork(SmartCacheMowgliTips tips)
      : averagePrice =
            DealDetailsOfferTipAveragePrice._fromNetwork(tips.averagePrice),
        lowestPrice =
            DealDetailsOfferTipLowestPrice._fromNetwork(tips.lowestPrice);

  bool get hasAveragePriceTip => averagePrice != null;

  bool get hasLowestPriceTip => lowestPrice != null;

  bool get hasTips => averagePrice != null && lowestPrice != null;
}

abstract class DealDetailsOfferTip {
  final String title;
  final String description;

  DealDetailsOfferTip({this.title, this.description});
}

class DealDetailsOfferTipAveragePrice extends DealDetailsOfferTip {
  final DealDetailsOfferTipAveragePriceType type;

  DealDetailsOfferTipAveragePrice._fromNetwork(
      SmartCacheMowgliTipAveragePrice tip)
      : type = ObjectUtils.extract<SmartCacheMowgliTipAveragePriceType,
                DealDetailsOfferTipAveragePriceType>(tip.type,
            (SmartCacheMowgliTipAveragePriceType type) {
          switch (type) {
            case SmartCacheMowgliTipAveragePriceType.average:
              return DealDetailsOfferTipAveragePriceType.average;
            case SmartCacheMowgliTipAveragePriceType.expensive:
              return DealDetailsOfferTipAveragePriceType.expensive;
            case SmartCacheMowgliTipAveragePriceType.superDeal:
              return DealDetailsOfferTipAveragePriceType.superDeal;
          }

          return null;
        }),
        super(title: tip.title, description: tip.description);
}

enum DealDetailsOfferTipAveragePriceType { average, expensive, superDeal }

class DealDetailsOfferTipLowestPrice extends DealDetailsOfferTip {
  final DealDetailsOfferTipLowestPriceType type;

  DealDetailsOfferTipLowestPrice._fromNetwork(
      SmartCacheMowgliTipLowestPrice tip)
      : type = ObjectUtils.extract<SmartCacheMowgliTipLowestPriceType,
                DealDetailsOfferTipLowestPriceType>(tip.type,
            (SmartCacheMowgliTipLowestPriceType type) {
          switch (type) {
            case SmartCacheMowgliTipLowestPriceType.lowestPrice:
              return DealDetailsOfferTipLowestPriceType.lowestPrice;
            case SmartCacheMowgliTipLowestPriceType.nonLowestPrice:
              return DealDetailsOfferTipLowestPriceType.nonLowestPrice;
          }

          return null;
        }),
        super(title: tip.title, description: tip.description);
}

enum DealDetailsOfferTipLowestPriceType { lowestPrice, nonLowestPrice }

class DealDetailsOfferHop {
  final DealDetailsLocation departureCity;
  final String departureAirportCode;
  final DateTime departureDate;
  final DealDetailsLocation arrivalCity;
  final String arrivalAirportCode;
  final DateTime arrivalDate;
  final DealDetailsOfferHopType type;
  final String airlineLogo;
  final String mainMarketingCarrierName;
  final String mainMarketingCarrierThumbnailUrl;
  final String mainOperatingCarrierName;
  final String mainOperatingCarrierThumbnailUrl;
  final bool hasMultipleCompanies;
  final Iterable<DealDetailsStopOver> stopOvers;
  final num duration;

  DealDetailsOfferHop._fromNetwork(SmartCacheHop hop)
      : departureCity = DealDetailsLocation._fromNetworkCity(hop.originCity),
        departureAirportCode = hop.departureAirportCode,
        departureDate =
            DateUtils.mergeFromText(hop.departureDate, hop.departureTime),
        arrivalCity = DealDetailsLocation._fromNetworkCity(hop.destinationCity),
        arrivalAirportCode = hop.arrivalAirportCode,
        arrivalDate = DateUtils.mergeFromText(hop.arrivalDate, hop.arrivalTime),
        airlineLogo = hop.airlineLogo,
        mainMarketingCarrierName = ObjectUtils.extract(hop.transportServices,
            (List<SmartCacheTransportService> companies) {
          return companies.first.marketingCarrier.name;
        }),
        mainMarketingCarrierThumbnailUrl = hop.airlineLogo,
        mainOperatingCarrierName = ObjectUtils.extract(hop.transportServices,
            (List<SmartCacheTransportService> companies) {
          return companies.first.operatingCarrier.name;
        }),
        mainOperatingCarrierThumbnailUrl =
            hop.airlineLogo, // todo: Add operating carrier logo
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
            ? DealDetailsOfferHopType.inbound
            : DealDetailsOfferHopType.outbound,
        stopOvers = ListUtils.toListFromObject(
            hop.transportServices,
            (SmartCacheTransportService service) =>
                DealDetailsStopOver._fromNetwork(service))
          ..removeWhere(
              (DealDetailsStopOver stopOver) => stopOver.stopoverDuration < 0),
        duration = hop.duration;

  int get _stopOversQuantity => stopOvers?.length ?? 0;

  ListItemDestinationHopData toListItemDestinationHop() {
    if (type == DealDetailsOfferHopType.inbound) {
      return ListItemDestinationHopData.inbound(
          departureCityName: departureCity.label,
          departureCityCode: departureCity.code,
          departureAirportCode: departureAirportCode,
          departureDate: departureDate,
          arrivalCityName: arrivalCity.label,
          arrivalCityCode: arrivalCity.code,
          arrivalAirportCode: arrivalAirportCode,
          arrivalDate: arrivalDate,
          companyName: mainMarketingCarrierName,
          companyPictureUrl: mainMarketingCarrierThumbnailUrl,
          hasMultipleCompanies: hasMultipleCompanies,
          stopOvers: _stopOversQuantity);
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
          companyName: mainMarketingCarrierName,
          companyPictureUrl: mainMarketingCarrierThumbnailUrl,
          hasMultipleCompanies: hasMultipleCompanies,
          stopOvers: _stopOversQuantity);
    }
  }
}

enum DealDetailsOfferHopType { inbound, outbound }

class DealDetailsStopOver {
  final DealDetailsLocation departureCity;
  final DateTime departureDate;
  final DealDetailsLocation arrivalCity;
  final DateTime arrivalDate;
  final String carrierName;
  final int stopoverDuration;

  DealDetailsStopOver._fromNetwork(SmartCacheTransportService stopOver)
      : departureDate = DateUtils.mergeFromText(
            stopOver.departureDate, stopOver.departureTime),
        arrivalDate =
            DateUtils.mergeFromText(stopOver.arrivalDate, stopOver.arrivalTime),
        stopoverDuration = stopOver.stopoverDuration,
        departureCity =
            DealDetailsLocation._fromNetworkLocation(stopOver.origin),
        arrivalCity =
            DealDetailsLocation._fromNetworkLocation(stopOver.destination),
        carrierName = stopOver.marketingCarrier?.name;
}

class DealDetailsLocation {
  final String code;
  final String label;
  final DealDetailsLocationType type;

  DealDetailsLocation.city({this.code, this.label})
      : type = DealDetailsLocationType.city;

  DealDetailsLocation.airport({this.code, this.label})
      : type = DealDetailsLocationType.airport;

  factory DealDetailsLocation._fromNetworkCity(SmartCacheCity city) {
    switch (city.type ?? SmartCacheRequestDestinationType.city) {
      case SmartCacheRequestDestinationType.airport:
        return DealDetailsLocation.airport(
          code: city.code,
          label: city.name,
        );
      case SmartCacheRequestDestinationType.city:
        return DealDetailsLocation.city(
          code: city.code,
          label: city.name,
        );
      default:
        throw Exception('City type ${city.type} not supported!');
    }
  }

  factory DealDetailsLocation._fromNetworkLocation(
      SmartCacheLocation location) {
    if (location.codeType == SmartCacheCodeType.iata) {
      return DealDetailsLocation.airport(
        code: location.code,
        label: location.name,
      );
    } else {
      return DealDetailsLocation.city(
        code: location.code,
        label: location.name,
      );
    }
  }
}

enum DealDetailsLocationType { airport, city }
