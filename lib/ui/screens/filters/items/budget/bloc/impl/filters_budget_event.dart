part of 'filters_budget_bloc_impl.dart';

abstract class _BudgetFilterEvent {
  const _BudgetFilterEvent();
}

class _MinBudgetChangedEvent extends _BudgetFilterEvent {
  final int value;

  _MinBudgetChangedEvent(this.value);
}

class _MaxBudgetChangedEvent extends _BudgetFilterEvent {
  final int value;

  _MaxBudgetChangedEvent(this.value);
}

class _GenerateFilterEvent extends _BudgetFilterEvent {
  const _GenerateFilterEvent();
}
