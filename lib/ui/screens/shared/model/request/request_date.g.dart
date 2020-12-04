// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestDate _$_$_RequestDateFromJson(Map json) {
  return _$_RequestDate(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    flexibleDatesMin: json['flexibleDatesMin'] == null
        ? null
        : DateTime.parse(json['flexibleDatesMin'] as String),
    flexibleDatesMax: json['flexibleDatesMax'] == null
        ? null
        : DateTime.parse(json['flexibleDatesMax'] as String),
    flexibleFixedDates: json['flexibleFixedDates'] as bool ?? true,
  );
}

Map<String, dynamic> _$_$_RequestDateToJson(_$_RequestDate instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'flexibleDatesMin': instance.flexibleDatesMin?.toIso8601String(),
      'flexibleDatesMax': instance.flexibleDatesMax?.toIso8601String(),
      'flexibleFixedDates': instance.flexibleFixedDates,
    };
