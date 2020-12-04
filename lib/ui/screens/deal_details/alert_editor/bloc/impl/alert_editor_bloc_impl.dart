import 'package:mowgli/ui/screens/deal_details/alert_editor/bloc/impl/alert_editor_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'alert_editor_event.dart';

class DealDetailsAlertEditorBloc
    extends BaseBloc<_AlertEditorEvent, DealDetailsAlertEditorState> {
  DealDetailsAlertEditorBloc(Filters initialFilters, Filters currentFilters)
      : super(_initialState(initialFilters, currentFilters));

  static DealDetailsAlertEditorState _initialState(
      Filters initialFilters, Filters currentFilters) {
    Filters filters;

    if (initialFilters == currentFilters) {
      filters = currentFilters;
    } else {
      filters = _rewriteDates(initialFilters, currentFilters);
    }

    return DealDetailsAlertEditorState(filters);
  }

  static Filters _rewriteDates(Filters initialFilters, Filters currentFilters) {
    if (initialFilters.dates?.flexibleDates != null &&
        currentFilters.dates?.flexibleDates != null) {
      FlexibleDatesFilter initialFlexibleDates =
          initialFilters.dates.flexibleDates;
      FlexibleDatesFilter currentFlexibleDates =
          currentFilters.dates.flexibleDates;

      return currentFilters.copyWith(
          dates: DatesFilter(
              flexibleDates: FlexibleDatesFilter(
                  fromDate: initialFlexibleDates.fromDate
                          .isBefore(currentFlexibleDates.fromDate)
                      ? initialFlexibleDates.fromDate
                      : currentFlexibleDates.fromDate,
                  toDate: initialFlexibleDates.toDate
                          .isAfter(currentFlexibleDates.toDate)
                      ? initialFlexibleDates.toDate
                      : currentFlexibleDates.toDate,
                  minDuration: currentFlexibleDates.minDuration,
                  maxDuration: currentFlexibleDates.maxDuration)));
    } else if (initialFilters.dates?.fixedDates != null &&
        currentFilters.dates?.fixedDates != null) {
      FixedDatesFilter initialFixedDates = initialFilters.dates.fixedDates;
      FixedDatesFilter currentFixedDates = currentFilters.dates.fixedDates;

      return currentFilters.copyWith(
          dates: DatesFilter(
              fixedDates: FixedDatesFilter(
                  fromDate: initialFixedDates.fromDate
                          .isBefore(currentFixedDates.fromDate)
                      ? initialFixedDates.fromDate
                      : currentFixedDates.fromDate,
                  toDate:
                      initialFixedDates.toDate.isAfter(currentFixedDates.toDate)
                          ? initialFixedDates.toDate
                          : currentFixedDates.toDate,
                  flexible: currentFilters.dates.fixedDates.flexible)));
    } else if (currentFilters.dates?.fixedDates != null) {
      FlexibleDatesFilter initialFlexibleDates =
          initialFilters.dates.flexibleDates;
      FixedDatesFilter currentFixedDates = currentFilters.dates.fixedDates;

      return currentFilters.copyWith(
          dates: DatesFilter(
              fixedDates: FixedDatesFilter(
                  fromDate: initialFlexibleDates.fromDate
                          .isBefore(currentFixedDates.fromDate)
                      ? initialFlexibleDates.fromDate
                      : currentFixedDates.fromDate,
                  toDate: initialFlexibleDates.toDate
                          .isAfter(currentFixedDates.toDate)
                      ? initialFlexibleDates.toDate
                      : currentFixedDates.toDate,
                  flexible: currentFilters.dates.fixedDates.flexible)));
    }

    // Other cases are impossible
    // (eg: initial fixed dates + current flexible dates)

    return currentFilters;
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
  Stream<DealDetailsAlertEditorState> mapEventToState(
      _AlertEditorEvent event) async* {
    Filters filters = state.filters;

    if (event is _UpdateDatesFilterEvent) {
      filters = filters.copyWith(dates: event.dates);
      yield DealDetailsAlertEditorState(filters);
    } else if (event is _UpdateStopOversFilterEvent) {
      filters = filters.copyWith(stopOvers: event.stopOvers);
      yield DealDetailsAlertEditorState(filters);
    } else if (event is _UpdateFlightDurationFilterEvent) {
      filters = filters.copyWith(flightDuration: event.flightDuration);
      yield DealDetailsAlertEditorState(filters);
    } else if (event is _UpdateBudgetFilterEvent) {
      filters = filters.copyWith(budget: event.budget);
      yield DealDetailsAlertEditorState(filters);
    }
  }
}
