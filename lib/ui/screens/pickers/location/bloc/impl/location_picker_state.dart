import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/pickers/location/model/location_picker_data_content.dart';

part 'location_picker_state.freezed.dart';

@freezed
abstract class LocationPickerState with _$LocationPickerState {
  const LocationPickerState._();

  factory LocationPickerState(
      {@required LocationPickerSuggestions data,
      LocationPickerSuggestionItem location,
      bool showValidateButton}) = LocationPickerDataState;

  factory LocationPickerState.initial({LocationPickerSuggestionItem location}) =
      _Initial;

  factory LocationPickerState.ready(
          {LocationPickerSuggestionItem location,
          Iterable<LocationPickerSuggestionItem> airports}) =
      LocationPickerReadyState;

  factory LocationPickerState.empty({LocationPickerSuggestionItem location}) =
      _Empty;

  factory LocationPickerState.loading(
      {LocationPickerSuggestionItem location,
      LocationPickerSuggestions previousSuggestions}) = _Loading;

  factory LocationPickerState.error({LocationPickerSuggestionItem location}) =
      _Error;
}
