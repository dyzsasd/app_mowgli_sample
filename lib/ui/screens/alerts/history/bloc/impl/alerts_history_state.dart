import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/alerts/history/model/alerts_history_data_content.dart';

part 'alerts_history_state.freezed.dart';

@freezed
abstract class AlertsHistoryState with _$AlertsHistoryState {
  factory AlertsHistoryState(AlertsHistoryContent notifications) =
      AlertsHistoryStateData;

  const factory AlertsHistoryState.loading() = _Loading;

  const factory AlertsHistoryState.error() = _Error;
}
