import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_details_state.freezed.dart';

@freezed
abstract class SectionDetailsState with _$SectionDetailsState {
  factory SectionDetailsState() = _Result;

  factory SectionDetailsState.loading() = _Loading;

  factory SectionDetailsState.empty() = _Empty;

  factory SectionDetailsState.error() = _Error;
}
