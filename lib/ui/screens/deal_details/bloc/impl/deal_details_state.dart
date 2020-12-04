import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';

part 'deal_details_state.freezed.dart';

@freezed
abstract class DealDetailsState with _$DealDetailsState {
  const DealDetailsState._();

  factory DealDetailsState(DealDetailsContent data, {Filters filters}) =
      DealDetailsStateData;

  factory DealDetailsState.loading() = _Loading;

  factory DealDetailsState.error() = _Error;

  bool get hasData => this is DealDetailsStateData;
}
