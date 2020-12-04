import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/analytics/analytics_interface.dart';
import 'package:mowgli/ui/screens/filters/bloc/impl/filters_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'filters_event.dart';

class FiltersBloc extends BaseBloc<_FiltersEvent, FiltersState> {
  final AnalyticsService _analyticsService;

  final Filters initialFilters;
  Filters _filters;

  FiltersBloc(Filters filters)
      : initialFilters = filters,
        _analyticsService = ApplicationServices.analytics,
        _filters = filters ?? const Filters.empty(),
        super(_initialState(filters));

  static FiltersState _initialState(Filters filters) {
    if (filters != null) {
      return FiltersState(currentFilters: filters, initialFilters: filters);
    } else {
      return FiltersState.empty(initialFilters: filters);
    }
  }

  void clearFilter() {
    dispatch(const _ClearFilterEvent());
  }

  void generateFilter() {
    dispatch(const _GenerateFilterEvent());
  }

  void updateDatesWith(DatesFilter dates) {
    dispatch(_UpdateDatesFilterEvent(dates));
  }

  void updateStopOversWith(StopOversFilter stopOvers) {
    dispatch(_UpdateStopOversFilterEvent(stopOvers));
  }

  void updateFlightDurationWith(FlightDurationFilter flightDuration) {
    dispatch(_UpdateFlightDurationFilterEvent(flightDuration));
  }

  void updateBudgetWith(BudgetFilter budget) {
    dispatch(_UpdateBudgetFilterEvent(budget));
  }

  @override
  Stream<FiltersState> mapEventToState(_FiltersEvent event) async* {
    if (event is _UpdateDatesFilterEvent) {
      _filters = _filters.copyWith(dates: event.dates);
      yield FiltersState(
          initialFilters: initialFilters, currentFilters: _filters);
    } else if (event is _UpdateStopOversFilterEvent) {
      _filters = _filters.copyWith(stopOvers: event.stopOvers);
      yield FiltersState(
          initialFilters: initialFilters, currentFilters: _filters);
    } else if (event is _UpdateFlightDurationFilterEvent) {
      _filters = _filters.copyWith(flightDuration: event.flightDuration);
      yield FiltersState(
          initialFilters: initialFilters, currentFilters: _filters);
    } else if (event is _UpdateBudgetFilterEvent) {
      _filters = _filters.copyWith(budget: event.budget);
      yield FiltersState(
          initialFilters: initialFilters, currentFilters: _filters);
    } else if (event is _GenerateFilterEvent) {
      yield FiltersState.ready(
          initialFilters: initialFilters, currentFilters: _filters);
    } else if (event is _ClearFilterEvent) {
      _filters = Filters.empty();
      yield FiltersState.empty(initialFilters: initialFilters);
    }
  }

  @override
  void onEvent(_FiltersEvent event) {
    super.onEvent(event);

    if (event is _UpdateDatesFilterEvent) {
      if (event.dates.flexibleDates != null) {
        _analyticsService.eventFiltersFlexibleDateChanged(
            event.dates.flexibleDates.fromDate,
            event.dates.flexibleDates.toDate);
      } else if (event.dates.fixedDates != null) {
        _analyticsService.eventFiltersFixedDateChanged(
            event.dates.fixedDates.fromDate, event.dates.fixedDates.toDate);
      }
    } else if (event is _UpdateStopOversFilterEvent) {
      _analyticsService.eventFiltersStopOversChanged(
          event.stopOvers.direct, event.stopOvers.one, event.stopOvers.many);
    } else if (event is _UpdateFlightDurationFilterEvent) {
      _analyticsService.eventFiltersFlightDurationChanged(
          event.flightDuration.minTime, event.flightDuration.maxTime);
    } else if (event is _UpdateBudgetFilterEvent) {
      _analyticsService.eventFiltersBudgetChanged(event.budget.max);
    }
  }
}
