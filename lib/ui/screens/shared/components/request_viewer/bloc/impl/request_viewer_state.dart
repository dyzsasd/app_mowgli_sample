import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/model/request_viewer_data_content.dart';

part 'request_viewer_state.freezed.dart';

@freezed
abstract class RequestViewerState with _$RequestViewerState {
  const RequestViewerState._();

  factory RequestViewerState(RequestDetailsContent data) =
      RequestViewerStateData;

  factory RequestViewerState.loading(RequestDetailsContent data) = _Loading;

  factory RequestViewerState.empty(RequestDetailsContent data) = _Empty;

  factory RequestViewerState.error(RequestDetailsContent data) = _Error;

  bool get hasErrors => this is _Error;

  bool get isReady => this is RequestViewerStateData || this is _Empty;
}
