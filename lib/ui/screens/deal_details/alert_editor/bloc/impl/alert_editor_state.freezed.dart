// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alert_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DealDetailsAlertEditorStateTearOff {
  const _$DealDetailsAlertEditorStateTearOff();

// ignore: unused_element
  _Result call(Filters filters) {
    return _Result(
      filters,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DealDetailsAlertEditorState = _$DealDetailsAlertEditorStateTearOff();

/// @nodoc
mixin _$DealDetailsAlertEditorState {
  Filters get filters;

  $DealDetailsAlertEditorStateCopyWith<DealDetailsAlertEditorState>
      get copyWith;
}

/// @nodoc
abstract class $DealDetailsAlertEditorStateCopyWith<$Res> {
  factory $DealDetailsAlertEditorStateCopyWith(
          DealDetailsAlertEditorState value,
          $Res Function(DealDetailsAlertEditorState) then) =
      _$DealDetailsAlertEditorStateCopyWithImpl<$Res>;
  $Res call({Filters filters});

  $FiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$DealDetailsAlertEditorStateCopyWithImpl<$Res>
    implements $DealDetailsAlertEditorStateCopyWith<$Res> {
  _$DealDetailsAlertEditorStateCopyWithImpl(this._value, this._then);

  final DealDetailsAlertEditorState _value;
  // ignore: unused_field
  final $Res Function(DealDetailsAlertEditorState) _then;

  @override
  $Res call({
    Object filters = freezed,
  }) {
    return _then(_value.copyWith(
      filters: filters == freezed ? _value.filters : filters as Filters,
    ));
  }

  @override
  $FiltersCopyWith<$Res> get filters {
    if (_value.filters == null) {
      return null;
    }
    return $FiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc
abstract class _$ResultCopyWith<$Res>
    implements $DealDetailsAlertEditorStateCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) then) =
      __$ResultCopyWithImpl<$Res>;
  @override
  $Res call({Filters filters});

  @override
  $FiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$ResultCopyWithImpl<$Res>
    extends _$DealDetailsAlertEditorStateCopyWithImpl<$Res>
    implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(_Result _value, $Res Function(_Result) _then)
      : super(_value, (v) => _then(v as _Result));

  @override
  _Result get _value => super._value as _Result;

  @override
  $Res call({
    Object filters = freezed,
  }) {
    return _then(_Result(
      filters == freezed ? _value.filters : filters as Filters,
    ));
  }
}

/// @nodoc
class _$_Result implements _Result {
  _$_Result(this.filters) : assert(filters != null);

  @override
  final Filters filters;

  @override
  String toString() {
    return 'DealDetailsAlertEditorState(filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Result &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filters);

  @override
  _$ResultCopyWith<_Result> get copyWith =>
      __$ResultCopyWithImpl<_Result>(this, _$identity);
}

abstract class _Result implements DealDetailsAlertEditorState {
  factory _Result(Filters filters) = _$_Result;

  @override
  Filters get filters;
  @override
  _$ResultCopyWith<_Result> get copyWith;
}
