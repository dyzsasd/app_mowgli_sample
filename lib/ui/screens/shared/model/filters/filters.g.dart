// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Filters _$_$_FiltersFromJson(Map json) {
  return _$_Filters(
    dates: json['dates'] == null
        ? null
        : DatesFilter.fromJson((json['dates'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    stopOvers: json['stopOvers'] == null
        ? null
        : StopOversFilter.fromJson((json['stopOvers'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    flightDuration: json['flightDuration'] == null
        ? null
        : FlightDurationFilter.fromJson((json['flightDuration'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    budget: json['budget'] == null
        ? null
        : BudgetFilter.fromJson((json['budget'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$_$_FiltersToJson(_$_Filters instance) =>
    <String, dynamic>{
      'dates': instance.dates?.toJson(),
      'stopOvers': instance.stopOvers?.toJson(),
      'flightDuration': instance.flightDuration?.toJson(),
      'budget': instance.budget?.toJson(),
    };

_$_EmptyFilters _$_$_EmptyFiltersFromJson(Map json) {
  return _$_EmptyFilters(
    dates: json['dates'] == null
        ? null
        : DatesFilter.fromJson((json['dates'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    stopOvers: json['stopOvers'] == null
        ? null
        : StopOversFilter.fromJson((json['stopOvers'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    flightDuration: json['flightDuration'] == null
        ? null
        : FlightDurationFilter.fromJson((json['flightDuration'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    budget: json['budget'] == null
        ? null
        : BudgetFilter.fromJson((json['budget'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$_$_EmptyFiltersToJson(_$_EmptyFilters instance) =>
    <String, dynamic>{
      'dates': instance.dates?.toJson(),
      'stopOvers': instance.stopOvers?.toJson(),
      'flightDuration': instance.flightDuration?.toJson(),
      'budget': instance.budget?.toJson(),
    };
