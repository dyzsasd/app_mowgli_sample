import 'package:mowgli/ui/screens/filters/items/dates/bloc/impl/filters_dates_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'filters_dates_event.dart';

class DatesFilterBloc extends BaseBloc<_DatesFilterEvent, DatesFilterState> {
  DatesFilterBloc(DatesFilter filter) : super(_initialState(filter));

  static DatesFilterState _initialState(DatesFilter filter) =>
      DatesFilterState.initial(dates: filter);

  void saveFixedDates(FixedDatesFilter date) {
    dispatch(_SaveFixedDateEvent(date));
  }

  void saveFlexibleDates(FlexibleDatesFilter date) {
    dispatch(_SaveFlexibleDateEvent(date));
  }

  @override
  Stream<DatesFilterState> mapEventToState(_DatesFilterEvent event) async* {
    if (event is _SaveFlexibleDateEvent) {
      yield DatesFilterState.ready(DatesFilter(flexibleDates: event.value));
    } else if (event is _SaveFixedDateEvent) {
      yield DatesFilterState.ready(DatesFilter(fixedDates: event.value));
    }
  }
}
