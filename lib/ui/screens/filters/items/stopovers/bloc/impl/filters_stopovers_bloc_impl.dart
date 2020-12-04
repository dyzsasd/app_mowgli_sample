import 'package:mowgli/ui/screens/filters/items/stopovers/bloc/impl/filters_stopovers_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'filters_stopovers_event.dart';

class StopOversFilterBloc
    extends BaseBloc<_StopOversFilterEvent, StopOversFilterState> {
  StopOversFilterBloc(StopOversFilter stopOvers)
      : super(_initialState(stopOvers ?? StopOversFilter()));

  static StopOversFilterState _initialState(StopOversFilter stopOversFilter) =>
      StopOversFilterState.initial(stopOversFilter ?? BudgetFilter());

  void updateDirectStatus(bool isChecked) {
    dispatch(_UpdateDirectStatus(isChecked));
  }

  void updateOneStopStatus(bool isChecked) {
    dispatch(_UpdateOneStopStatus(isChecked));
  }

  void updateMultipleStopsStatus(bool isChecked) {
    dispatch(_UpdateMultipleStopsStatus(isChecked));
  }

  void generateFilter() {
    dispatch(const _GenerateFilterEvent());
  }

  @override
  Stream<StopOversFilterState> mapEventToState(
      _StopOversFilterEvent event) async* {
    if (event is _UpdateDirectStatus) {
      yield StopOversFilterState(
          state.filter.copyWith(direct: true, one: false, many: false));
    } else if (event is _UpdateOneStopStatus) {
      if (state.filter.many == true) {
        yield StopOversFilterState(
            state.filter.copyWith(direct: true, one: true, many: false));
      } else {
        yield StopOversFilterState(state.filter
            .copyWith(direct: true, one: event.isChecked, many: false));
      }
    } else if (event is _UpdateMultipleStopsStatus) {
      yield StopOversFilterState(state.filter
          .copyWith(direct: true, one: true, many: event.isChecked));
    } else if (event is _GenerateFilterEvent) {
      yield StopOversFilterState.ready(state.filter);
    }
  }
}
