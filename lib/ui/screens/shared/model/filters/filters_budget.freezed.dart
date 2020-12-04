// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BudgetFilter _$BudgetFilterFromJson(Map<String, dynamic> json) {
  return _BudgetFilter.fromJson(json);
}

/// @nodoc
class _$BudgetFilterTearOff {
  const _$BudgetFilterTearOff();

// ignore: unused_element
  _BudgetFilter call({int min = 0, int max}) {
    return _BudgetFilter(
      min: min,
      max: max,
    );
  }

// ignore: unused_element
  BudgetFilter fromJson(Map<String, Object> json) {
    return BudgetFilter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BudgetFilter = _$BudgetFilterTearOff();

/// @nodoc
mixin _$BudgetFilter {
  int get min;
  int get max;

  Map<String, dynamic> toJson();
  $BudgetFilterCopyWith<BudgetFilter> get copyWith;
}

/// @nodoc
abstract class $BudgetFilterCopyWith<$Res> {
  factory $BudgetFilterCopyWith(
          BudgetFilter value, $Res Function(BudgetFilter) then) =
      _$BudgetFilterCopyWithImpl<$Res>;
  $Res call({int min, int max});
}

/// @nodoc
class _$BudgetFilterCopyWithImpl<$Res> implements $BudgetFilterCopyWith<$Res> {
  _$BudgetFilterCopyWithImpl(this._value, this._then);

  final BudgetFilter _value;
  // ignore: unused_field
  final $Res Function(BudgetFilter) _then;

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
abstract class _$BudgetFilterCopyWith<$Res>
    implements $BudgetFilterCopyWith<$Res> {
  factory _$BudgetFilterCopyWith(
          _BudgetFilter value, $Res Function(_BudgetFilter) then) =
      __$BudgetFilterCopyWithImpl<$Res>;
  @override
  $Res call({int min, int max});
}

/// @nodoc
class __$BudgetFilterCopyWithImpl<$Res> extends _$BudgetFilterCopyWithImpl<$Res>
    implements _$BudgetFilterCopyWith<$Res> {
  __$BudgetFilterCopyWithImpl(
      _BudgetFilter _value, $Res Function(_BudgetFilter) _then)
      : super(_value, (v) => _then(v as _BudgetFilter));

  @override
  _BudgetFilter get _value => super._value as _BudgetFilter;

  @override
  $Res call({
    Object min = freezed,
    Object max = freezed,
  }) {
    return _then(_BudgetFilter(
      min: min == freezed ? _value.min : min as int,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_BudgetFilter extends _BudgetFilter {
  _$_BudgetFilter({this.min = 0, this.max})
      : assert(min != null),
        super._();

  factory _$_BudgetFilter.fromJson(Map<String, dynamic> json) =>
      _$_$_BudgetFilterFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int min;
  @override
  final int max;

  @override
  String toString() {
    return 'BudgetFilter(min: $min, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BudgetFilter &&
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
  _$BudgetFilterCopyWith<_BudgetFilter> get copyWith =>
      __$BudgetFilterCopyWithImpl<_BudgetFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BudgetFilterToJson(this);
  }
}

abstract class _BudgetFilter extends BudgetFilter {
  _BudgetFilter._() : super._();
  factory _BudgetFilter({int min, int max}) = _$_BudgetFilter;

  factory _BudgetFilter.fromJson(Map<String, dynamic> json) =
      _$_BudgetFilter.fromJson;

  @override
  int get min;
  @override
  int get max;
  @override
  _$BudgetFilterCopyWith<_BudgetFilter> get copyWith;
}
