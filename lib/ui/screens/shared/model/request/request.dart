import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_calendar_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_destination_request.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_date.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_destination.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_distance.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_journey_type.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_origin.dart';
import 'package:mowgli/ui/screens/shared/model/request/request_sort_order.dart';
import 'package:mowgli/utils/platform_utils.dart';

part 'request.freezed.dart';
part 'request.g.dart';

// TODO Add checkedBaggage, cabin & currency
@freezed
abstract class Request with _$Request {
  const Request._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Request({
    @required RequestOrigin origin,
    @required RequestDestination destination,
    @required @nullable RequestDate outboundDate,
    @required @nullable RequestDate inboundDate,
    @required Filters filters,
    @Default(RequestJourneyType.roundTrip) RequestJourneyType journeyType,
    @nullable int maxStopOvers,
    @nullable RequestDistance distance,
    @nullable int maxBudget,
    @nullable int maxResults,
    @nullable String nextRequestKey,
    @Default(RequestSortOrder.price) RequestSortOrder sortOrder,
  }) = _Request;

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Request.location({
    @required RequestOrigin origin,
    @required RequestDestination destination,
    @nullable RequestDate outboundDate,
    @nullable RequestDate inboundDate,
    @nullable Filters filters,
    @nullable RequestJourneyType journeyType,
    @nullable int maxStopOvers,
    @nullable RequestDistance distance,
    @nullable int maxBudget,
    @nullable int maxResults,
    @nullable String nextRequestKey,
    @Default(RequestSortOrder.price) RequestSortOrder sortOrder,
  }) = RequestLocation;

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  SmartCacheBestDealRequest createBestDealRequest(
      {int maxResults, String nextRequestKey}) {
    return SmartCacheBestDealRequest(
        origin: RequestOriginUtils.toBestDeal(origin),
        destination: RequestDestinationUtils.toBestDeal(destination),
        outboundDate: RequestDateUtils.toBestDeal(
            outboundDate, SmartCacheHopDateType.departure),
        outboundTime: null,
        inboundDate: RequestDateUtils.toBestDeal(
            inboundDate, SmartCacheHopDateType.departure),
        hopDuration: _createHopDuration(),
        distance: RequestDistanceUtils.toBestDeal(distance),
        inboundTime: null,
        locale: PlatformUtils.platformLanguage,
        journeyDays: _createJourneyDays(),
        type: RequestJourneyTypeUtils.toBestDeal(journeyType),
        orderBy: RequestSortOrderUtils.toBestDeal(sortOrder),
        budget: filters?.budget?.max?.toDouble(),
        maxStopOvers: maxStopOvers,
        continuationToken: nextRequestKey ?? this.nextRequestKey,
        size: maxResults ?? this.maxResults);
  }

  SmartCacheCalendarRequest createCalendarRequest(
      {DateTime minDate,
      int minFlightDurationOverride,
      int maxFlightDurationOverride}) {
    return SmartCacheCalendarRequest(
        origin: RequestOriginUtils.toBestDeal(origin),
        destination: RequestDestinationUtils.toBestDeal(destination),
        outboundDate: RequestDateUtils.toCalendar(
            outboundDate, minDate, SmartCacheHopDateType.departure),
        inboundDate: RequestDateUtils.toCalendar(
            inboundDate, null, SmartCacheHopDateType.departure),
        type: RequestJourneyTypeUtils.toBestDeal(journeyType),
        journeyDays: _createJourneyDays(
            minOverride: minFlightDurationOverride,
            maxOverride: maxFlightDurationOverride),
        maxStopOvers: maxStopOvers,
        hopDuration: _createHopDuration(),
        distance: RequestDistanceUtils.toBestDeal(distance),
        field: minDate == null
            ? SmartCacheCalendarField.outbound
            : SmartCacheCalendarField.inbound);
  }

  SmartCacheDestinationRequest createDestinationRequest({Filters override}) {
    DateTime outboundDateValue;
    DateTime inboundDateValue;

    if (override != null) {
      inboundDateValue = override.dates?.fixedDates?.fromDate;
      outboundDateValue = override.dates?.fixedDates?.toDate;
    }

    outboundDateValue ??= outboundDate?.date ?? DateTime.now();
    inboundDateValue ??=
        inboundDate?.date ?? DateTime.now().add(env.defaultDuration);

    return SmartCacheDestinationRequest(
        origin: RequestOriginUtils.toFixedLocation(origin),
        destination: RequestDestinationUtils.toFixedLocation(destination),
        outboundDate: outboundDateValue,
        inboundDate: inboundDateValue,
        type: RequestJourneyTypeUtils.toBestDeal(journeyType),
        maxStopOvers: maxStopOvers,
        distance: RequestDistanceUtils.toBestDeal(distance));
  }

  SmartCacheJourneyDays _createJourneyDays({int minOverride, int maxOverride}) {
    if (minOverride != null && maxOverride != null) {
      return SmartCacheJourneyDays(
        flexibleJourneyDays: SmartCacheFlexibleJourneyDays(
            min: minOverride,
            max: maxOverride == env.maxJourneyDays ? null : maxOverride),
      );
    } else if (filters?.dates?.flexibleDates != null) {
      return SmartCacheJourneyDays(
        flexibleJourneyDays: SmartCacheFlexibleJourneyDays(
            min: filters.dates.flexibleDates.minDuration,
            max: filters.dates.flexibleDates.maxDuration),
      );
    }

    return null;
  }

  SmartCacheHopDuration _createHopDuration({int minOverride, int maxOverride}) {
    if (filters?.flightDuration != null) {
      return SmartCacheHopDuration(
          min: (minOverride ?? filters.flightDuration.minTime) * 60,
          max: (maxOverride ?? filters.flightDuration.maxTime) * 60);
    }

    return null;
  }

  Request updateWithFiltersAllowingNullDates(Filters filters) {
    return copyWith(
        outboundDate: RequestDateUtils.outboundDateFromFilters(filters?.dates),
        inboundDate: RequestDateUtils.inboundDateFromFilters(filters?.dates),
        filters: filters,
        maxStopOvers: _getMaxStopOvers(filters),
        maxBudget: _getMaxBudget(filters),
        nextRequestKey: null);
  }

  Request updateWithFilters(Filters filters) {
    return copyWith(
        outboundDate: filters.dates != null
            ? RequestDateUtils.outboundDateFromFilters(filters.dates)
            : outboundDate,
        inboundDate: filters.dates != null
            ? RequestDateUtils.inboundDateFromFilters(filters.dates)
            : inboundDate,
        filters: filters,
        maxStopOvers: _getMaxStopOvers(filters),
        maxBudget: _getMaxBudget(filters),
        nextRequestKey: null);
  }

  Request updateWithDates(DateTime fromDate, DateTime toDate) {
    return copyWith(
        outboundDate: fromDate != null
            ? RequestDate(date: fromDate, flexibleFixedDates: false)
            : null,
        inboundDate: toDate != null
            ? RequestDate(date: toDate, flexibleFixedDates: false)
            : null);
  }

  Request completeLocationRequest() => copyWith(
      journeyType: RequestJourneyType.roundTrip,
      sortOrder: RequestSortOrder.price);

  int _getMaxStopOvers(Filters filters) {
    if (filters?.isEmpty == true) {
      return null;
    }

    return filters?.stopOvers?.maxStopOvers ?? maxStopOvers;
  }

  int _getMaxBudget(Filters filters) {
    return filters?.budget?.max ?? maxBudget;
  }
}

class RequestUtils {
  const RequestUtils._();

  static Request fromBestDealRequest(SmartCacheBestDealRequest request,
      [Filters filters]) {
    assert(request != null);
    return Request(
        origin: RequestOriginUtils.extractOrigin(request.origin),
        destination:
            RequestDestinationUtils.extractDestination(request.destination),
        outboundDate: RequestDateUtils.dateFromHopDateAndTime(
            request.outboundDate, request.outboundTime),
        inboundDate: RequestDateUtils.dateFromHopDateAndTime(
            request.inboundDate, request.inboundTime),
        maxStopOvers: request.maxStopOvers,
        distance: RequestDistanceUtils.extractDistance(request.distance),
        filters: FiltersUtils.createFilters(request, filters),
        maxBudget: request.budget?.toInt(),
        maxResults: request.size,
        nextRequestKey: request.continuationToken,
        sortOrder: RequestSortOrderUtils.extractSortOrder(request.orderBy),
        journeyType: RequestJourneyTypeUtils.extractJourneyType(request.type));
  }
}
