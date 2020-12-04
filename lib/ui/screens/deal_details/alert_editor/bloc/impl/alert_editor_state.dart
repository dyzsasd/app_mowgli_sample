import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'alert_editor_state.freezed.dart';

@freezed
abstract class DealDetailsAlertEditorState with _$DealDetailsAlertEditorState {
  factory DealDetailsAlertEditorState(Filters filters) = _Result;
}
