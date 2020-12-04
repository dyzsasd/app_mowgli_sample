// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_viewer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RequestViewerStateTearOff {
  const _$RequestViewerStateTearOff();

// ignore: unused_element
  RequestViewerStateData call(RequestDetailsContent data) {
    return RequestViewerStateData(
      data,
    );
  }

// ignore: unused_element
  _Loading loading(RequestDetailsContent data) {
    return _Loading(
      data,
    );
  }

// ignore: unused_element
  _Empty empty(RequestDetailsContent data) {
    return _Empty(
      data,
    );
  }

// ignore: unused_element
  _Error error(RequestDetailsContent data) {
    return _Error(
      data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RequestViewerState = _$RequestViewerStateTearOff();

/// @nodoc
mixin _$RequestViewerState {
  RequestDetailsContent get data;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    @required Result loading(RequestDetailsContent data),
    @required Result empty(RequestDetailsContent data),
    @required Result error(RequestDetailsContent data),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    Result loading(RequestDetailsContent data),
    Result empty(RequestDetailsContent data),
    Result error(RequestDetailsContent data),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
    Result error(_Error value),
    @required Result orElse(),
  });

  $RequestViewerStateCopyWith<RequestViewerState> get copyWith;
}

/// @nodoc
abstract class $RequestViewerStateCopyWith<$Res> {
  factory $RequestViewerStateCopyWith(
          RequestViewerState value, $Res Function(RequestViewerState) then) =
      _$RequestViewerStateCopyWithImpl<$Res>;
  $Res call({RequestDetailsContent data});
}

/// @nodoc
class _$RequestViewerStateCopyWithImpl<$Res>
    implements $RequestViewerStateCopyWith<$Res> {
  _$RequestViewerStateCopyWithImpl(this._value, this._then);

  final RequestViewerState _value;
  // ignore: unused_field
  final $Res Function(RequestViewerState) _then;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed ? _value.data : data as RequestDetailsContent,
    ));
  }
}

/// @nodoc
abstract class $RequestViewerStateDataCopyWith<$Res>
    implements $RequestViewerStateCopyWith<$Res> {
  factory $RequestViewerStateDataCopyWith(RequestViewerStateData value,
          $Res Function(RequestViewerStateData) then) =
      _$RequestViewerStateDataCopyWithImpl<$Res>;
  @override
  $Res call({RequestDetailsContent data});
}

/// @nodoc
class _$RequestViewerStateDataCopyWithImpl<$Res>
    extends _$RequestViewerStateCopyWithImpl<$Res>
    implements $RequestViewerStateDataCopyWith<$Res> {
  _$RequestViewerStateDataCopyWithImpl(RequestViewerStateData _value,
      $Res Function(RequestViewerStateData) _then)
      : super(_value, (v) => _then(v as RequestViewerStateData));

  @override
  RequestViewerStateData get _value => super._value as RequestViewerStateData;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(RequestViewerStateData(
      data == freezed ? _value.data : data as RequestDetailsContent,
    ));
  }
}

/// @nodoc
class _$RequestViewerStateData extends RequestViewerStateData {
  _$RequestViewerStateData(this.data)
      : assert(data != null),
        super._();

  @override
  final RequestDetailsContent data;

  @override
  String toString() {
    return 'RequestViewerState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestViewerStateData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $RequestViewerStateDataCopyWith<RequestViewerStateData> get copyWith =>
      _$RequestViewerStateDataCopyWithImpl<RequestViewerStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    @required Result loading(RequestDetailsContent data),
    @required Result empty(RequestDetailsContent data),
    @required Result error(RequestDetailsContent data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return $default(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    Result loading(RequestDetailsContent data),
    Result empty(RequestDetailsContent data),
    Result error(RequestDetailsContent data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class RequestViewerStateData extends RequestViewerState {
  RequestViewerStateData._() : super._();
  factory RequestViewerStateData(RequestDetailsContent data) =
      _$RequestViewerStateData;

  @override
  RequestDetailsContent get data;
  @override
  $RequestViewerStateDataCopyWith<RequestViewerStateData> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $RequestViewerStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({RequestDetailsContent data});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$RequestViewerStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_Loading(
      data == freezed ? _value.data : data as RequestDetailsContent,
    ));
  }
}

/// @nodoc
class _$_Loading extends _Loading {
  _$_Loading(this.data)
      : assert(data != null),
        super._();

  @override
  final RequestDetailsContent data;

  @override
  String toString() {
    return 'RequestViewerState.loading(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    @required Result loading(RequestDetailsContent data),
    @required Result empty(RequestDetailsContent data),
    @required Result error(RequestDetailsContent data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return loading(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    Result loading(RequestDetailsContent data),
    Result empty(RequestDetailsContent data),
    Result error(RequestDetailsContent data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class _Loading extends RequestViewerState {
  _Loading._() : super._();
  factory _Loading(RequestDetailsContent data) = _$_Loading;

  @override
  RequestDetailsContent get data;
  @override
  _$LoadingCopyWith<_Loading> get copyWith;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res>
    implements $RequestViewerStateCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
  @override
  $Res call({RequestDetailsContent data});
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$RequestViewerStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_Empty(
      data == freezed ? _value.data : data as RequestDetailsContent,
    ));
  }
}

/// @nodoc
class _$_Empty extends _Empty {
  _$_Empty(this.data)
      : assert(data != null),
        super._();

  @override
  final RequestDetailsContent data;

  @override
  String toString() {
    return 'RequestViewerState.empty(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Empty &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$EmptyCopyWith<_Empty> get copyWith =>
      __$EmptyCopyWithImpl<_Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    @required Result loading(RequestDetailsContent data),
    @required Result empty(RequestDetailsContent data),
    @required Result error(RequestDetailsContent data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return empty(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    Result loading(RequestDetailsContent data),
    Result empty(RequestDetailsContent data),
    Result error(RequestDetailsContent data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty extends RequestViewerState {
  _Empty._() : super._();
  factory _Empty(RequestDetailsContent data) = _$_Empty;

  @override
  RequestDetailsContent get data;
  @override
  _$EmptyCopyWith<_Empty> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $RequestViewerStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({RequestDetailsContent data});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$RequestViewerStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_Error(
      data == freezed ? _value.data : data as RequestDetailsContent,
    ));
  }
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error(this.data)
      : assert(data != null),
        super._();

  @override
  final RequestDetailsContent data;

  @override
  String toString() {
    return 'RequestViewerState.error(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    @required Result loading(RequestDetailsContent data),
    @required Result empty(RequestDetailsContent data),
    @required Result error(RequestDetailsContent data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return error(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDetailsContent data), {
    Result loading(RequestDetailsContent data),
    Result empty(RequestDetailsContent data),
    Result error(RequestDetailsContent data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(RequestViewerStateData value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class _Error extends RequestViewerState {
  _Error._() : super._();
  factory _Error(RequestDetailsContent data) = _$_Error;

  @override
  RequestDetailsContent get data;
  @override
  _$ErrorCopyWith<_Error> get copyWith;
}
