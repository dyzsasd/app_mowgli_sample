// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alerts_subscriptions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AlertsSubscriptionsStateTearOff {
  const _$AlertsSubscriptionsStateTearOff();

// ignore: unused_element
  _Subscriptions call(Iterable<AlertSubscription> subscriptions) {
    return _Subscriptions(
      subscriptions,
    );
  }

// ignore: unused_element
  _Empty empty() {
    return _Empty();
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

// ignore: unused_element
const $AlertsSubscriptionsState = _$AlertsSubscriptionsStateTearOff();

mixin _$AlertsSubscriptionsState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    @required Result empty(),
    @required Result loading(),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    Result empty(),
    Result loading(),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Subscriptions value), {
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

abstract class $AlertsSubscriptionsStateCopyWith<$Res> {
  factory $AlertsSubscriptionsStateCopyWith(AlertsSubscriptionsState value,
          $Res Function(AlertsSubscriptionsState) then) =
      _$AlertsSubscriptionsStateCopyWithImpl<$Res>;
}

class _$AlertsSubscriptionsStateCopyWithImpl<$Res>
    implements $AlertsSubscriptionsStateCopyWith<$Res> {
  _$AlertsSubscriptionsStateCopyWithImpl(this._value, this._then);

  final AlertsSubscriptionsState _value;
  // ignore: unused_field
  final $Res Function(AlertsSubscriptionsState) _then;
}

abstract class _$SubscriptionsCopyWith<$Res> {
  factory _$SubscriptionsCopyWith(
          _Subscriptions value, $Res Function(_Subscriptions) then) =
      __$SubscriptionsCopyWithImpl<$Res>;
  $Res call({Iterable<AlertSubscription> subscriptions});
}

class __$SubscriptionsCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsStateCopyWithImpl<$Res>
    implements _$SubscriptionsCopyWith<$Res> {
  __$SubscriptionsCopyWithImpl(
      _Subscriptions _value, $Res Function(_Subscriptions) _then)
      : super(_value, (v) => _then(v as _Subscriptions));

  @override
  _Subscriptions get _value => super._value as _Subscriptions;

  @override
  $Res call({
    Object subscriptions = freezed,
  }) {
    return _then(_Subscriptions(
      subscriptions == freezed
          ? _value.subscriptions
          : subscriptions as Iterable<AlertSubscription>,
    ));
  }
}

class _$_Subscriptions implements _Subscriptions {
  _$_Subscriptions(this.subscriptions) : assert(subscriptions != null);

  @override
  final Iterable<AlertSubscription> subscriptions;

  @override
  String toString() {
    return 'AlertsSubscriptionsState(subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Subscriptions &&
            (identical(other.subscriptions, subscriptions) ||
                const DeepCollectionEquality()
                    .equals(other.subscriptions, subscriptions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subscriptions);

  @override
  _$SubscriptionsCopyWith<_Subscriptions> get copyWith =>
      __$SubscriptionsCopyWithImpl<_Subscriptions>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    @required Result empty(),
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return $default(subscriptions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    Result empty(),
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
    Result $default(_Subscriptions value), {
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Subscriptions value), {
    Result empty(_Empty value),
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

abstract class _Subscriptions implements AlertsSubscriptionsState {
  factory _Subscriptions(Iterable<AlertSubscription> subscriptions) =
      _$_Subscriptions;

  Iterable<AlertSubscription> get subscriptions;
  _$SubscriptionsCopyWith<_Subscriptions> get copyWith;
}

abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
}

class __$EmptyCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;
}

class _$_Empty implements _Empty {
  _$_Empty();

  @override
  String toString() {
    return 'AlertsSubscriptionsState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    @required Result empty(),
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    Result empty(),
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Subscriptions value), {
    Result empty(_Empty value),
    Result loading(_Loading value),
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

abstract class _Empty implements AlertsSubscriptionsState {
  factory _Empty() = _$_Empty;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

class __$LoadingCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

class _$_Loading implements _Loading {
  _$_Loading();

  @override
  String toString() {
    return 'AlertsSubscriptionsState.loading()';
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
    Result $default(Iterable<AlertSubscription> subscriptions), {
    @required Result empty(),
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    Result empty(),
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
    Result $default(_Subscriptions value), {
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Subscriptions value), {
    Result empty(_Empty value),
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

abstract class _Loading implements AlertsSubscriptionsState {
  factory _Loading() = _$_Loading;
}

abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

class __$ErrorCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

class _$_Error implements _Error {
  _$_Error();

  @override
  String toString() {
    return 'AlertsSubscriptionsState.error()';
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
    Result $default(Iterable<AlertSubscription> subscriptions), {
    @required Result empty(),
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Iterable<AlertSubscription> subscriptions), {
    Result empty(),
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
    Result $default(_Subscriptions value), {
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Subscriptions value), {
    Result empty(_Empty value),
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

abstract class _Error implements AlertsSubscriptionsState {
  factory _Error() = _$_Error;
}
