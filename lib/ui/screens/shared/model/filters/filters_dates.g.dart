// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DatesFilter _$_$_DatesFilterFromJson(Map json) {
  return _$_DatesFilter(
    fixedDates: json['fixedDates'] == null
        ? null
        : FixedDatesFilter.fromJson((json['fixedDates'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    flexibleDates: json['flexibleDates'] == null
        ? null
        : FlexibleDatesFilter.fromJson((json['flexibleDates'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$_$_DatesFilterToJson(_$_DatesFilter instance) =>
    <String, dynamic>{
      'fixedDates': instance.fixedDates?.toJson(),
      'flexibleDates': instance.flexibleDates?.toJson(),
    };

_$_FixedDatesFilter _$_$_FixedDatesFilterFromJson(Map json) {
  return _$_FixedDatesFilter(
    fromDate: json['fromDate'] == null
        ? null
        : DateTime.parse(json['fromDate'] as String),
    toDate: json['toDate'] == null
        ? null
        : DateTime.parse(json['toDate'] as String),
    flexible: json['flexible'] as bool ?? true,
  );
}

Map<String, dynamic> _$_$_FixedDatesFilterToJson(
        _$_FixedDatesFilter instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'flexible': instance.flexible,
    };

_$_FlexibleDatesFilter _$_$_FlexibleDatesFilterFromJson(Map json) {
  return _$_FlexibleDatesFilter(
    fromDate: json['fromDate'] == null
        ? null
        : DateTime.parse(json['fromDate'] as String),
    toDate: json['toDate'] == null
        ? null
        : DateTime.parse(json['toDate'] as String),
    minDuration: json['minDuration'] as int,
    maxDuration: json['maxDuration'] as int,
  );
}

Map<String, dynamic> _$_$_FlexibleDatesFilterToJson(
        _$_FlexibleDatesFilter instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'minDuration': instance.minDuration,
      'maxDuration': instance.maxDuration,
    };
