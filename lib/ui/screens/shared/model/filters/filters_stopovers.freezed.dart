// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_stopovers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StopOversFilter _$StopOversFilterFromJson(Map<String, dynamic> json) {
  return _StopOversFilter.fromJson(json);
}

/// @nodoc
class _$StopOversFilterTearOff {
  const _$StopOversFilterTearOff();

// ignore: unused_element
  _StopOversFilter call(
      {bool direct = true, bool one = true, bool many = true}) {
    return _StopOversFilter(
      direct: direct,
      one: one,
      many: many,
    );
  }

// ignore: unused_element
  StopOversFilter fromJson(Map<String, Object> json) {
    return StopOversFilter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $StopOversFilter = _$StopOversFilterTearOff();

/// @nodoc
mixin _$StopOversFilter {
  bool get direct;
  bool get one;
  bool get many;

  Map<String, dynamic> toJson();
  $StopOversFilterCopyWith<StopOversFilter> get copyWith;
}

/// @nodoc
abstract class $StopOversFilterCopyWith<$Res> {
  factory $StopOversFilterCopyWith(
          StopOversFilter value, $Res Function(StopOversFilter) then) =
      _$StopOversFilterCopyWithImpl<$Res>;
  $Res call({bool direct, bool one, bool many});
}

/// @nodoc
class _$StopOversFilterCopyWithImpl<$Res>
    implements $StopOversFilterCopyWith<$Res> {
  _$StopOversFilterCopyWithImpl(this._value, this._then);

  final StopOversFilter _value;
  // ignore: unused_field
  final $Res Function(StopOversFilter) _then;

  @override
  $Res call({
    Object direct = freezed,
    Object one = freezed,
    Object many = freezed,
  }) {
    return _then(_value.copyWith(
      direct: direct == freezed ? _value.direct : direct as bool,
      one: one == freezed ? _value.one : one as bool,
      many: many == freezed ? _value.many : many as bool,
    ));
  }
}

/// @nodoc
abstract class _$StopOversFilterCopyWith<$Res>
    implements $StopOversFilterCopyWith<$Res> {
  factory _$StopOversFilterCopyWith(
          _StopOversFilter value, $Res Function(_StopOversFilter) then) =
      __$StopOversFilterCopyWithImpl<$Res>;
  @override
  $Res call({bool direct, bool one, bool many});
}

/// @nodoc
class __$StopOversFilterCopyWithImpl<$Res>
    extends _$StopOversFilterCopyWithImpl<$Res>
    implements _$StopOversFilterCopyWith<$Res> {
  __$StopOversFilterCopyWithImpl(
      _StopOversFilter _value, $Res Function(_StopOversFilter) _then)
      : super(_value, (v) => _then(v as _StopOversFilter));

  @override
  _StopOversFilter get _value => super._value as _StopOversFilter;

  @override
  $Res call({
    Object direct = freezed,
    Object one = freezed,
    Object many = freezed,
  }) {
    return _then(_StopOversFilter(
      direct: direct == freezed ? _value.direct : direct as bool,
      one: one == freezed ? _value.one : one as bool,
      many: many == freezed ? _value.many : many as bool,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_StopOversFilter extends _StopOversFilter {
  _$_StopOversFilter({this.direct = true, this.one = true, this.many = true})
      : assert(direct != null),
        assert(one != null),
        assert(many != null),
        super._();

  factory _$_StopOversFilter.fromJson(Map<String, dynamic> json) =>
      _$_$_StopOversFilterFromJson(json);

  @JsonKey(defaultValue: true)
  @override
  final bool direct;
  @JsonKey(defaultValue: true)
  @override
  final bool one;
  @JsonKey(defaultValue: true)
  @override
  final bool many;

  @override
  String toString() {
    return 'StopOversFilter(direct: $direct, one: $one, many: $many)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StopOversFilter &&
            (identical(other.direct, direct) ||
                const DeepCollectionEquality().equals(other.direct, direct)) &&
            (identical(other.one, one) ||
                const DeepCollectionEquality().equals(other.one, one)) &&
            (identical(other.many, many) ||
                const DeepCollectionEquality().equals(other.many, many)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(direct) ^
      const DeepCollectionEquality().hash(one) ^
      const DeepCollectionEquality().hash(many);

  @override
  _$StopOversFilterCopyWith<_StopOversFilter> get copyWith =>
      __$StopOversFilterCopyWithImpl<_StopOversFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StopOversFilterToJson(this);
  }
}

abstract class _StopOversFilter extends StopOversFilter {
  _StopOversFilter._() : super._();
  factory _StopOversFilter({bool direct, bool one, bool many}) =
      _$_StopOversFilter;

  factory _StopOversFilter.fromJson(Map<String, dynamic> json) =
      _$_StopOversFilter.fromJson;

  @override
  bool get direct;
  @override
  bool get one;
  @override
  bool get many;
  @override
  _$StopOversFilterCopyWith<_StopOversFilter> get copyWith;
}
