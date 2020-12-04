// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RequestDate _$RequestDateFromJson(Map<String, dynamic> json) {
  return _RequestDate.fromJson(json);
}

/// @nodoc
class _$RequestDateTearOff {
  const _$RequestDateTearOff();

// ignore: unused_element
  _RequestDate call(
      {@nullable DateTime date,
      @nullable DateTime flexibleDatesMin,
      @nullable DateTime flexibleDatesMax,
      bool flexibleFixedDates = true}) {
    return _RequestDate(
      date: date,
      flexibleDatesMin: flexibleDatesMin,
      flexibleDatesMax: flexibleDatesMax,
      flexibleFixedDates: flexibleFixedDates,
    );
  }

// ignore: unused_element
  RequestDate fromJson(Map<String, Object> json) {
    return RequestDate.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RequestDate = _$RequestDateTearOff();

/// @nodoc
mixin _$RequestDate {
  @nullable
  DateTime get date;
  @nullable
  DateTime get flexibleDatesMin;
  @nullable
  DateTime get flexibleDatesMax;
  bool get flexibleFixedDates;

  Map<String, dynamic> toJson();
  $RequestDateCopyWith<RequestDate> get copyWith;
}

/// @nodoc
abstract class $RequestDateCopyWith<$Res> {
  factory $RequestDateCopyWith(
          RequestDate value, $Res Function(RequestDate) then) =
      _$RequestDateCopyWithImpl<$Res>;
  $Res call(
      {@nullable DateTime date,
      @nullable DateTime flexibleDatesMin,
      @nullable DateTime flexibleDatesMax,
      bool flexibleFixedDates});
}

/// @nodoc
class _$RequestDateCopyWithImpl<$Res> implements $RequestDateCopyWith<$Res> {
  _$RequestDateCopyWithImpl(this._value, this._then);

  final RequestDate _value;
  // ignore: unused_field
  final $Res Function(RequestDate) _then;

  @override
  $Res call({
    Object date = freezed,
    Object flexibleDatesMin = freezed,
    Object flexibleDatesMax = freezed,
    Object flexibleFixedDates = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed ? _value.date : date as DateTime,
      flexibleDatesMin: flexibleDatesMin == freezed
          ? _value.flexibleDatesMin
          : flexibleDatesMin as DateTime,
      flexibleDatesMax: flexibleDatesMax == freezed
          ? _value.flexibleDatesMax
          : flexibleDatesMax as DateTime,
      flexibleFixedDates: flexibleFixedDates == freezed
          ? _value.flexibleFixedDates
          : flexibleFixedDates as bool,
    ));
  }
}

/// @nodoc
abstract class _$RequestDateCopyWith<$Res>
    implements $RequestDateCopyWith<$Res> {
  factory _$RequestDateCopyWith(
          _RequestDate value, $Res Function(_RequestDate) then) =
      __$RequestDateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable DateTime date,
      @nullable DateTime flexibleDatesMin,
      @nullable DateTime flexibleDatesMax,
      bool flexibleFixedDates});
}

/// @nodoc
class __$RequestDateCopyWithImpl<$Res> extends _$RequestDateCopyWithImpl<$Res>
    implements _$RequestDateCopyWith<$Res> {
  __$RequestDateCopyWithImpl(
      _RequestDate _value, $Res Function(_RequestDate) _then)
      : super(_value, (v) => _then(v as _RequestDate));

  @override
  _RequestDate get _value => super._value as _RequestDate;

  @override
  $Res call({
    Object date = freezed,
    Object flexibleDatesMin = freezed,
    Object flexibleDatesMax = freezed,
    Object flexibleFixedDates = freezed,
  }) {
    return _then(_RequestDate(
      date: date == freezed ? _value.date : date as DateTime,
      flexibleDatesMin: flexibleDatesMin == freezed
          ? _value.flexibleDatesMin
          : flexibleDatesMin as DateTime,
      flexibleDatesMax: flexibleDatesMax == freezed
          ? _value.flexibleDatesMax
          : flexibleDatesMax as DateTime,
      flexibleFixedDates: flexibleFixedDates == freezed
          ? _value.flexibleFixedDates
          : flexibleFixedDates as bool,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_RequestDate extends _RequestDate {
  _$_RequestDate(
      {@nullable this.date,
      @nullable this.flexibleDatesMin,
      @nullable this.flexibleDatesMax,
      this.flexibleFixedDates = true})
      : assert(flexibleFixedDates != null),
        super._();

  factory _$_RequestDate.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestDateFromJson(json);

  @override
  @nullable
  final DateTime date;
  @override
  @nullable
  final DateTime flexibleDatesMin;
  @override
  @nullable
  final DateTime flexibleDatesMax;
  @JsonKey(defaultValue: true)
  @override
  final bool flexibleFixedDates;

  @override
  String toString() {
    return 'RequestDate(date: $date, flexibleDatesMin: $flexibleDatesMin, flexibleDatesMax: $flexibleDatesMax, flexibleFixedDates: $flexibleFixedDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestDate &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.flexibleDatesMin, flexibleDatesMin) ||
                const DeepCollectionEquality()
                    .equals(other.flexibleDatesMin, flexibleDatesMin)) &&
            (identical(other.flexibleDatesMax, flexibleDatesMax) ||
                const DeepCollectionEquality()
                    .equals(other.flexibleDatesMax, flexibleDatesMax)) &&
            (identical(other.flexibleFixedDates, flexibleFixedDates) ||
                const DeepCollectionEquality()
                    .equals(other.flexibleFixedDates, flexibleFixedDates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(flexibleDatesMin) ^
      const DeepCollectionEquality().hash(flexibleDatesMax) ^
      const DeepCollectionEquality().hash(flexibleFixedDates);

  @override
  _$RequestDateCopyWith<_RequestDate> get copyWith =>
      __$RequestDateCopyWithImpl<_RequestDate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestDateToJson(this);
  }
}

abstract class _RequestDate extends RequestDate {
  _RequestDate._() : super._();
  factory _RequestDate(
      {@nullable DateTime date,
      @nullable DateTime flexibleDatesMin,
      @nullable DateTime flexibleDatesMax,
      bool flexibleFixedDates}) = _$_RequestDate;

  factory _RequestDate.fromJson(Map<String, dynamic> json) =
      _$_RequestDate.fromJson;

  @override
  @nullable
  DateTime get date;
  @override
  @nullable
  DateTime get flexibleDatesMin;
  @override
  @nullable
  DateTime get flexibleDatesMax;
  @override
  bool get flexibleFixedDates;
  @override
  _$RequestDateCopyWith<_RequestDate> get copyWith;
}
