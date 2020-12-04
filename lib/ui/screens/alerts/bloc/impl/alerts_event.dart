part of 'alerts_bloc_impl.dart';

abstract class _AlertsEvent {
  const _AlertsEvent();
}

class _ListSubscriptions extends _AlertsEvent {
  const _ListSubscriptions();
}
