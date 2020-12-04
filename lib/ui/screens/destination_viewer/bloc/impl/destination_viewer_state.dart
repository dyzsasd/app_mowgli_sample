import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

part 'destination_viewer_state.freezed.dart';

@freezed
abstract class DestinationViewerState with _$DestinationViewerState {
  const DestinationViewerState._();

  factory DestinationViewerState({Location location, Request request}) =
      _DestinationViewerStateData;

  factory DestinationViewerState.initial({Location location, Request request}) =
      _DestinationViewerStateInitial;

  bool get isInitial => this is _DestinationViewerStateInitial;

  bool get hasNoDestination => request?.destination?.hasNoDestination ?? true;
}
