import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';

part 'autocompletion_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AutoCompletionResponse {
  @JsonKey(defaultValue: false, name: 'ok', required: true)
  bool value;
  List<AutoCompletionResult> results;

  AutoCompletionResponse({this.value, this.results});

  AutoCompletionResult operator [](AutoCompletionResultType type) {
    return results.firstWhere(
        (AutoCompletionResult result) => result.type == type,
        orElse: () => null);
  }

  factory AutoCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$AutoCompletionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AutoCompletionResponseToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AutoCompletionResult {
  AutoCompletionResultType type;
  List<AutoCompletionResultItem> items;

  AutoCompletionResult({this.type});

  bool get isEmpty => IterableUtils.isEmpty(items);

  factory AutoCompletionResult.fromJson(Map<String, dynamic> json) =>
      _$AutoCompletionResultFromJson(json);

  Map<String, dynamic> toJson() => _$AutoCompletionResultToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AutoCompletionResultItem {
  String code;
  String name;
  @JsonKey(name: 'country_code')
  String countryCode;
  @JsonKey(name: 'country_name')
  String countryName;
  int order;
  List<AutoCompletionResultItem> airports;

  AutoCompletionResultItem(
      {this.code,
      this.name,
      this.countryCode,
      this.countryName,
      this.order,
      this.airports});

  factory AutoCompletionResultItem.fromJson(Map<String, dynamic> json) =>
      _$AutoCompletionResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$AutoCompletionResultItemToJson(this);
}

enum AutoCompletionResultType {
  @JsonValue('airport')
  airport,
  @JsonValue('category')
  category,
  @JsonValue('country')
  country,
  @JsonValue('city')
  city,
  @JsonValue('continent')
  continent,
}
