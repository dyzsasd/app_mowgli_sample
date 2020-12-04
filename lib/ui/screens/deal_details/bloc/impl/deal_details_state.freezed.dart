// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deal_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DealDetailsStateTearOff {
  const _$DealDetailsStateTearOff();

// ignore: unused_element
  DealDetailsStateData call(DealDetailsContent data, {Filters filters}) {
    return DealDetailsStateData(
      data,
      filters: filters,
    );
  }

// ignore: unused_element
  _Loading loading() {
    return _Loading();
  }

// ignore: unused_element
  _Error error() {
    return _Error();
  }
}

/// @nodoc
// ignore: unused_element
const $DealDetailsState = _$DealDetailsStateTearOff();

/// @nodoc
mixin _$DealDetailsState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    @required Result loading(),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $DealDetailsStateCopyWith<$Res> {
  factory $DealDetailsStateCopyWith(
          DealDetailsState value, $Res Function(DealDetailsState) then) =
      _$DealDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DealDetailsStateCopyWithImpl<$Res>
    implements $DealDetailsStateCopyWith<$Res> {
  _$DealDetailsStateCopyWithImpl(this._value, this._then);

  final DealDetailsState _value;
  // ignore: unused_field
  final $Res Function(DealDetailsState) _then;
}

/// @nodoc
abstract class $DealDetailsStateDataCopyWith<$Res> {
  factory $DealDetailsStateDataCopyWith(DealDetailsStateData value,
          $Res Function(DealDetailsStateData) then) =
      _$DealDetailsStateDataCopyWithImpl<$Res>;
  $Res call({DealDetailsContent data, Filters filters});

  $FiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$DealDetailsStateDataCopyWithImpl<$Res>
    extends _$DealDetailsStateCopyWithImpl<$Res>
    implements $DealDetailsStateDataCopyWith<$Res> {
  _$DealDetailsStateDataCopyWithImpl(
      DealDetailsStateData _value, $Res Function(DealDetailsStateData) _then)
      : super(_value, (v) => _then(v as DealDetailsStateData));

  @override
  DealDetailsStateData get _value => super._value as DealDetailsStateData;

  @override
  $Res call({
    Object data = freezed,
    Object filters = freezed,
  }) {
    return _then(DealDetailsStateData(
      data == freezed ? _value.data : data as DealDetailsContent,
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
class _$DealDetailsStateData extends DealDetailsStateData {
  _$DealDetailsStateData(this.data, {this.filters})
      : assert(data != null),
        super._();

  @override
  final DealDetailsContent data;
  @override
  final Filters filters;

  @override
  String toString() {
    return 'DealDetailsState(data: $data, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DealDetailsStateData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(filters);

  @override
  $DealDetailsStateDataCopyWith<DealDetailsStateData> get copyWith =>
      _$DealDetailsStateDataCopyWithImpl<DealDetailsStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(data, filters);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(data, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class DealDetailsStateData extends DealDetailsState {
  DealDetailsStateData._() : super._();
  factory DealDetailsStateData(DealDetailsContent data, {Filters filters}) =
      _$DealDetailsStateData;

  DealDetailsContent get data;
  Filters get filters;
  $DealDetailsStateDataCopyWith<DealDetailsStateData> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$DealDetailsStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading extends _Loading {
  _$_Loading() : super._();

  @override
  String toString() {
    return 'DealDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends DealDetailsState {
  _Loading._() : super._();
  factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$DealDetailsStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error() : super._();

  @override
  String toString() {
    return 'DealDetailsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DealDetailsContent data, Filters filters), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(DealDetailsStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends DealDetailsState {
  _Error._() : super._();
  factory _Error() = _$_Error;
}
