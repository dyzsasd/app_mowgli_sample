part of 'location_picker_bloc_impl.dart';

abstract class _LocationPickerEvent {
  const _LocationPickerEvent();
}

class _LoadSuggestionsEvent extends _LocationPickerEvent {
  final String search;

  _LoadSuggestionsEvent(this.search);
}

class _GenerateFilterEvent extends _LocationPickerEvent {
  const _GenerateFilterEvent();
}

class _AddAirportEvent extends _LocationPickerEvent {
  final LocationPickerSuggestionItem airport;
  final LocationPickerSuggestionItem location;

  _AddAirportEvent(this.airport, this.location);
}

class _RemoveAirportEvent extends _LocationPickerEvent {
  final LocationPickerSuggestionItem airport;
  final LocationPickerSuggestionItem location;

  _RemoveAirportEvent(this.airport, this.location);
}

class _AddLocationEvent extends _LocationPickerEvent {
  final LocationPickerSuggestionItem location;
  final Iterable<LocationPickerSuggestionItem> airports;

  _AddLocationEvent(this.location, this.airports);
}

class _RemoveLocationEvent extends _LocationPickerEvent {
  final LocationPickerSuggestionItem location;

  _RemoveLocationEvent(this.location);
}

class _KeyboardActionEvent extends _LocationPickerEvent {
  final bool open;

  _KeyboardActionEvent(this.open);
}
