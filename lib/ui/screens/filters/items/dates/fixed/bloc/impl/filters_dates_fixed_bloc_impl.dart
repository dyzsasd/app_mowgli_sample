import 'package:mowgli/ui/screens/filters/items/dates/fixed/bloc/impl/filters_dates_fixed_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'filters_dates_fixed_event.dart';

class FixedDatesFilterBloc
    extends BaseBloc<_FixedDatesFilterEvent, FixedDatesFilterState> {
  FixedDatesFilterBloc(FixedDatesFilter filter) : super(_initialState(filter));

  static FixedDatesFilterState _initialState(FixedDatesFilter filter) =>
      FixedDatesFilterState.initial(dates: filter);

  void updateFlexibleToggle() {
    dispatch(_UpdateFlexibleToggleEvent());
  }

  void updateRange(DateTime min, DateTime max) {
    dispatch(_UpdateRangeEvent(min, max));
  }

  void generateFilter() {
    dispatch(const _GenerateFixedDatesEvent());
  }

  @override
  Stream<FixedDatesFilterState> mapEventToState(
      _FixedDatesFilterEvent event) async* {
    FixedDatesFilter dates = state.dates ?? FixedDatesFilter();

    if (event is _UpdateFlexibleToggleEvent) {
      yield FixedDatesFilterState(dates.copyWith(flexible: !dates.flexible));
    } else if (event is _UpdateRangeEvent) {
      yield FixedDatesFilterState(
          dates.copyWith(fromDate: event.min, toDate: event.max));
    } else if (event is _GenerateFixedDatesEvent) {
      yield FixedDatesFilterState.ready(dates);
    }
  }
}
