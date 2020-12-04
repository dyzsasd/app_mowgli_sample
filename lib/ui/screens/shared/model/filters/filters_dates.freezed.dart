// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_dates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DatesFilter _$DatesFilterFromJson(Map<String, dynamic> json) {
  return _DatesFilter.fromJson(json);
}

/// @nodoc
class _$DatesFilterTearOff {
  const _$DatesFilterTearOff();

// ignore: unused_element
  _DatesFilter call(
      {FixedDatesFilter fixedDates, FlexibleDatesFilter flexibleDates}) {
    return _DatesFilter(
      fixedDates: fixedDates,
      flexibleDates: flexibleDates,
    );
  }

// ignore: unused_element
  DatesFilter fromJson(Map<String, Object> json) {
    return DatesFilter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DatesFilter = _$DatesFilterTearOff();

/// @nodoc
mixin _$DatesFilter {
  FixedDatesFilter get fixedDates;
  FlexibleDatesFilter get flexibleDates;

  Map<String, dynamic> toJson();
  $DatesFilterCopyWith<DatesFilter> get copyWith;
}

/// @nodoc
abstract class $DatesFilterCopyWith<$Res> {
  factory $DatesFilterCopyWith(
          DatesFilter value, $Res Function(DatesFilter) then) =
      _$DatesFilterCopyWithImpl<$Res>;
  $Res call({FixedDatesFilter fixedDates, FlexibleDatesFilter flexibleDates});

  $FixedDatesFilterCopyWith<$Res> get fixedDates;
  $FlexibleDatesFilterCopyWith<$Res> get flexibleDates;
}

/// @nodoc
class _$DatesFilterCopyWithImpl<$Res> implements $DatesFilterCopyWith<$Res> {
  _$DatesFilterCopyWithImpl(this._value, this._then);

  final DatesFilter _value;
  // ignore: unused_field
  final $Res Function(DatesFilter) _then;

  @override
  $Res call({
    Object fixedDates = freezed,
    Object flexibleDates = freezed,
  }) {
    return _then(_value.copyWith(
      fixedDates: fixedDates == freezed
          ? _value.fixedDates
          : fixedDates as FixedDatesFilter,
      flexibleDates: flexibleDates == freezed
          ? _value.flexibleDates
          : flexibleDates as FlexibleDatesFilter,
    ));
  }

  @override
  $FixedDatesFilterCopyWith<$Res> get fixedDates {
    if (_value.fixedDates == null) {
      return null;
    }
    return $FixedDatesFilterCopyWith<$Res>(_value.fixedDates, (value) {
      return _then(_value.copyWith(fixedDates: value));
    });
  }

  @override
  $FlexibleDatesFilterCopyWith<$Res> get flexibleDates {
    if (_value.flexibleDates == null) {
      return null;
    }
    return $FlexibleDatesFilterCopyWith<$Res>(_value.flexibleDates, (value) {
      return _then(_value.copyWith(flexibleDates: value));
    });
  }
}

/// @nodoc
abstract class _$DatesFilterCopyWith<$Res>
    implements $DatesFilterCopyWith<$Res> {
  factory _$DatesFilterCopyWith(
          _DatesFilter value, $Res Function(_DatesFilter) then) =
      __$DatesFilterCopyWithImpl<$Res>;
  @override
  $Res call({FixedDatesFilter fixedDates, FlexibleDatesFilter flexibleDates});

  @override
  $FixedDatesFilterCopyWith<$Res> get fixedDates;
  @override
  $FlexibleDatesFilterCopyWith<$Res> get flexibleDates;
}

/// @nodoc
class __$DatesFilterCopyWithImpl<$Res> extends _$DatesFilterCopyWithImpl<$Res>
    implements _$DatesFilterCopyWith<$Res> {
  __$DatesFilterCopyWithImpl(
      _DatesFilter _value, $Res Function(_DatesFilter) _then)
      : super(_value, (v) => _then(v as _DatesFilter));

  @override
  _DatesFilter get _value => super._value as _DatesFilter;

  @override
  $Res call({
    Object fixedDates = freezed,
    Object flexibleDates = freezed,
  }) {
    return _then(_DatesFilter(
      fixedDates: fixedDates == freezed
          ? _value.fixedDates
          : fixedDates as FixedDatesFilter,
      flexibleDates: flexibleDates == freezed
          ? _value.flexibleDates
          : flexibleDates as FlexibleDatesFilter,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_DatesFilter extends _DatesFilter {
  _$_DatesFilter({this.fixedDates, this.flexibleDates}) : super._();

  factory _$_DatesFilter.fromJson(Map<String, dynamic> json) =>
      _$_$_DatesFilterFromJson(json);

  @override
  final FixedDatesFilter fixedDates;
  @override
  final FlexibleDatesFilter flexibleDates;

  @override
  String toString() {
    return 'DatesFilter(fixedDates: $fixedDates, flexibleDates: $flexibleDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DatesFilter &&
            (identical(other.fixedDates, fixedDates) ||
                const DeepCollectionEquality()
                    .equals(other.fixedDates, fixedDates)) &&
            (identical(other.flexibleDates, flexibleDates) ||
                const DeepCollectionEquality()
                    .equals(other.flexibleDates, flexibleDates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fixedDates) ^
      const DeepCollectionEquality().hash(flexibleDates);

  @override
  _$DatesFilterCopyWith<_DatesFilter> get copyWith =>
      __$DatesFilterCopyWithImpl<_DatesFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DatesFilterToJson(this);
  }
}

abstract class _DatesFilter extends DatesFilter {
  _DatesFilter._() : super._();
  factory _DatesFilter(
      {FixedDatesFilter fixedDates,
      FlexibleDatesFilter flexibleDates}) = _$_DatesFilter;

  factory _DatesFilter.fromJson(Map<String, dynamic> json) =
      _$_DatesFilter.fromJson;

  @override
  FixedDatesFilter get fixedDates;
  @override
  FlexibleDatesFilter get flexibleDates;
  @override
  _$DatesFilterCopyWith<_DatesFilter> get copyWith;
}

FixedDatesFilter _$FixedDatesFilterFromJson(Map<String, dynamic> json) {
  return _FixedDatesFilter.fromJson(json);
}

/// @nodoc
class _$FixedDatesFilterTearOff {
  const _$FixedDatesFilterTearOff();

// ignore: unused_element
  _FixedDatesFilter call(
      {DateTime fromDate, DateTime toDate, bool flexible = true}) {
    return _FixedDatesFilter(
      fromDate: fromDate,
      toDate: toDate,
      flexible: flexible,
    );
  }

// ignore: unused_element
  FixedDatesFilter fromJson(Map<String, Object> json) {
    return FixedDatesFilter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FixedDatesFilter = _$FixedDatesFilterTearOff();

/// @nodoc
mixin _$FixedDatesFilter {
  DateTime get fromDate;
  DateTime get toDate;
  bool get flexible;

  Map<String, dynamic> toJson();
  $FixedDatesFilterCopyWith<FixedDatesFilter> get copyWith;
}

/// @nodoc
abstract class $FixedDatesFilterCopyWith<$Res> {
  factory $FixedDatesFilterCopyWith(
          FixedDatesFilter value, $Res Function(FixedDatesFilter) then) =
      _$FixedDatesFilterCopyWithImpl<$Res>;
  $Res call({DateTime fromDate, DateTime toDate, bool flexible});
}

/// @nodoc
class _$FixedDatesFilterCopyWithImpl<$Res>
    implements $FixedDatesFilterCopyWith<$Res> {
  _$FixedDatesFilterCopyWithImpl(this._value, this._then);

  final FixedDatesFilter _value;
  // ignore: unused_field
  final $Res Function(FixedDatesFilter) _then;

  @override
  $Res call({
    Object fromDate = freezed,
    Object toDate = freezed,
    Object flexible = freezed,
  }) {
    return _then(_value.copyWith(
      fromDate: fromDate == freezed ? _value.fromDate : fromDate as DateTime,
      toDate: toDate == freezed ? _value.toDate : toDate as DateTime,
      flexible: flexible == freezed ? _value.flexible : flexible as bool,
    ));
  }
}

/// @nodoc
abstract class _$FixedDatesFilterCopyWith<$Res>
    implements $FixedDatesFilterCopyWith<$Res> {
  factory _$FixedDatesFilterCopyWith(
          _FixedDatesFilter value, $Res Function(_FixedDatesFilter) then) =
      __$FixedDatesFilterCopyWithImpl<$Res>;
  @override
  $Res call({DateTime fromDate, DateTime toDate, bool flexible});
}

/// @nodoc
class __$FixedDatesFilterCopyWithImpl<$Res>
    extends _$FixedDatesFilterCopyWithImpl<$Res>
    implements _$FixedDatesFilterCopyWith<$Res> {
  __$FixedDatesFilterCopyWithImpl(
      _FixedDatesFilter _value, $Res Function(_FixedDatesFilter) _then)
      : super(_value, (v) => _then(v as _FixedDatesFilter));

  @override
  _FixedDatesFilter get _value => super._value as _FixedDatesFilter;

  @override
  $Res call({
    Object fromDate = freezed,
    Object toDate = freezed,
    Object flexible = freezed,
  }) {
    return _then(_FixedDatesFilter(
      fromDate: fromDate == freezed ? _value.fromDate : fromDate as DateTime,
      toDate: toDate == freezed ? _value.toDate : toDate as DateTime,
      flexible: flexible == freezed ? _value.flexible : flexible as bool,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_FixedDatesFilter extends _FixedDatesFilter {
  _$_FixedDatesFilter({this.fromDate, this.toDate, this.flexible = true})
      : assert(flexible != null),
        super._();

  factory _$_FixedDatesFilter.fromJson(Map<String, dynamic> json) =>
      _$_$_FixedDatesFilterFromJson(json);

  @override
  final DateTime fromDate;
  @override
  final DateTime toDate;
  @JsonKey(defaultValue: true)
  @override
  final bool flexible;

  @override
  String toString() {
    return 'FixedDatesFilter(fromDate: $fromDate, toDate: $toDate, flexible: $flexible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FixedDatesFilter &&
            (identical(other.fromDate, fromDate) ||
                const DeepCollectionEquality()
                    .equals(other.fromDate, fromDate)) &&
            (identical(other.toDate, toDate) ||
                const DeepCollectionEquality().equals(other.toDate, toDate)) &&
            (identical(other.flexible, flexible) ||
                const DeepCollectionEquality()
                    .equals(other.flexible, flexible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fromDate) ^
      const DeepCollectionEquality().hash(toDate) ^
      const DeepCollectionEquality().hash(flexible);

  @override
  _$FixedDatesFilterCopyWith<_FixedDatesFilter> get copyWith =>
      __$FixedDatesFilterCopyWithImpl<_FixedDatesFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FixedDatesFilterToJson(this);
  }
}

abstract class _FixedDatesFilter extends FixedDatesFilter {
  _FixedDatesFilter._() : super._();
  factory _FixedDatesFilter(
      {DateTime fromDate,
      DateTime toDate,
      bool flexible}) = _$_FixedDatesFilter;

  factory _FixedDatesFilter.fromJson(Map<String, dynamic> json) =
      _$_FixedDatesFilter.fromJson;

  @override
  DateTime get fromDate;
  @override
  DateTime get toDate;
  @override
  bool get flexible;
  @override
  _$FixedDatesFilterCopyWith<_FixedDatesFilter> get copyWith;
}

FlexibleDatesFilter _$FlexibleDatesFilterFromJson(Map<String, dynamic> json) {
  return _FlexibleDatesFilter.fromJson(json);
}

/// @nodoc
class _$FlexibleDatesFilterTearOff {
  const _$FlexibleDatesFilterTearOff();

// ignore: unused_element
  _FlexibleDatesFilter call(
      {DateTime fromDate, DateTime toDate, int minDuration, int maxDuration}) {
    return _FlexibleDatesFilter(
      fromDate: fromDate,
      toDate: toDate,
      minDuration: minDuration,
      maxDuration: maxDuration,
    );
  }

// ignore: unused_element
  FlexibleDatesFilter fromJson(Map<String, Object> json) {
    return FlexibleDatesFilter.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FlexibleDatesFilter = _$FlexibleDatesFilterTearOff();

/// @nodoc
mixin _$FlexibleDatesFilter {
  DateTime get fromDate;
  DateTime get toDate;
  int get minDuration;
  int get maxDuration;

  Map<String, dynamic> toJson();
  $FlexibleDatesFilterCopyWith<FlexibleDatesFilter> get copyWith;
}

/// @nodoc
abstract class $FlexibleDatesFilterCopyWith<$Res> {
  factory $FlexibleDatesFilterCopyWith(
          FlexibleDatesFilter value, $Res Function(FlexibleDatesFilter) then) =
      _$FlexibleDatesFilterCopyWithImpl<$Res>;
  $Res call(
      {DateTime fromDate, DateTime toDate, int minDuration, int maxDuration});
}

/// @nodoc
class _$FlexibleDatesFilterCopyWithImpl<$Res>
    implements $FlexibleDatesFilterCopyWith<$Res> {
  _$FlexibleDatesFilterCopyWithImpl(this._value, this._then);

  final FlexibleDatesFilter _value;
  // ignore: unused_field
  final $Res Function(FlexibleDatesFilter) _then;

  @override
  $Res call({
    Object fromDate = freezed,
    Object toDate = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
  }) {
    return _then(_value.copyWith(
      fromDate: fromDate == freezed ? _value.fromDate : fromDate as DateTime,
      toDate: toDate == freezed ? _value.toDate : toDate as DateTime,
      minDuration:
          minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration:
          maxDuration == freezed ? _value.maxDuration : maxDuration as int,
    ));
  }
}

/// @nodoc
abstract class _$FlexibleDatesFilterCopyWith<$Res>
    implements $FlexibleDatesFilterCopyWith<$Res> {
  factory _$FlexibleDatesFilterCopyWith(_FlexibleDatesFilter value,
          $Res Function(_FlexibleDatesFilter) then) =
      __$FlexibleDatesFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime fromDate, DateTime toDate, int minDuration, int maxDuration});
}

/// @nodoc
class __$FlexibleDatesFilterCopyWithImpl<$Res>
    extends _$FlexibleDatesFilterCopyWithImpl<$Res>
    implements _$FlexibleDatesFilterCopyWith<$Res> {
  __$FlexibleDatesFilterCopyWithImpl(
      _FlexibleDatesFilter _value, $Res Function(_FlexibleDatesFilter) _then)
      : super(_value, (v) => _then(v as _FlexibleDatesFilter));

  @override
  _FlexibleDatesFilter get _value => super._value as _FlexibleDatesFilter;

  @override
  $Res call({
    Object fromDate = freezed,
    Object toDate = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
  }) {
    return _then(_FlexibleDatesFilter(
      fromDate: fromDate == freezed ? _value.fromDate : fromDate as DateTime,
      toDate: toDate == freezed ? _value.toDate : toDate as DateTime,
      minDuration:
          minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration:
          maxDuration == freezed ? _value.maxDuration : maxDuration as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_FlexibleDatesFilter extends _FlexibleDatesFilter {
  _$_FlexibleDatesFilter(
      {this.fromDate, this.toDate, this.minDuration, this.maxDuration})
      : super._();

  factory _$_FlexibleDatesFilter.fromJson(Map<String, dynamic> json) =>
      _$_$_FlexibleDatesFilterFromJson(json);

  @override
  final DateTime fromDate;
  @override
  final DateTime toDate;
  @override
  final int minDuration;
  @override
  final int maxDuration;

  @override
  String toString() {
    return 'FlexibleDatesFilter(fromDate: $fromDate, toDate: $toDate, minDuration: $minDuration, maxDuration: $maxDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlexibleDatesFilter &&
            (identical(other.fromDate, fromDate) ||
                const DeepCollectionEquality()
                    .equals(other.fromDate, fromDate)) &&
            (identical(other.toDate, toDate) ||
                const DeepCollectionEquality().equals(other.toDate, toDate)) &&
            (identical(other.minDuration, minDuration) ||
                const DeepCollectionEquality()
                    .equals(other.minDuration, minDuration)) &&
            (identical(other.maxDuration, maxDuration) ||
                const DeepCollectionEquality()
                    .equals(other.maxDuration, maxDuration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fromDate) ^
      const DeepCollectionEquality().hash(toDate) ^
      const DeepCollectionEquality().hash(minDuration) ^
      const DeepCollectionEquality().hash(maxDuration);

  @override
  _$FlexibleDatesFilterCopyWith<_FlexibleDatesFilter> get copyWith =>
      __$FlexibleDatesFilterCopyWithImpl<_FlexibleDatesFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FlexibleDatesFilterToJson(this);
  }
}

abstract class _FlexibleDatesFilter extends FlexibleDatesFilter {
  _FlexibleDatesFilter._() : super._();
  factory _FlexibleDatesFilter(
      {DateTime fromDate,
      DateTime toDate,
      int minDuration,
      int maxDuration}) = _$_FlexibleDatesFilter;

  factory _FlexibleDatesFilter.fromJson(Map<String, dynamic> json) =
      _$_FlexibleDatesFilter.fromJson;

  @override
  DateTime get fromDate;
  @override
  DateTime get toDate;
  @override
  int get minDuration;
  @override
  int get maxDuration;
  @override
  _$FlexibleDatesFilterCopyWith<_FlexibleDatesFilter> get copyWith;
}
