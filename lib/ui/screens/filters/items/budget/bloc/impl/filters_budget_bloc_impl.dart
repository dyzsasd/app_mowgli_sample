import 'dart:math' as math;

import 'package:mowgli/ui/screens/filters/items/budget/bloc/impl/filters_budget_state.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';

part 'filters_budget_event.dart';

class BudgetFilterBloc extends BaseBloc<_BudgetFilterEvent, BudgetFilterState> {
  final int minBudget;
  final int maxBudget;

  BudgetFilterBloc(BudgetFilter budget, this.minBudget, this.maxBudget)
      : super(_initialState(budget, minBudget, maxBudget));

  static BudgetFilterState _initialState(
          BudgetFilter budgetFilter, int minBudget, int maxBudget) =>
      BudgetFilterState.initial(
          budgetFilter ?? BudgetFilter(min: minBudget, max: maxBudget),
          minBudget,
          maxBudget);

  void changeMinBudget(int min) {
    dispatch(_MinBudgetChangedEvent(min));
  }

  void changeMaxBudget(int max) {
    dispatch(_MaxBudgetChangedEvent(max));
  }

  void generateFilter() {
    dispatch(const _GenerateFilterEvent());
  }

  @override
  Stream<BudgetFilterState> mapEventToState(_BudgetFilterEvent event) async* {
    if (event is _MinBudgetChangedEvent) {
      if (event.value >= state.budget.max) {
        yield BudgetFilterState(
            state.budget.copyWith(min: math.max(event.value - 1, minBudget)),
            minBudget,
            maxBudget);
      } else {
        yield BudgetFilterState(
            state.budget.copyWith(min: event.value), minBudget, maxBudget);
      }
    } else if (event is _MaxBudgetChangedEvent) {
      if (event.value <= state.budget.min) {
        yield BudgetFilterState(
            state.budget.copyWith(max: math.min(event.value + 1, maxBudget)),
            minBudget,
            maxBudget);
      } else {
        yield BudgetFilterState(
            state.budget.copyWith(max: event.value), minBudget, maxBudget);
      }
    } else if (event is _GenerateFilterEvent) {
      yield BudgetFilterState.ready(state.budget, minBudget, maxBudget);
    }
  }
}
