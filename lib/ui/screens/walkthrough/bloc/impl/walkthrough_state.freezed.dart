// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'walkthrough_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WalkthroughStateTearOff {
  const _$WalkthroughStateTearOff();

// ignore: unused_element
  _WalkthroughState call({@required WalkthroughStep step}) {
    return _WalkthroughState(
      step: step,
    );
  }

// ignore: unused_element
  _UserConnected connected() {
    return _UserConnected();
  }
}

/// @nodoc
// ignore: unused_element
const $WalkthroughState = _$WalkthroughStateTearOff();

/// @nodoc
mixin _$WalkthroughState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(WalkthroughStep step), {
    @required Result connected(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(WalkthroughStep step), {
    Result connected(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_WalkthroughState value), {
    @required Result connected(_UserConnected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_WalkthroughState value), {
    Result connected(_UserConnected value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $WalkthroughStateCopyWith<$Res> {
  factory $WalkthroughStateCopyWith(
          WalkthroughState value, $Res Function(WalkthroughState) then) =
      _$WalkthroughStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WalkthroughStateCopyWithImpl<$Res>
    implements $WalkthroughStateCopyWith<$Res> {
  _$WalkthroughStateCopyWithImpl(this._value, this._then);

  final WalkthroughState _value;
  // ignore: unused_field
  final $Res Function(WalkthroughState) _then;
}

/// @nodoc
abstract class _$WalkthroughStateCopyWith<$Res> {
  factory _$WalkthroughStateCopyWith(
          _WalkthroughState value, $Res Function(_WalkthroughState) then) =
      __$WalkthroughStateCopyWithImpl<$Res>;
  $Res call({WalkthroughStep step});
}

/// @nodoc
class __$WalkthroughStateCopyWithImpl<$Res>
    extends _$WalkthroughStateCopyWithImpl<$Res>
    implements _$WalkthroughStateCopyWith<$Res> {
  __$WalkthroughStateCopyWithImpl(
      _WalkthroughState _value, $Res Function(_WalkthroughState) _then)
      : super(_value, (v) => _then(v as _WalkthroughState));

  @override
  _WalkthroughState get _value => super._value as _WalkthroughState;

  @override
  $Res call({
    Object step = freezed,
  }) {
    return _then(_WalkthroughState(
      step: step == freezed ? _value.step : step as WalkthroughStep,
    ));
  }
}

/// @nodoc
class _$_WalkthroughState implements _WalkthroughState {
  _$_WalkthroughState({@required this.step}) : assert(step != null);

  @override
  final WalkthroughStep step;

  @override
  String toString() {
    return 'WalkthroughState(step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WalkthroughState &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(step);

  @override
  _$WalkthroughStateCopyWith<_WalkthroughState> get copyWith =>
      __$WalkthroughStateCopyWithImpl<_WalkthroughState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(WalkthroughStep step), {
    @required Result connected(),
  }) {
    assert($default != null);
    assert(connected != null);
    return $default(step);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(WalkthroughStep step), {
    Result connected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_WalkthroughState value), {
    @required Result connected(_UserConnected value),
  }) {
    assert($default != null);
    assert(connected != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_WalkthroughState value), {
    Result connected(_UserConnected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _WalkthroughState implements WalkthroughState {
  factory _WalkthroughState({@required WalkthroughStep step}) =
      _$_WalkthroughState;

  WalkthroughStep get step;
  _$WalkthroughStateCopyWith<_WalkthroughState> get copyWith;
}

/// @nodoc
abstract class _$UserConnectedCopyWith<$Res> {
  factory _$UserConnectedCopyWith(
          _UserConnected value, $Res Function(_UserConnected) then) =
      __$UserConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UserConnectedCopyWithImpl<$Res>
    extends _$WalkthroughStateCopyWithImpl<$Res>
    implements _$UserConnectedCopyWith<$Res> {
  __$UserConnectedCopyWithImpl(
      _UserConnected _value, $Res Function(_UserConnected) _then)
      : super(_value, (v) => _then(v as _UserConnected));

  @override
  _UserConnected get _value => super._value as _UserConnected;
}

/// @nodoc
class _$_UserConnected implements _UserConnected {
  _$_UserConnected();

  @override
  String toString() {
    return 'WalkthroughState.connected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(WalkthroughStep step), {
    @required Result connected(),
  }) {
    assert($default != null);
    assert(connected != null);
    return connected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(WalkthroughStep step), {
    Result connected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_WalkthroughState value), {
    @required Result connected(_UserConnected value),
  }) {
    assert($default != null);
    assert(connected != null);
    return connected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_WalkthroughState value), {
    Result connected(_UserConnected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _UserConnected implements WalkthroughState {
  factory _UserConnected() = _$_UserConnected;
}
