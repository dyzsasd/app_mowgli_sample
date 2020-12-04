import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_budget_state.freezed.dart';

@freezed
abstract class BudgetFilterState with _$BudgetFilterState {
  const BudgetFilterState._();

  factory BudgetFilterState(BudgetFilter budget, int minValue, int maxValue) =
      _BudgetFilter;

  factory BudgetFilterState.initial(
      BudgetFilter budget, int minValue, int maxValue) = _BudgetFilterInitial;

  factory BudgetFilterState.ready(
      BudgetFilter budget, int minValue, int maxValue) = _BudgetFilterReady;

  bool get isInitial => this is _BudgetFilterInitial;

  bool get isCurrent => this is _BudgetFilter;

  bool get isReady => this is _BudgetFilterReady;
}
