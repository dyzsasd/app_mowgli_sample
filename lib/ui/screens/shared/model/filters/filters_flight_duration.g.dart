// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_flight_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlightDurationFilter _$_$_FlightDurationFilterFromJson(Map json) {
  return _$_FlightDurationFilter(
    minTime: json['minTime'] as int ?? 0,
    maxTime: json['maxTime'] as int,
  );
}

Map<String, dynamic> _$_$_FlightDurationFilterToJson(
        _$_FlightDurationFilter instance) =>
    <String, dynamic>{
      'minTime': instance.minTime,
      'maxTime': instance.maxTime,
    };
