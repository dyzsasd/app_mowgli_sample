import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters_budget.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters_dates.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters_flight_duration.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters_stopovers.dart';

export 'package:mowgli/ui/screens/shared/model/filters/filters_budget.dart';
export 'package:mowgli/ui/screens/shared/model/filters/filters_dates.dart';
export 'package:mowgli/ui/screens/shared/model/filters/filters_flight_duration.dart';
export 'package:mowgli/ui/screens/shared/model/filters/filters_stopovers.dart';

part 'filters.freezed.dart';
part 'filters.g.dart';

@freezed
abstract class Filters with _$Filters {
  const Filters._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory Filters(
      {DatesFilter dates,
      StopOversFilter stopOvers,
      FlightDurationFilter flightDuration,
      BudgetFilter budget}) = _Filters;

  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory Filters.empty(
      {@nullable DatesFilter dates,
      @nullable StopOversFilter stopOvers,
      @nullable FlightDurationFilter flightDuration,
      @nullable BudgetFilter budget}) = _EmptyFilters;

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);

  // Quantity of filters
  int get quantity {
    int qty = 0;

    if (dates != null) {
      qty++;
    }
    if (stopOvers != null) {
      qty++;
    }
    if (flightDuration != null) {
      qty++;
    }
    if (budget != null) {
      qty++;
    }

    return qty;
  }

  bool get isEmpty =>
      dates == null &&
      stopOvers == null &&
      flightDuration == null &&
      budget == null;
}

class FiltersUtils {
  const FiltersUtils._();

  static Filters createFilters(
      SmartCacheBestDealRequest request, Filters filters) {
    return Filters(
        dates: DatesFilterUtils.extractDatesFilter(request),
        stopOvers: StopOversFilterUtils.extractStopOvers(request),
        flightDuration:
            FlightDurationFilterUtils.extractFlightDuration(request),
        budget: BudgetFilterUtils.extractBudgetFilter(request));
  }
}
