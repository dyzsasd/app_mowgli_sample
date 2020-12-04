// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_flight_duration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FlightDurationFilterStateTearOff {
  const _$FlightDurationFilterStateTearOff();

// ignore: unused_element
  _FlightDurationFilter call(
      FlightDurationFilter duration, int minValue, int maxValue) {
    return _FlightDurationFilter(
      duration,
      minValue,
      maxValue,
    );
  }

// ignore: unused_element
  _FlightDurationFilterInitial initial(
      FlightDurationFilter duration, int minValue, int maxValue) {
    return _FlightDurationFilterInitial(
      duration,
      minValue,
      maxValue,
    );
  }

// ignore: unused_element
  _FlightDurationFilterReady ready(
      FlightDurationFilter duration, int minValue, int maxValue) {
    return _FlightDurationFilterReady(
      duration,
      minValue,
      maxValue,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FlightDurationFilterState = _$FlightDurationFilterStateTearOff();

/// @nodoc
mixin _$FlightDurationFilterState {
  FlightDurationFilter get duration;
  int get minValue;
  int get maxValue;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    @required
        Result initial(
            FlightDurationFilter duration, int minValue, int maxValue),
    @required
        Result ready(FlightDurationFilter duration, int minValue, int maxValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    Result initial(FlightDurationFilter duration, int minValue, int maxValue),
    Result ready(FlightDurationFilter duration, int minValue, int maxValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    @required Result initial(_FlightDurationFilterInitial value),
    @required Result ready(_FlightDurationFilterReady value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    Result initial(_FlightDurationFilterInitial value),
    Result ready(_FlightDurationFilterReady value),
    @required Result orElse(),
  });

  $FlightDurationFilterStateCopyWith<FlightDurationFilterState> get copyWith;
}

/// @nodoc
abstract class $FlightDurationFilterStateCopyWith<$Res> {
  factory $FlightDurationFilterStateCopyWith(FlightDurationFilterState value,
          $Res Function(FlightDurationFilterState) then) =
      _$FlightDurationFilterStateCopyWithImpl<$Res>;
  $Res call({FlightDurationFilter duration, int minValue, int maxValue});

  $FlightDurationFilterCopyWith<$Res> get duration;
}

/// @nodoc
class _$FlightDurationFilterStateCopyWithImpl<$Res>
    implements $FlightDurationFilterStateCopyWith<$Res> {
  _$FlightDurationFilterStateCopyWithImpl(this._value, this._then);

  final FlightDurationFilterState _value;
  // ignore: unused_field
  final $Res Function(FlightDurationFilterState) _then;

  @override
  $Res call({
    Object duration = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration as FlightDurationFilter,
      minValue: minValue == freezed ? _value.minValue : minValue as int,
      maxValue: maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }

  @override
  $FlightDurationFilterCopyWith<$Res> get duration {
    if (_value.duration == null) {
      return null;
    }
    return $FlightDurationFilterCopyWith<$Res>(_value.duration, (value) {
      return _then(_value.copyWith(duration: value));
    });
  }
}

/// @nodoc
abstract class _$FlightDurationFilterCopyWith<$Res>
    implements $FlightDurationFilterStateCopyWith<$Res> {
  factory _$FlightDurationFilterCopyWith(_FlightDurationFilter value,
          $Res Function(_FlightDurationFilter) then) =
      __$FlightDurationFilterCopyWithImpl<$Res>;
  @override
  $Res call({FlightDurationFilter duration, int minValue, int maxValue});

  @override
  $FlightDurationFilterCopyWith<$Res> get duration;
}

/// @nodoc
class __$FlightDurationFilterCopyWithImpl<$Res>
    extends _$FlightDurationFilterStateCopyWithImpl<$Res>
    implements _$FlightDurationFilterCopyWith<$Res> {
  __$FlightDurationFilterCopyWithImpl(
      _FlightDurationFilter _value, $Res Function(_FlightDurationFilter) _then)
      : super(_value, (v) => _then(v as _FlightDurationFilter));

  @override
  _FlightDurationFilter get _value => super._value as _FlightDurationFilter;

  @override
  $Res call({
    Object duration = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_FlightDurationFilter(
      duration == freezed ? _value.duration : duration as FlightDurationFilter,
      minValue == freezed ? _value.minValue : minValue as int,
      maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }
}

/// @nodoc
class _$_FlightDurationFilter extends _FlightDurationFilter {
  _$_FlightDurationFilter(this.duration, this.minValue, this.maxValue)
      : assert(duration != null),
        assert(minValue != null),
        assert(maxValue != null),
        super._();

  @override
  final FlightDurationFilter duration;
  @override
  final int minValue;
  @override
  final int maxValue;

  @override
  String toString() {
    return 'FlightDurationFilterState(duration: $duration, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlightDurationFilter &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue);

  @override
  _$FlightDurationFilterCopyWith<_FlightDurationFilter> get copyWith =>
      __$FlightDurationFilterCopyWithImpl<_FlightDurationFilter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    @required
        Result initial(
            FlightDurationFilter duration, int minValue, int maxValue),
    @required
        Result ready(FlightDurationFilter duration, int minValue, int maxValue),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(duration, minValue, maxValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    Result initial(FlightDurationFilter duration, int minValue, int maxValue),
    Result ready(FlightDurationFilter duration, int minValue, int maxValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(duration, minValue, maxValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    @required Result initial(_FlightDurationFilterInitial value),
    @required Result ready(_FlightDurationFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    Result initial(_FlightDurationFilterInitial value),
    Result ready(_FlightDurationFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _FlightDurationFilter extends FlightDurationFilterState {
  _FlightDurationFilter._() : super._();
  factory _FlightDurationFilter(
          FlightDurationFilter duration, int minValue, int maxValue) =
      _$_FlightDurationFilter;

  @override
  FlightDurationFilter get duration;
  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  _$FlightDurationFilterCopyWith<_FlightDurationFilter> get copyWith;
}

/// @nodoc
abstract class _$FlightDurationFilterInitialCopyWith<$Res>
    implements $FlightDurationFilterStateCopyWith<$Res> {
  factory _$FlightDurationFilterInitialCopyWith(
          _FlightDurationFilterInitial value,
          $Res Function(_FlightDurationFilterInitial) then) =
      __$FlightDurationFilterInitialCopyWithImpl<$Res>;
  @override
  $Res call({FlightDurationFilter duration, int minValue, int maxValue});

  @override
  $FlightDurationFilterCopyWith<$Res> get duration;
}

/// @nodoc
class __$FlightDurationFilterInitialCopyWithImpl<$Res>
    extends _$FlightDurationFilterStateCopyWithImpl<$Res>
    implements _$FlightDurationFilterInitialCopyWith<$Res> {
  __$FlightDurationFilterInitialCopyWithImpl(
      _FlightDurationFilterInitial _value,
      $Res Function(_FlightDurationFilterInitial) _then)
      : super(_value, (v) => _then(v as _FlightDurationFilterInitial));

  @override
  _FlightDurationFilterInitial get _value =>
      super._value as _FlightDurationFilterInitial;

  @override
  $Res call({
    Object duration = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_FlightDurationFilterInitial(
      duration == freezed ? _value.duration : duration as FlightDurationFilter,
      minValue == freezed ? _value.minValue : minValue as int,
      maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }
}

/// @nodoc
class _$_FlightDurationFilterInitial extends _FlightDurationFilterInitial {
  _$_FlightDurationFilterInitial(this.duration, this.minValue, this.maxValue)
      : assert(duration != null),
        assert(minValue != null),
        assert(maxValue != null),
        super._();

  @override
  final FlightDurationFilter duration;
  @override
  final int minValue;
  @override
  final int maxValue;

  @override
  String toString() {
    return 'FlightDurationFilterState.initial(duration: $duration, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlightDurationFilterInitial &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue);

  @override
  _$FlightDurationFilterInitialCopyWith<_FlightDurationFilterInitial>
      get copyWith => __$FlightDurationFilterInitialCopyWithImpl<
          _FlightDurationFilterInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    @required
        Result initial(
            FlightDurationFilter duration, int minValue, int maxValue),
    @required
        Result ready(FlightDurationFilter duration, int minValue, int maxValue),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(duration, minValue, maxValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    Result initial(FlightDurationFilter duration, int minValue, int maxValue),
    Result ready(FlightDurationFilter duration, int minValue, int maxValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(duration, minValue, maxValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    @required Result initial(_FlightDurationFilterInitial value),
    @required Result ready(_FlightDurationFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    Result initial(_FlightDurationFilterInitial value),
    Result ready(_FlightDurationFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _FlightDurationFilterInitial extends FlightDurationFilterState {
  _FlightDurationFilterInitial._() : super._();
  factory _FlightDurationFilterInitial(
          FlightDurationFilter duration, int minValue, int maxValue) =
      _$_FlightDurationFilterInitial;

  @override
  FlightDurationFilter get duration;
  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  _$FlightDurationFilterInitialCopyWith<_FlightDurationFilterInitial>
      get copyWith;
}

/// @nodoc
abstract class _$FlightDurationFilterReadyCopyWith<$Res>
    implements $FlightDurationFilterStateCopyWith<$Res> {
  factory _$FlightDurationFilterReadyCopyWith(_FlightDurationFilterReady value,
          $Res Function(_FlightDurationFilterReady) then) =
      __$FlightDurationFilterReadyCopyWithImpl<$Res>;
  @override
  $Res call({FlightDurationFilter duration, int minValue, int maxValue});

  @override
  $FlightDurationFilterCopyWith<$Res> get duration;
}

/// @nodoc
class __$FlightDurationFilterReadyCopyWithImpl<$Res>
    extends _$FlightDurationFilterStateCopyWithImpl<$Res>
    implements _$FlightDurationFilterReadyCopyWith<$Res> {
  __$FlightDurationFilterReadyCopyWithImpl(_FlightDurationFilterReady _value,
      $Res Function(_FlightDurationFilterReady) _then)
      : super(_value, (v) => _then(v as _FlightDurationFilterReady));

  @override
  _FlightDurationFilterReady get _value =>
      super._value as _FlightDurationFilterReady;

  @override
  $Res call({
    Object duration = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_FlightDurationFilterReady(
      duration == freezed ? _value.duration : duration as FlightDurationFilter,
      minValue == freezed ? _value.minValue : minValue as int,
      maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }
}

/// @nodoc
class _$_FlightDurationFilterReady extends _FlightDurationFilterReady {
  _$_FlightDurationFilterReady(this.duration, this.minValue, this.maxValue)
      : assert(duration != null),
        assert(minValue != null),
        assert(maxValue != null),
        super._();

  @override
  final FlightDurationFilter duration;
  @override
  final int minValue;
  @override
  final int maxValue;

  @override
  String toString() {
    return 'FlightDurationFilterState.ready(duration: $duration, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlightDurationFilterReady &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue);

  @override
  _$FlightDurationFilterReadyCopyWith<_FlightDurationFilterReady>
      get copyWith =>
          __$FlightDurationFilterReadyCopyWithImpl<_FlightDurationFilterReady>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    @required
        Result initial(
            FlightDurationFilter duration, int minValue, int maxValue),
    @required
        Result ready(FlightDurationFilter duration, int minValue, int maxValue),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(duration, minValue, maxValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        FlightDurationFilter duration, int minValue, int maxValue), {
    Result initial(FlightDurationFilter duration, int minValue, int maxValue),
    Result ready(FlightDurationFilter duration, int minValue, int maxValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(duration, minValue, maxValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    @required Result initial(_FlightDurationFilterInitial value),
    @required Result ready(_FlightDurationFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_FlightDurationFilter value), {
    Result initial(_FlightDurationFilterInitial value),
    Result ready(_FlightDurationFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _FlightDurationFilterReady extends FlightDurationFilterState {
  _FlightDurationFilterReady._() : super._();
  factory _FlightDurationFilterReady(
          FlightDurationFilter duration, int minValue, int maxValue) =
      _$_FlightDurationFilterReady;

  @override
  FlightDurationFilter get duration;
  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  _$FlightDurationFilterReadyCopyWith<_FlightDurationFilterReady> get copyWith;
}
