import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_calendar_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCalendarResponse {
  @JsonKey(name: 'calendar_cells')
  List<SmartCacheCalendarCell> cells;
  List<SmartCacheAmountCat> cats;

  SmartCacheCalendarResponse({this.cells, this.cats});

  factory SmartCacheCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCalendarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCalendarResponseToJson(this);
}
