import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'filters_stopovers_state.freezed.dart';

@freezed
abstract class StopOversFilterState with _$StopOversFilterState {
  const StopOversFilterState._();

  factory StopOversFilterState(StopOversFilter filter) = _StopOversFilter;

  factory StopOversFilterState.initial(StopOversFilter filter) =
      _StopOversFilterInitial;

  factory StopOversFilterState.ready(StopOversFilter filter) =
      _StopOversFilterReady;

  bool get isInitial => this is _StopOversFilterInitial;

  bool get isReady => this is _StopOversFilterReady;
}
