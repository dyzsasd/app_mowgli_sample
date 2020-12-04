// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_dates_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DatesFilterStateTearOff {
  const _$DatesFilterStateTearOff();

// ignore: unused_element
  _DatesFilter call(DatesFilter dates) {
    return _DatesFilter(
      dates,
    );
  }

// ignore: unused_element
  _DatesFilterInitial initial({DatesFilter dates}) {
    return _DatesFilterInitial(
      dates: dates,
    );
  }

// ignore: unused_element
  _DatesFilterReady ready(DatesFilter dates) {
    return _DatesFilterReady(
      dates,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DatesFilterState = _$DatesFilterStateTearOff();

/// @nodoc
mixin _$DatesFilterState {
  DatesFilter get dates;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates), {
    @required Result initial(DatesFilter dates),
    @required Result ready(DatesFilter dates),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates), {
    Result initial(DatesFilter dates),
    Result ready(DatesFilter dates),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DatesFilter value), {
    @required Result initial(_DatesFilterInitial value),
    @required Result ready(_DatesFilterReady value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DatesFilter value), {
    Result initial(_DatesFilterInitial value),
    Result ready(_DatesFilterReady value),
    @required Result orElse(),
  });

  $DatesFilterStateCopyWith<DatesFilterState> get copyWith;
}

/// @nodoc
abstract class $DatesFilterStateCopyWith<$Res> {
  factory $DatesFilterStateCopyWith(
          DatesFilterState value, $Res Function(DatesFilterState) then) =
      _$DatesFilterStateCopyWithImpl<$Res>;
  $Res call({DatesFilter dates});

  $DatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class _$DatesFilterStateCopyWithImpl<$Res>
    implements $DatesFilterStateCopyWith<$Res> {
  _$DatesFilterStateCopyWithImpl(this._value, this._then);

  final DatesFilterState _value;
  // ignore: unused_field
  final $Res Function(DatesFilterState) _then;

  @override
  $Res call({
    Object dates = freezed,
  }) {
    return _then(_value.copyWith(
      dates: dates == freezed ? _value.dates : dates as DatesFilter,
    ));
  }

  @override
  $DatesFilterCopyWith<$Res> get dates {
    if (_value.dates == null) {
      return null;
    }
    return $DatesFilterCopyWith<$Res>(_value.dates, (value) {
      return _then(_value.copyWith(dates: value));
    });
  }
}

/// @nodoc
abstract class _$DatesFilterCopyWith<$Res>
    implements $DatesFilterStateCopyWith<$Res> {
  factory _$DatesFilterCopyWith(
          _DatesFilter value, $Res Function(_DatesFilter) then) =
      __$DatesFilterCopyWithImpl<$Res>;
  @override
  $Res call({DatesFilter dates});

  @override
  $DatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class __$DatesFilterCopyWithImpl<$Res>
    extends _$DatesFilterStateCopyWithImpl<$Res>
    implements _$DatesFilterCopyWith<$Res> {
  __$DatesFilterCopyWithImpl(
      _DatesFilter _value, $Res Function(_DatesFilter) _then)
      : super(_value, (v) => _then(v as _DatesFilter));

  @override
  _DatesFilter get _value => super._value as _DatesFilter;

  @override
  $Res call({
    Object dates = freezed,
  }) {
    return _then(_DatesFilter(
      dates == freezed ? _value.dates : dates as DatesFilter,
    ));
  }
}

/// @nodoc
class _$_DatesFilter extends _DatesFilter {
  _$_DatesFilter(this.dates)
      : assert(dates != null),
        super._();

  @override
  final DatesFilter dates;

  @override
  String toString() {
    return 'DatesFilterState(dates: $dates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DatesFilter &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dates);

  @override
  _$DatesFilterCopyWith<_DatesFilter> get copyWith =>
      __$DatesFilterCopyWithImpl<_DatesFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates), {
    @required Result initial(DatesFilter dates),
    @required Result ready(DatesFilter dates),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(dates);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates), {
    Result initial(DatesFilter dates),
    Result ready(DatesFilter dates),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(dates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DatesFilter value), {
    @required Result initial(_DatesFilterInitial value),
    @required Result ready(_DatesFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DatesFilter value), {
    Result initial(_DatesFilterInitial value),
    Result ready(_DatesFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _DatesFilter extends DatesFilterState {
  _DatesFilter._() : super._();
  factory _DatesFilter(DatesFilter dates) = _$_DatesFilter;

  @override
  DatesFilter get dates;
  @override
  _$DatesFilterCopyWith<_DatesFilter> get copyWith;
}

/// @nodoc
abstract class _$DatesFilterInitialCopyWith<$Res>
    implements $DatesFilterStateCopyWith<$Res> {
  factory _$DatesFilterInitialCopyWith(
          _DatesFilterInitial value, $Res Function(_DatesFilterInitial) then) =
      __$DatesFilterInitialCopyWithImpl<$Res>;
  @override
  $Res call({DatesFilter dates});

  @override
  $DatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class __$DatesFilterInitialCopyWithImpl<$Res>
    extends _$DatesFilterStateCopyWithImpl<$Res>
    implements _$DatesFilterInitialCopyWith<$Res> {
  __$DatesFilterInitialCopyWithImpl(
      _DatesFilterInitial _value, $Res Function(_DatesFilterInitial) _then)
      : super(_value, (v) => _then(v as _DatesFilterInitial));

  @override
  _DatesFilterInitial get _value => super._value as _DatesFilterInitial;

  @override
  $Res call({
    Object dates = freezed,
  }) {
    return _then(_DatesFilterInitial(
      dates: dates == freezed ? _value.dates : dates as DatesFilter,
    ));
  }
}

/// @nodoc
class _$_DatesFilterInitial extends _DatesFilterInitial {
  _$_DatesFilterInitial({this.dates}) : super._();

  @override
  final DatesFilter dates;

  @override
  String toString() {
    return 'DatesFilterState.initial(dates: $dates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DatesFilterInitial &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dates);

  @override
  _$DatesFilterInitialCopyWith<_DatesFilterInitial> get copyWith =>
      __$DatesFilterInitialCopyWithImpl<_DatesFilterInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates), {
    @required Result initial(DatesFilter dates),
    @required Result ready(DatesFilter dates),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(dates);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates), {
    Result initial(DatesFilter dates),
    Result ready(DatesFilter dates),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(dates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DatesFilter value), {
    @required Result initial(_DatesFilterInitial value),
    @required Result ready(_DatesFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DatesFilter value), {
    Result initial(_DatesFilterInitial value),
    Result ready(_DatesFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DatesFilterInitial extends DatesFilterState {
  _DatesFilterInitial._() : super._();
  factory _DatesFilterInitial({DatesFilter dates}) = _$_DatesFilterInitial;

  @override
  DatesFilter get dates;
  @override
  _$DatesFilterInitialCopyWith<_DatesFilterInitial> get copyWith;
}

/// @nodoc
abstract class _$DatesFilterReadyCopyWith<$Res>
    implements $DatesFilterStateCopyWith<$Res> {
  factory _$DatesFilterReadyCopyWith(
          _DatesFilterReady value, $Res Function(_DatesFilterReady) then) =
      __$DatesFilterReadyCopyWithImpl<$Res>;
  @override
  $Res call({DatesFilter dates});

  @override
  $DatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class __$DatesFilterReadyCopyWithImpl<$Res>
    extends _$DatesFilterStateCopyWithImpl<$Res>
    implements _$DatesFilterReadyCopyWith<$Res> {
  __$DatesFilterReadyCopyWithImpl(
      _DatesFilterReady _value, $Res Function(_DatesFilterReady) _then)
      : super(_value, (v) => _then(v as _DatesFilterReady));

  @override
  _DatesFilterReady get _value => super._value as _DatesFilterReady;

  @override
  $Res call({
    Object dates = freezed,
  }) {
    return _then(_DatesFilterReady(
      dates == freezed ? _value.dates : dates as DatesFilter,
    ));
  }
}

/// @nodoc
class _$_DatesFilterReady extends _DatesFilterReady {
  _$_DatesFilterReady(this.dates)
      : assert(dates != null),
        super._();

  @override
  final DatesFilter dates;

  @override
  String toString() {
    return 'DatesFilterState.ready(dates: $dates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DatesFilterReady &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dates);

  @override
  _$DatesFilterReadyCopyWith<_DatesFilterReady> get copyWith =>
      __$DatesFilterReadyCopyWithImpl<_DatesFilterReady>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates), {
    @required Result initial(DatesFilter dates),
    @required Result ready(DatesFilter dates),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(dates);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates), {
    Result initial(DatesFilter dates),
    Result ready(DatesFilter dates),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(dates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DatesFilter value), {
    @required Result initial(_DatesFilterInitial value),
    @required Result ready(_DatesFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DatesFilter value), {
    Result initial(_DatesFilterInitial value),
    Result ready(_DatesFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _DatesFilterReady extends DatesFilterState {
  _DatesFilterReady._() : super._();
  factory _DatesFilterReady(DatesFilter dates) = _$_DatesFilterReady;

  @override
  DatesFilter get dates;
  @override
  _$DatesFilterReadyCopyWith<_DatesFilterReady> get copyWith;
}
