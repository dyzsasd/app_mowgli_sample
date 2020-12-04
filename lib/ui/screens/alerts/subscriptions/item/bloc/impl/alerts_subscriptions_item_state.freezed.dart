// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alerts_subscriptions_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AlertsSubscriptionsItemStateTearOff {
  const _$AlertsSubscriptionsItemStateTearOff();

// ignore: unused_element
  _Subscriptions call(AlertSubscription subscription) {
    return _Subscriptions(
      subscription,
    );
  }

// ignore: unused_element
  _Initial initial(AlertSubscription subscription) {
    return _Initial(
      subscription,
    );
  }

// ignore: unused_element
  _Loading loading(AlertSubscription subscription) {
    return _Loading(
      subscription,
    );
  }

// ignore: unused_element
  _Error error(
      AlertSubscription subscription, AlertsSubscriptionsItemStateError type) {
    return _Error(
      subscription,
      type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AlertsSubscriptionsItemState = _$AlertsSubscriptionsItemStateTearOff();

/// @nodoc
mixin _$AlertsSubscriptionsItemState {
  AlertSubscription get subscription;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    @required Result initial(AlertSubscription subscription),
    @required Result loading(AlertSubscription subscription),
    @required
        Result error(AlertSubscription subscription,
            AlertsSubscriptionsItemStateError type),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    Result initial(AlertSubscription subscription),
    Result loading(AlertSubscription subscription),
    Result error(
        AlertSubscription subscription, AlertsSubscriptionsItemStateError type),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Subscriptions value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });

  $AlertsSubscriptionsItemStateCopyWith<AlertsSubscriptionsItemState>
      get copyWith;
}

/// @nodoc
abstract class $AlertsSubscriptionsItemStateCopyWith<$Res> {
  factory $AlertsSubscriptionsItemStateCopyWith(
          AlertsSubscriptionsItemState value,
          $Res Function(AlertsSubscriptionsItemState) then) =
      _$AlertsSubscriptionsItemStateCopyWithImpl<$Res>;
  $Res call({AlertSubscription subscription});
}

/// @nodoc
class _$AlertsSubscriptionsItemStateCopyWithImpl<$Res>
    implements $AlertsSubscriptionsItemStateCopyWith<$Res> {
  _$AlertsSubscriptionsItemStateCopyWithImpl(this._value, this._then);

  final AlertsSubscriptionsItemState _value;
  // ignore: unused_field
  final $Res Function(AlertsSubscriptionsItemState) _then;

  @override
  $Res call({
    Object subscription = freezed,
  }) {
    return _then(_value.copyWith(
      subscription: subscription == freezed
          ? _value.subscription
          : subscription as AlertSubscription,
    ));
  }
}

/// @nodoc
abstract class _$SubscriptionsCopyWith<$Res>
    implements $AlertsSubscriptionsItemStateCopyWith<$Res> {
  factory _$SubscriptionsCopyWith(
          _Subscriptions value, $Res Function(_Subscriptions) then) =
      __$SubscriptionsCopyWithImpl<$Res>;
  @override
  $Res call({AlertSubscription subscription});
}

/// @nodoc
class __$SubscriptionsCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsItemStateCopyWithImpl<$Res>
    implements _$SubscriptionsCopyWith<$Res> {
  __$SubscriptionsCopyWithImpl(
      _Subscriptions _value, $Res Function(_Subscriptions) _then)
      : super(_value, (v) => _then(v as _Subscriptions));

  @override
  _Subscriptions get _value => super._value as _Subscriptions;

  @override
  $Res call({
    Object subscription = freezed,
  }) {
    return _then(_Subscriptions(
      subscription == freezed
          ? _value.subscription
          : subscription as AlertSubscription,
    ));
  }
}

/// @nodoc
class _$_Subscriptions extends _Subscriptions {
  _$_Subscriptions(this.subscription)
      : assert(subscription != null),
        super._();

  @override
  final AlertSubscription subscription;

  @override
  String toString() {
    return 'AlertsSubscriptionsItemState(subscription: $subscription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Subscriptions &&
            (identical(other.subscription, subscription) ||
                const DeepCollectionEquality()
                    .equals(other.subscription, subscription)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subscription);

  @override
  _$SubscriptionsCopyWith<_Subscriptions> get copyWith =>
      __$SubscriptionsCopyWithImpl<_Subscriptions>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    @required Result initial(AlertSubscription subscription),
    @required Result loading(AlertSubscription subscription),
    @required
        Result error(AlertSubscription subscription,
            AlertsSubscriptionsItemStateError type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return $default(subscription);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    Result initial(AlertSubscription subscription),
    Result loading(AlertSubscription subscription),
    Result error(
        AlertSubscription subscription, AlertsSubscriptionsItemStateError type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
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
    Result $default(_Subscriptions value), {
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

abstract class _Subscriptions extends AlertsSubscriptionsItemState {
  _Subscriptions._() : super._();
  factory _Subscriptions(AlertSubscription subscription) = _$_Subscriptions;

  @override
  AlertSubscription get subscription;
  @override
  _$SubscriptionsCopyWith<_Subscriptions> get copyWith;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $AlertsSubscriptionsItemStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({AlertSubscription subscription});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsItemStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object subscription = freezed,
  }) {
    return _then(_Initial(
      subscription == freezed
          ? _value.subscription
          : subscription as AlertSubscription,
    ));
  }
}

/// @nodoc
class _$_Initial extends _Initial {
  _$_Initial(this.subscription)
      : assert(subscription != null),
        super._();

  @override
  final AlertSubscription subscription;

  @override
  String toString() {
    return 'AlertsSubscriptionsItemState.initial(subscription: $subscription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.subscription, subscription) ||
                const DeepCollectionEquality()
                    .equals(other.subscription, subscription)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subscription);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    @required Result initial(AlertSubscription subscription),
    @required Result loading(AlertSubscription subscription),
    @required
        Result error(AlertSubscription subscription,
            AlertsSubscriptionsItemStateError type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return initial(subscription);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    Result initial(AlertSubscription subscription),
    Result loading(AlertSubscription subscription),
    Result error(
        AlertSubscription subscription, AlertsSubscriptionsItemStateError type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
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
    Result $default(_Subscriptions value), {
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

abstract class _Initial extends AlertsSubscriptionsItemState {
  _Initial._() : super._();
  factory _Initial(AlertSubscription subscription) = _$_Initial;

  @override
  AlertSubscription get subscription;
  @override
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $AlertsSubscriptionsItemStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({AlertSubscription subscription});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsItemStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object subscription = freezed,
  }) {
    return _then(_Loading(
      subscription == freezed
          ? _value.subscription
          : subscription as AlertSubscription,
    ));
  }
}

/// @nodoc
class _$_Loading extends _Loading {
  _$_Loading(this.subscription)
      : assert(subscription != null),
        super._();

  @override
  final AlertSubscription subscription;

  @override
  String toString() {
    return 'AlertsSubscriptionsItemState.loading(subscription: $subscription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.subscription, subscription) ||
                const DeepCollectionEquality()
                    .equals(other.subscription, subscription)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subscription);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    @required Result initial(AlertSubscription subscription),
    @required Result loading(AlertSubscription subscription),
    @required
        Result error(AlertSubscription subscription,
            AlertsSubscriptionsItemStateError type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return loading(subscription);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    Result initial(AlertSubscription subscription),
    Result loading(AlertSubscription subscription),
    Result error(
        AlertSubscription subscription, AlertsSubscriptionsItemStateError type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
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
    Result $default(_Subscriptions value), {
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

abstract class _Loading extends AlertsSubscriptionsItemState {
  _Loading._() : super._();
  factory _Loading(AlertSubscription subscription) = _$_Loading;

  @override
  AlertSubscription get subscription;
  @override
  _$LoadingCopyWith<_Loading> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $AlertsSubscriptionsItemStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {AlertSubscription subscription, AlertsSubscriptionsItemStateError type});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    extends _$AlertsSubscriptionsItemStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object subscription = freezed,
    Object type = freezed,
  }) {
    return _then(_Error(
      subscription == freezed
          ? _value.subscription
          : subscription as AlertSubscription,
      type == freezed ? _value.type : type as AlertsSubscriptionsItemStateError,
    ));
  }
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error(this.subscription, this.type)
      : assert(subscription != null),
        assert(type != null),
        super._();

  @override
  final AlertSubscription subscription;
  @override
  final AlertsSubscriptionsItemStateError type;

  @override
  String toString() {
    return 'AlertsSubscriptionsItemState.error(subscription: $subscription, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.subscription, subscription) ||
                const DeepCollectionEquality()
                    .equals(other.subscription, subscription)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subscription) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    @required Result initial(AlertSubscription subscription),
    @required Result loading(AlertSubscription subscription),
    @required
        Result error(AlertSubscription subscription,
            AlertsSubscriptionsItemStateError type),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    return error(subscription, type);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertSubscription subscription), {
    Result initial(AlertSubscription subscription),
    Result loading(AlertSubscription subscription),
    Result error(
        AlertSubscription subscription, AlertsSubscriptionsItemStateError type),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(subscription, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Subscriptions value), {
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
    Result $default(_Subscriptions value), {
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

abstract class _Error extends AlertsSubscriptionsItemState {
  _Error._() : super._();
  factory _Error(AlertSubscription subscription,
      AlertsSubscriptionsItemStateError type) = _$_Error;

  @override
  AlertSubscription get subscription;
  AlertsSubscriptionsItemStateError get type;
  @override
  _$ErrorCopyWith<_Error> get copyWith;
}
