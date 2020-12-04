// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alerts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AlertsStateTearOff {
  const _$AlertsStateTearOff();

// ignore: unused_element
  AlertsStateData call(SubscriptionItems subscriptions) {
    return AlertsStateData(
      subscriptions,
    );
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _Error error() {
    return const _Error();
  }
}

/// @nodoc
// ignore: unused_element
const $AlertsState = _$AlertsStateTearOff();

/// @nodoc
mixin _$AlertsState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SubscriptionItems subscriptions), {
    @required Result loading(),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SubscriptionItems subscriptions), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AlertsStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(AlertsStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AlertsStateCopyWith<$Res> {
  factory $AlertsStateCopyWith(
          AlertsState value, $Res Function(AlertsState) then) =
      _$AlertsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlertsStateCopyWithImpl<$Res> implements $AlertsStateCopyWith<$Res> {
  _$AlertsStateCopyWithImpl(this._value, this._then);

  final AlertsState _value;
  // ignore: unused_field
  final $Res Function(AlertsState) _then;
}

/// @nodoc
abstract class $AlertsStateDataCopyWith<$Res> {
  factory $AlertsStateDataCopyWith(
          AlertsStateData value, $Res Function(AlertsStateData) then) =
      _$AlertsStateDataCopyWithImpl<$Res>;
  $Res call({SubscriptionItems subscriptions});
}

/// @nodoc
class _$AlertsStateDataCopyWithImpl<$Res>
    extends _$AlertsStateCopyWithImpl<$Res>
    implements $AlertsStateDataCopyWith<$Res> {
  _$AlertsStateDataCopyWithImpl(
      AlertsStateData _value, $Res Function(AlertsStateData) _then)
      : super(_value, (v) => _then(v as AlertsStateData));

  @override
  AlertsStateData get _value => super._value as AlertsStateData;

  @override
  $Res call({
    Object subscriptions = freezed,
  }) {
    return _then(AlertsStateData(
      subscriptions == freezed
          ? _value.subscriptions
          : subscriptions as SubscriptionItems,
    ));
  }
}

/// @nodoc
class _$AlertsStateData extends AlertsStateData {
  _$AlertsStateData(this.subscriptions)
      : assert(subscriptions != null),
        super._();

  @override
  final SubscriptionItems subscriptions;

  @override
  String toString() {
    return 'AlertsState(subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AlertsStateData &&
            (identical(other.subscriptions, subscriptions) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptions, subscriptions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subscriptions);

  @override
  $AlertsStateDataCopyWith<AlertsStateData> get copyWith =>
      _$AlertsStateDataCopyWithImpl<AlertsStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SubscriptionItems subscriptions), {
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(subscriptions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SubscriptionItems subscriptions), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(subscriptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AlertsStateData value), {
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
    Result $default(AlertsStateData value), {
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

abstract class AlertsStateData extends AlertsState {
  AlertsStateData._() : super._();
  factory AlertsStateData(SubscriptionItems subscriptions) = _$AlertsStateData;

  SubscriptionItems get subscriptions;
  $AlertsStateDataCopyWith<AlertsStateData> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$AlertsStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'AlertsState.loading()';
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
    Result $default(SubscriptionItems subscriptions), {
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
    Result $default(SubscriptionItems subscriptions), {
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
    Result $default(AlertsStateData value), {
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
    Result $default(AlertsStateData value), {
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

abstract class _Loading extends AlertsState {
  const _Loading._() : super._();
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$AlertsStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc
class _$_Error extends _Error {
  const _$_Error() : super._();

  @override
  String toString() {
    return 'AlertsState.error()';
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
    Result $default(SubscriptionItems subscriptions), {
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
    Result $default(SubscriptionItems subscriptions), {
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
    Result $default(AlertsStateData value), {
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
    Result $default(AlertsStateData value), {
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

abstract class _Error extends AlertsState {
  const _Error._() : super._();
  const factory _Error() = _$_Error;
}
