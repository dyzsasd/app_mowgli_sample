import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  NotificationsState._();

  factory NotificationsState(bool result) = _Result;

  factory NotificationsState.initial() = _Initial;

  factory NotificationsState.loading() = _Loading;

  factory NotificationsState.error(NotificationsErrorType type) = _Error;

  bool get isNotificationsDisabledEvent =>
      this is _Error &&
      (this as _Error).type == NotificationsErrorType.notificationsDisabled;

  bool get isSuccessful => this is _Result && (this as _Result).result;
}

enum NotificationsErrorType {
  notificationsDisabled,
  generic,
}
