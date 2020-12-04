part of 'homepage_bloc_impl.dart';

abstract class _HomePageEvent {
  const _HomePageEvent();
}

class _LoadDefaultHomePageEvent extends _HomePageEvent {
  const _LoadDefaultHomePageEvent();
}

class _ChangeLocationEvent extends _HomePageEvent {
  final Location location;

  _ChangeLocationEvent(this.location);
}

class _UpdateFiltersEvent extends _HomePageEvent {
  final Filters filters;

  _UpdateFiltersEvent(this.filters);
}
