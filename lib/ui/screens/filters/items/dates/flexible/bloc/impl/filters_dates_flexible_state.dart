import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_dates_flexible_state.freezed.dart';

@freezed
abstract class FlexibleDatesFilterState with _$FlexibleDatesFilterState {
  const FlexibleDatesFilterState._();

  factory FlexibleDatesFilterState(
      FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate) = FlexibleDatesFilterStateData;

  factory FlexibleDatesFilterState.initial(
      {@required int minDuration,
      @required int maxDuration,
      @required DateTime minDate,
      @required DateTime maxDate,
      FlexibleDatesFilter dates}) = _FlexibleDatesFilterInitial;

  factory FlexibleDatesFilterState.ready(
      FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate) = _FlexibleDatesFilterReady;

  bool get isInitial => this is _FlexibleDatesFilterInitial;

  bool get isCurrent => this is FlexibleDatesFilterStateData;

  bool get isReady => this is _FlexibleDatesFilterReady;
}
