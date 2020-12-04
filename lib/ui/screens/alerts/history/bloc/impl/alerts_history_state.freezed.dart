// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'alerts_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AlertsHistoryStateTearOff {
  const _$AlertsHistoryStateTearOff();

// ignore: unused_element
  AlertsHistoryStateData call(AlertsHistoryContent notifications) {
    return AlertsHistoryStateData(
      notifications,
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
const $AlertsHistoryState = _$AlertsHistoryStateTearOff();

/// @nodoc
mixin _$AlertsHistoryState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertsHistoryContent notifications), {
    @required Result loading(),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertsHistoryContent notifications), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AlertsHistoryStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(AlertsHistoryStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AlertsHistoryStateCopyWith<$Res> {
  factory $AlertsHistoryStateCopyWith(
          AlertsHistoryState value, $Res Function(AlertsHistoryState) then) =
      _$AlertsHistoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlertsHistoryStateCopyWithImpl<$Res>
    implements $AlertsHistoryStateCopyWith<$Res> {
  _$AlertsHistoryStateCopyWithImpl(this._value, this._then);

  final AlertsHistoryState _value;
  // ignore: unused_field
  final $Res Function(AlertsHistoryState) _then;
}

/// @nodoc
abstract class $AlertsHistoryStateDataCopyWith<$Res> {
  factory $AlertsHistoryStateDataCopyWith(AlertsHistoryStateData value,
          $Res Function(AlertsHistoryStateData) then) =
      _$AlertsHistoryStateDataCopyWithImpl<$Res>;
  $Res call({AlertsHistoryContent notifications});
}

/// @nodoc
class _$AlertsHistoryStateDataCopyWithImpl<$Res>
    extends _$AlertsHistoryStateCopyWithImpl<$Res>
    implements $AlertsHistoryStateDataCopyWith<$Res> {
  _$AlertsHistoryStateDataCopyWithImpl(AlertsHistoryStateData _value,
      $Res Function(AlertsHistoryStateData) _then)
      : super(_value, (v) => _then(v as AlertsHistoryStateData));

  @override
  AlertsHistoryStateData get _value => super._value as AlertsHistoryStateData;

  @override
  $Res call({
    Object notifications = freezed,
  }) {
    return _then(AlertsHistoryStateData(
      notifications == freezed
          ? _value.notifications
          : notifications as AlertsHistoryContent,
    ));
  }
}

/// @nodoc
class _$AlertsHistoryStateData implements AlertsHistoryStateData {
  _$AlertsHistoryStateData(this.notifications) : assert(notifications != null);

  @override
  final AlertsHistoryContent notifications;

  @override
  String toString() {
    return 'AlertsHistoryState(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AlertsHistoryStateData &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notifications);

  @override
  $AlertsHistoryStateDataCopyWith<AlertsHistoryStateData> get copyWith =>
      _$AlertsHistoryStateDataCopyWithImpl<AlertsHistoryStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(AlertsHistoryContent notifications), {
    @required Result loading(),
    @required Result error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(notifications);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(AlertsHistoryContent notifications), {
    Result loading(),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(AlertsHistoryStateData value), {
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
    Result $default(AlertsHistoryStateData value), {
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

abstract class AlertsHistoryStateData implements AlertsHistoryState {
  factory AlertsHistoryStateData(AlertsHistoryContent notifications) =
      _$AlertsHistoryStateData;

  AlertsHistoryContent get notifications;
  $AlertsHistoryStateDataCopyWith<AlertsHistoryStateData> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$AlertsHistoryStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AlertsHistoryState.loading()';
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
    Result $default(AlertsHistoryContent notifications), {
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
    Result $default(AlertsHistoryContent notifications), {
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
    Result $default(AlertsHistoryStateData value), {
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
    Result $default(AlertsHistoryStateData value), {
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

abstract class _Loading implements AlertsHistoryState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$AlertsHistoryStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc
class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'AlertsHistoryState.error()';
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
    Result $default(AlertsHistoryContent notifications), {
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
    Result $default(AlertsHistoryContent notifications), {
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
    Result $default(AlertsHistoryStateData value), {
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
    Result $default(AlertsHistoryStateData value), {
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

abstract class _Error implements AlertsHistoryState {
  const factory _Error() = _$_Error;
}
