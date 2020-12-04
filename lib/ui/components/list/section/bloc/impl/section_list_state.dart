import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';

part 'section_list_state.freezed.dart';

@freezed
abstract class SectionListState with _$SectionListState {
  const SectionListState._();

  factory SectionListState(SectionListData data) = SectionListStateData;

  factory SectionListState.loading() = _Loading;

  factory SectionListState.error() = _Error;

  factory SectionListState.noMoreDeals(SectionListData data) = NoMoreDeals;

  bool get isError => this is _Error;

  bool get noMoreDeals => this is NoMoreDeals;
}
