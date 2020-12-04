import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_dates_fixed_state.freezed.dart';

@freezed
abstract class FixedDatesFilterState with _$FixedDatesFilterState {
  const FixedDatesFilterState._();

  factory FixedDatesFilterState(FixedDatesFilter dates) = _FixedDatesFilter;

  factory FixedDatesFilterState.initial({FixedDatesFilter dates}) =
      _FixedDatesFilterInitial;

  factory FixedDatesFilterState.ready(FixedDatesFilter dates) =
      _FixedDatesFilterReady;

  bool get isInitial => this is _FixedDatesFilterInitial;

  bool get isCurrent => this is _FixedDatesFilter;

  bool get isReady => this is _FixedDatesFilterReady;

  bool get isSavable =>
      dates != null &&
      dates.fromDate != null &&
      dates.toDate != null &&
      dates.fromDate.isBefore(dates.toDate);
}
