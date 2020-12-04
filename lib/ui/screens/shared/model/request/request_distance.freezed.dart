// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_distance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RequestDistance _$RequestDistanceFromJson(Map<String, dynamic> json) {
  return _RequestDistance.fromJson(json);
}

/// @nodoc
class _$RequestDistanceTearOff {
  const _$RequestDistanceTearOff();

// ignore: unused_element
  _RequestDistance call({@nullable int min, @nullable int max}) {
    return _RequestDistance(
      min: min,
      max: max,
    );
  }

// ignore: unused_element
  RequestDistance fromJson(Map<String, Object> json) {
    return RequestDistance.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RequestDistance = _$RequestDistanceTearOff();

/// @nodoc
mixin _$RequestDistance {
  @nullable
  int get min;
  @nullable
  int get max;

  Map<String, dynamic> toJson();
  $RequestDistanceCopyWith<RequestDistance> get copyWith;
}

/// @nodoc
abstract class $RequestDistanceCopyWith<$Res> {
  factory $RequestDistanceCopyWith(
          RequestDistance value, $Res Function(RequestDistance) then) =
      _$RequestDistanceCopyWithImpl<$Res>;
  $Res call({@nullable int min, @nullable int max});
}

/// @nodoc
class _$RequestDistanceCopyWithImpl<$Res>
    implements $RequestDistanceCopyWith<$Res> {
  _$RequestDistanceCopyWithImpl(this._value, this._then);

  final RequestDistance _value;
  // ignore: unused_field
  final $Res Function(RequestDistance) _then;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed ? _value.min : min as int,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

/// @nodoc
abstract class _$RequestDistanceCopyWith<$Res>
    implements $RequestDistanceCopyWith<$Res> {
  factory _$RequestDistanceCopyWith(
          _RequestDistance value, $Res Function(_RequestDistance) then) =
      __$RequestDistanceCopyWithImpl<$Res>;
  @override
  $Res call({@nullable int min, @nullable int max});
}

/// @nodoc
class __$RequestDistanceCopyWithImpl<$Res>
    extends _$RequestDistanceCopyWithImpl<$Res>
    implements _$RequestDistanceCopyWith<$Res> {
  __$RequestDistanceCopyWithImpl(
      _RequestDistance _value, $Res Function(_RequestDistance) _then)
      : super(_value, (v) => _then(v as _RequestDistance));

  @override
  _RequestDistance get _value => super._value as _RequestDistance;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
  }) {
    return _then(_RequestDistance(
      min: min == freezed ? _value.min : min as int,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_RequestDistance extends _RequestDistance {
  _$_RequestDistance({@nullable this.min, @nullable this.max}) : super._();

  factory _$_RequestDistance.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestDistanceFromJson(json);

  @override
  @nullable
  final int min;
  @override
  @nullable
  final int max;

  @override
  String toString() {
    return 'RequestDistance(min: $min, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestDistance &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max);

  @override
  _$RequestDistanceCopyWith<_RequestDistance> get copyWith =>
      __$RequestDistanceCopyWithImpl<_RequestDistance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestDistanceToJson(this);
  }
}

abstract class _RequestDistance extends RequestDistance {
  _RequestDistance._() : super._();
  factory _RequestDistance({@nullable int min, @nullable int max}) =
      _$_RequestDistance;

  factory _RequestDistance.fromJson(Map<String, dynamic> json) =
      _$_RequestDistance.fromJson;

  @override
  @nullable
  int get min;
  @override
  @nullable
  int get max;
  @override
  _$RequestDistanceCopyWith<_RequestDistance> get copyWith;
}
