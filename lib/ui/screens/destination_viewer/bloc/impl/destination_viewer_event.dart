part of 'destination_viewer_bloc_impl.dart';

abstract class _DestinationViewerEvent {
  const _DestinationViewerEvent();
}

class _ChangeDestinationDataEvent extends _DestinationViewerEvent {
  final Location location;

  _ChangeDestinationDataEvent(this.location);
}
