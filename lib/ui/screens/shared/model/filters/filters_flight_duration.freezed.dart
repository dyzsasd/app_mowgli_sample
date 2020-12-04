// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_flight_duration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FlightDurationFilter _$FlightDurationFilterFromJson(Map<String, dynamic> json) {
  return _FlightDurationFilter.fromJson(json);
}

/// @nodoc
class _$FlightDurationFilterTearOff {
  const _$FlightDurationFilterTearOff();

// ignore: unused_element
  _FlightDurationFilter call({int minTime = 0, int maxTime}) {
    return _FlightDurationFilter(
      minTime: minTime,
      maxTime: maxTime,
    );
  }

// ignore: unused_element
  FlightDurationFilter fromJson(Map<String, Object> json) {
    return FlightDurationFilter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FlightDurationFilter = _$FlightDurationFilterTearOff();

/// @nodoc
mixin _$FlightDurationFilter {
  int get minTime;
  int get maxTime;

  Map<String, dynamic> toJson();
  $FlightDurationFilterCopyWith<FlightDurationFilter> get copyWith;
}

/// @nodoc
abstract class $FlightDurationFilterCopyWith<$Res> {
  factory $FlightDurationFilterCopyWith(FlightDurationFilter value,
          $Res Function(FlightDurationFilter) then) =
      _$FlightDurationFilterCopyWithImpl<$Res>;
  $Res call({int minTime, int maxTime});
}

/// @nodoc
class _$FlightDurationFilterCopyWithImpl<$Res>
    implements $FlightDurationFilterCopyWith<$Res> {
  _$FlightDurationFilterCopyWithImpl(this._value, this._then);

  final FlightDurationFilter _value;
  // ignore: unused_field
  final $Res Function(FlightDurationFilter) _then;

  @override
  $Res call({
    Object minTime = freezed,
    Object maxTime = freezed,
  }) {
    return _then(_value.copyWith(
      minTime: minTime == freezed ? _value.minTime : minTime as int,
      maxTime: maxTime == freezed ? _value.maxTime : maxTime as int,
    ));
  }
}

/// @nodoc
abstract class _$FlightDurationFilterCopyWith<$Res>
    implements $FlightDurationFilterCopyWith<$Res> {
  factory _$FlightDurationFilterCopyWith(_FlightDurationFilter value,
          $Res Function(_FlightDurationFilter) then) =
      __$FlightDurationFilterCopyWithImpl<$Res>;
  @override
  $Res call({int minTime, int maxTime});
}

/// @nodoc
class __$FlightDurationFilterCopyWithImpl<$Res>
    extends _$FlightDurationFilterCopyWithImpl<$Res>
    implements _$FlightDurationFilterCopyWith<$Res> {
  __$FlightDurationFilterCopyWithImpl(
      _FlightDurationFilter _value, $Res Function(_FlightDurationFilter) _then)
      : super(_value, (v) => _then(v as _FlightDurationFilter));

  @override
  _FlightDurationFilter get _value => super._value as _FlightDurationFilter;

  @override
  $Res call({
    Object minTime = freezed,
    Object maxTime = freezed,
  }) {
    return _then(_FlightDurationFilter(
      minTime: minTime == freezed ? _value.minTime : minTime as int,
      maxTime: maxTime == freezed ? _value.maxTime : maxTime as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_FlightDurationFilter extends _FlightDurationFilter {
  _$_FlightDurationFilter({this.minTime = 0, this.maxTime})
      : assert(minTime != null),
        super._();

  factory _$_FlightDurationFilter.fromJson(Map<String, dynamic> json) =>
      _$_$_FlightDurationFilterFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int minTime;
  @override
  final int maxTime;

  @override
  String toString() {
    return 'FlightDurationFilter(minTime: $minTime, maxTime: $maxTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlightDurationFilter &&
            (identical(other.minTime, minTime) ||
                const DeepCollectionEquality()
                    .equals(other.minTime, minTime)) &&
            (identical(other.maxTime, maxTime) ||
                const DeepCollectionEquality().equals(other.maxTime, maxTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(minTime) ^
      const DeepCollectionEquality().hash(maxTime);

  @override
  _$FlightDurationFilterCopyWith<_FlightDurationFilter> get copyWith =>
      __$FlightDurationFilterCopyWithImpl<_FlightDurationFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FlightDurationFilterToJson(this);
  }
}

abstract class _FlightDurationFilter extends FlightDurationFilter {
  _FlightDurationFilter._() : super._();
  factory _FlightDurationFilter({int minTime, int maxTime}) =
      _$_FlightDurationFilter;

  factory _FlightDurationFilter.fromJson(Map<String, dynamic> json) =
      _$_FlightDurationFilter.fromJson;

  @override
  int get minTime;
  @override
  int get maxTime;
  @override
  _$FlightDurationFilterCopyWith<_FlightDurationFilter> get copyWith;
}
