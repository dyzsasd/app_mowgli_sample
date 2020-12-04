// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationsStateTearOff {
  const _$NotificationsStateTearOff();

// ignore: unused_element
  _Result call(bool result) {
    return _Result(
      result,
    );
  }

// ignore: unused_element
  _Initial initial() {
    return _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return _Loading();
  }

// ignore: unused_element
  _Error error(NotificationsErrorType type) {
    return _Error(
      type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationsState = _$NotificationsStateTearOff();

/// @nodoc
mixin _$NotificationsState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool result), {
    @required Result initial(),
    @required Result loading(),
    @required Result error(NotificationsErrorType type),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool result), {
    Result initial(),
    Result loading(),
    Result error(NotificationsErrorType type),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Result value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Result value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  final NotificationsState _value;
  // ignore: unused_field
  final $Res Function(NotificationsState) _then;
}

/// @nodoc
abstract class _$ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) then) =
      __$ResultCopyWithImpl<$Res>;
  $Res call({bool result});
}

/// @nodoc
class __$ResultCopyWithImpl<$Res> extends _$NotificationsStateCopyWithImpl<$Res>
    implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(_Result _value, $Res Function(_Result) _then)
      : super(_value, (v) => _then(v as _Result));

  @override
  _Result get _value => super._value as _Result;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_Result(
      result == freezed ? _value.result : result as bool,
    ));
  }
}

/// @nodoc
class _$_Result extends _Result {
  _$_Result(this.result)
      : assert(result != null),
        super._();

  @override
  final bool result;

  @override
  String toString() {
    return 'NotificationsState(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Result &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  _$ResultCopyWith<_Result> get copyWith =>
      __$ResultCopyWithImpl<_Result>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool result), {
    @required Result initial(),
    @required Result loading(),
    @required Result error(NotificationsErrorType type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return $default(result);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool result), {
    Result initial(),
    Result loading(),
    Result error(NotificationsErrorType type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Result value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Result value), {
    Result initial(_Initial value),
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

abstract class _Result extends NotificationsState {
  _Result._() : super._();
  factory _Result(bool result) = _$_Result;

  bool get result;
  _$ResultCopyWith<_Result> get copyWith;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial extends _Initial {
  _$_Initial() : super._();

  @override
  String toString() {
    return 'NotificationsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool result), {
    @required Result initial(),
    @required Result loading(),
    @required Result error(NotificationsErrorType type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool result), {
    Result initial(),
    Result loading(),
    Result error(NotificationsErrorType type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Result value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Result value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends NotificationsState {
  _Initial._() : super._();
  factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res>
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
    return 'NotificationsState.loading()';
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
    Result $default(bool result), {
    @required Result initial(),
    @required Result loading(),
    @required Result error(NotificationsErrorType type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool result), {
    Result initial(),
    Result loading(),
    Result error(NotificationsErrorType type),
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
    Result $default(_Result value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Result value), {
    Result initial(_Initial value),
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

abstract class _Loading extends NotificationsState {
  _Loading._() : super._();
  factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({NotificationsErrorType type});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$NotificationsStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object type = freezed,
  }) {
    return _then(_Error(
      type == freezed ? _value.type : type as NotificationsErrorType,
    ));
  }
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error(this.type)
      : assert(type != null),
        super._();

  @override
  final NotificationsErrorType type;

  @override
  String toString() {
    return 'NotificationsState.error(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(bool result), {
    @required Result initial(),
    @required Result loading(),
    @required Result error(NotificationsErrorType type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return error(type);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(bool result), {
    Result initial(),
    Result loading(),
    Result error(NotificationsErrorType type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Result value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Result value), {
    Result initial(_Initial value),
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

abstract class _Error extends NotificationsState {
  _Error._() : super._();
  factory _Error(NotificationsErrorType type) = _$_Error;

  NotificationsErrorType get type;
  _$ErrorCopyWith<_Error> get copyWith;
}
