import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/request/smartcache_best_deal_request.dart';

part 'filters_budget.freezed.dart';
part 'filters_budget.g.dart';

@freezed
abstract class BudgetFilter with _$BudgetFilter {
  const BudgetFilter._();

  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory BudgetFilter({@Default(0) int min, int max}) = _BudgetFilter;

  factory BudgetFilter.fromJson(Map<String, dynamic> json) =>
      _$BudgetFilterFromJson(json);
}

class BudgetFilterUtils {
  const BudgetFilterUtils._();

  static BudgetFilter extractBudgetFilter(SmartCacheBestDealRequest request) {
    if (request.budget is! num) {
      return null;
    } else {
      return BudgetFilter(min: 0, max: request.budget.toInt());
    }
  }
}
