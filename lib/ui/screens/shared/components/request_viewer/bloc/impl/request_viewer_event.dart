part of 'request_viewer_bloc_impl.dart';

abstract class _RequestViewerEvent {
  const _RequestViewerEvent();
}

class _LoadDealsEvent extends _RequestViewerEvent {
  const _LoadDealsEvent();
}

class _ChangeRequestLocationEvent extends _RequestViewerEvent {
  final Request request;

  _ChangeRequestLocationEvent(this.request);
}

class _UpdateFiltersEvent extends _RequestViewerEvent {
  final Filters filters;

  _UpdateFiltersEvent(this.filters);
}
