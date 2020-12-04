import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_state.freezed.dart';

@freezed
abstract class FiltersState with _$FiltersState {
  const FiltersState._();

  factory FiltersState(
      {@required Filters currentFilters,
      Filters initialFilters}) = FiltersDataState;

  factory FiltersState.empty({Filters initialFilters}) = _FiltersEmptyState;

  factory FiltersState.ready(
      {@required Filters currentFilters,
      Filters initialFilters}) = FiltersReadyState;

  bool get isNotEmpty {
    if (this is FiltersDataState) {
      return (this as FiltersDataState).currentFilters.quantity > 0;
    } else {
      return this is! _FiltersEmptyState;
    }
  }

  Filters get filters {
    if (this is FiltersDataState) {
      return (this as FiltersDataState).currentFilters;
    } else if (this is FiltersReadyState) {
      return (this as FiltersReadyState).currentFilters;
    } else {
      return null;
    }
  }
}
