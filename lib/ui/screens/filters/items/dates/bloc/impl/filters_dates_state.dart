import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_dates_state.freezed.dart';

@freezed
abstract class DatesFilterState with _$DatesFilterState {
  const DatesFilterState._();

  factory DatesFilterState(DatesFilter dates) = _DatesFilter;

  factory DatesFilterState.initial({DatesFilter dates}) = _DatesFilterInitial;

  factory DatesFilterState.ready(DatesFilter dates) = _DatesFilterReady;

  bool get isInitial => this is _DatesFilterInitial;

  bool get isCurrent => this is _DatesFilter;

  bool get isReady => this is _DatesFilterReady;
}
