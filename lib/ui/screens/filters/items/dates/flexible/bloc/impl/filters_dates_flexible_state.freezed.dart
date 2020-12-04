// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_dates_flexible_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FlexibleDatesFilterStateTearOff {
  const _$FlexibleDatesFilterStateTearOff();

// ignore: unused_element
  FlexibleDatesFilterStateData call(FlexibleDatesFilter dates, int minDuration,
      int maxDuration, DateTime minDate, DateTime maxDate) {
    return FlexibleDatesFilterStateData(
      dates,
      minDuration,
      maxDuration,
      minDate,
      maxDate,
    );
  }

// ignore: unused_element
  _FlexibleDatesFilterInitial initial(
      {@required int minDuration,
      @required int maxDuration,
      @required DateTime minDate,
      @required DateTime maxDate,
      FlexibleDatesFilter dates}) {
    return _FlexibleDatesFilterInitial(
      minDuration: minDuration,
      maxDuration: maxDuration,
      minDate: minDate,
      maxDate: maxDate,
      dates: dates,
    );
  }

// ignore: unused_element
  _FlexibleDatesFilterReady ready(FlexibleDatesFilter dates, int minDuration,
      int maxDuration, DateTime minDate, DateTime maxDate) {
    return _FlexibleDatesFilterReady(
      dates,
      minDuration,
      maxDuration,
      minDate,
      maxDate,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FlexibleDatesFilterState = _$FlexibleDatesFilterStateTearOff();

/// @nodoc
mixin _$FlexibleDatesFilterState {
  FlexibleDatesFilter get dates;
  int get minDuration;
  int get maxDuration;
  DateTime get minDate;
  DateTime get maxDate;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    @required
        Result initial(int minDuration, int maxDuration, DateTime minDate,
            DateTime maxDate, FlexibleDatesFilter dates),
    @required
        Result ready(FlexibleDatesFilter dates, int minDuration,
            int maxDuration, DateTime minDate, DateTime maxDate),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    Result initial(int minDuration, int maxDuration, DateTime minDate,
        DateTime maxDate, FlexibleDatesFilter dates),
    Result ready(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    @required Result initial(_FlexibleDatesFilterInitial value),
    @required Result ready(_FlexibleDatesFilterReady value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    Result initial(_FlexibleDatesFilterInitial value),
    Result ready(_FlexibleDatesFilterReady value),
    @required Result orElse(),
  });

  $FlexibleDatesFilterStateCopyWith<FlexibleDatesFilterState> get copyWith;
}

/// @nodoc
abstract class $FlexibleDatesFilterStateCopyWith<$Res> {
  factory $FlexibleDatesFilterStateCopyWith(FlexibleDatesFilterState value,
          $Res Function(FlexibleDatesFilterState) then) =
      _$FlexibleDatesFilterStateCopyWithImpl<$Res>;
  $Res call(
      {FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate});

  $FlexibleDatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class _$FlexibleDatesFilterStateCopyWithImpl<$Res>
    implements $FlexibleDatesFilterStateCopyWith<$Res> {
  _$FlexibleDatesFilterStateCopyWithImpl(this._value, this._then);

  final FlexibleDatesFilterState _value;
  // ignore: unused_field
  final $Res Function(FlexibleDatesFilterState) _then;

  @override
  $Res call({
    Object dates = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
    Object minDate = freezed,
    Object maxDate = freezed,
  }) {
    return _then(_value.copyWith(
      dates: dates == freezed ? _value.dates : dates as FlexibleDatesFilter,
      minDuration:
          minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration:
          maxDuration == freezed ? _value.maxDuration : maxDuration as int,
      minDate: minDate == freezed ? _value.minDate : minDate as DateTime,
      maxDate: maxDate == freezed ? _value.maxDate : maxDate as DateTime,
    ));
  }

  @override
  $FlexibleDatesFilterCopyWith<$Res> get dates {
    if (_value.dates == null) {
      return null;
    }
    return $FlexibleDatesFilterCopyWith<$Res>(_value.dates, (value) {
      return _then(_value.copyWith(dates: value));
    });
  }
}

/// @nodoc
abstract class $FlexibleDatesFilterStateDataCopyWith<$Res>
    implements $FlexibleDatesFilterStateCopyWith<$Res> {
  factory $FlexibleDatesFilterStateDataCopyWith(
          FlexibleDatesFilterStateData value,
          $Res Function(FlexibleDatesFilterStateData) then) =
      _$FlexibleDatesFilterStateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate});

  @override
  $FlexibleDatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class _$FlexibleDatesFilterStateDataCopyWithImpl<$Res>
    extends _$FlexibleDatesFilterStateCopyWithImpl<$Res>
    implements $FlexibleDatesFilterStateDataCopyWith<$Res> {
  _$FlexibleDatesFilterStateDataCopyWithImpl(
      FlexibleDatesFilterStateData _value,
      $Res Function(FlexibleDatesFilterStateData) _then)
      : super(_value, (v) => _then(v as FlexibleDatesFilterStateData));

  @override
  FlexibleDatesFilterStateData get _value =>
      super._value as FlexibleDatesFilterStateData;

  @override
  $Res call({
    Object dates = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
    Object minDate = freezed,
    Object maxDate = freezed,
  }) {
    return _then(FlexibleDatesFilterStateData(
      dates == freezed ? _value.dates : dates as FlexibleDatesFilter,
      minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration == freezed ? _value.maxDuration : maxDuration as int,
      minDate == freezed ? _value.minDate : minDate as DateTime,
      maxDate == freezed ? _value.maxDate : maxDate as DateTime,
    ));
  }
}

/// @nodoc
class _$FlexibleDatesFilterStateData extends FlexibleDatesFilterStateData {
  _$FlexibleDatesFilterStateData(this.dates, this.minDuration, this.maxDuration,
      this.minDate, this.maxDate)
      : assert(dates != null),
        assert(minDuration != null),
        assert(maxDuration != null),
        assert(minDate != null),
        assert(maxDate != null),
        super._();

  @override
  final FlexibleDatesFilter dates;
  @override
  final int minDuration;
  @override
  final int maxDuration;
  @override
  final DateTime minDate;
  @override
  final DateTime maxDate;

  @override
  String toString() {
    return 'FlexibleDatesFilterState(dates: $dates, minDuration: $minDuration, maxDuration: $maxDuration, minDate: $minDate, maxDate: $maxDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FlexibleDatesFilterStateData &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)) &&
            (identical(other.minDuration, minDuration) ||
                const DeepCollectionEquality()
                    .equals(other.minDuration, minDuration)) &&
            (identical(other.maxDuration, maxDuration) ||
                const DeepCollectionEquality()
                    .equals(other.maxDuration, maxDuration)) &&
            (identical(other.minDate, minDate) ||
                const DeepCollectionEquality()
                    .equals(other.minDate, minDate)) &&
            (identical(other.maxDate, maxDate) ||
                const DeepCollectionEquality().equals(other.maxDate, maxDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dates) ^
      const DeepCollectionEquality().hash(minDuration) ^
      const DeepCollectionEquality().hash(maxDuration) ^
      const DeepCollectionEquality().hash(minDate) ^
      const DeepCollectionEquality().hash(maxDate);

  @override
  $FlexibleDatesFilterStateDataCopyWith<FlexibleDatesFilterStateData>
      get copyWith => _$FlexibleDatesFilterStateDataCopyWithImpl<
          FlexibleDatesFilterStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    @required
        Result initial(int minDuration, int maxDuration, DateTime minDate,
            DateTime maxDate, FlexibleDatesFilter dates),
    @required
        Result ready(FlexibleDatesFilter dates, int minDuration,
            int maxDuration, DateTime minDate, DateTime maxDate),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(dates, minDuration, maxDuration, minDate, maxDate);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    Result initial(int minDuration, int maxDuration, DateTime minDate,
        DateTime maxDate, FlexibleDatesFilter dates),
    Result ready(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(dates, minDuration, maxDuration, minDate, maxDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    @required Result initial(_FlexibleDatesFilterInitial value),
    @required Result ready(_FlexibleDatesFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    Result initial(_FlexibleDatesFilterInitial value),
    Result ready(_FlexibleDatesFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class FlexibleDatesFilterStateData extends FlexibleDatesFilterState {
  FlexibleDatesFilterStateData._() : super._();
  factory FlexibleDatesFilterStateData(
      FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate) = _$FlexibleDatesFilterStateData;

  @override
  FlexibleDatesFilter get dates;
  @override
  int get minDuration;
  @override
  int get maxDuration;
  @override
  DateTime get minDate;
  @override
  DateTime get maxDate;
  @override
  $FlexibleDatesFilterStateDataCopyWith<FlexibleDatesFilterStateData>
      get copyWith;
}

/// @nodoc
abstract class _$FlexibleDatesFilterInitialCopyWith<$Res>
    implements $FlexibleDatesFilterStateCopyWith<$Res> {
  factory _$FlexibleDatesFilterInitialCopyWith(
          _FlexibleDatesFilterInitial value,
          $Res Function(_FlexibleDatesFilterInitial) then) =
      __$FlexibleDatesFilterInitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate,
      FlexibleDatesFilter dates});

  @override
  $FlexibleDatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class __$FlexibleDatesFilterInitialCopyWithImpl<$Res>
    extends _$FlexibleDatesFilterStateCopyWithImpl<$Res>
    implements _$FlexibleDatesFilterInitialCopyWith<$Res> {
  __$FlexibleDatesFilterInitialCopyWithImpl(_FlexibleDatesFilterInitial _value,
      $Res Function(_FlexibleDatesFilterInitial) _then)
      : super(_value, (v) => _then(v as _FlexibleDatesFilterInitial));

  @override
  _FlexibleDatesFilterInitial get _value =>
      super._value as _FlexibleDatesFilterInitial;

  @override
  $Res call({
    Object minDuration = freezed,
    Object maxDuration = freezed,
    Object minDate = freezed,
    Object maxDate = freezed,
    Object dates = freezed,
  }) {
    return _then(_FlexibleDatesFilterInitial(
      minDuration:
          minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration:
          maxDuration == freezed ? _value.maxDuration : maxDuration as int,
      minDate: minDate == freezed ? _value.minDate : minDate as DateTime,
      maxDate: maxDate == freezed ? _value.maxDate : maxDate as DateTime,
      dates: dates == freezed ? _value.dates : dates as FlexibleDatesFilter,
    ));
  }
}

/// @nodoc
class _$_FlexibleDatesFilterInitial extends _FlexibleDatesFilterInitial {
  _$_FlexibleDatesFilterInitial(
      {@required this.minDuration,
      @required this.maxDuration,
      @required this.minDate,
      @required this.maxDate,
      this.dates})
      : assert(minDuration != null),
        assert(maxDuration != null),
        assert(minDate != null),
        assert(maxDate != null),
        super._();

  @override
  final int minDuration;
  @override
  final int maxDuration;
  @override
  final DateTime minDate;
  @override
  final DateTime maxDate;
  @override
  final FlexibleDatesFilter dates;

  @override
  String toString() {
    return 'FlexibleDatesFilterState.initial(minDuration: $minDuration, maxDuration: $maxDuration, minDate: $minDate, maxDate: $maxDate, dates: $dates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlexibleDatesFilterInitial &&
            (identical(other.minDuration, minDuration) ||
                const DeepCollectionEquality()
                    .equals(other.minDuration, minDuration)) &&
            (identical(other.maxDuration, maxDuration) ||
                const DeepCollectionEquality()
                    .equals(other.maxDuration, maxDuration)) &&
            (identical(other.minDate, minDate) ||
                const DeepCollectionEquality()
                    .equals(other.minDate, minDate)) &&
            (identical(other.maxDate, maxDate) ||
                const DeepCollectionEquality()
                    .equals(other.maxDate, maxDate)) &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(minDuration) ^
      const DeepCollectionEquality().hash(maxDuration) ^
      const DeepCollectionEquality().hash(minDate) ^
      const DeepCollectionEquality().hash(maxDate) ^
      const DeepCollectionEquality().hash(dates);

  @override
  _$FlexibleDatesFilterInitialCopyWith<_FlexibleDatesFilterInitial>
      get copyWith => __$FlexibleDatesFilterInitialCopyWithImpl<
          _FlexibleDatesFilterInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    @required
        Result initial(int minDuration, int maxDuration, DateTime minDate,
            DateTime maxDate, FlexibleDatesFilter dates),
    @required
        Result ready(FlexibleDatesFilter dates, int minDuration,
            int maxDuration, DateTime minDate, DateTime maxDate),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(minDuration, maxDuration, minDate, maxDate, dates);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    Result initial(int minDuration, int maxDuration, DateTime minDate,
        DateTime maxDate, FlexibleDatesFilter dates),
    Result ready(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(minDuration, maxDuration, minDate, maxDate, dates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    @required Result initial(_FlexibleDatesFilterInitial value),
    @required Result ready(_FlexibleDatesFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    Result initial(_FlexibleDatesFilterInitial value),
    Result ready(_FlexibleDatesFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _FlexibleDatesFilterInitial extends FlexibleDatesFilterState {
  _FlexibleDatesFilterInitial._() : super._();
  factory _FlexibleDatesFilterInitial(
      {@required int minDuration,
      @required int maxDuration,
      @required DateTime minDate,
      @required DateTime maxDate,
      FlexibleDatesFilter dates}) = _$_FlexibleDatesFilterInitial;

  @override
  int get minDuration;
  @override
  int get maxDuration;
  @override
  DateTime get minDate;
  @override
  DateTime get maxDate;
  @override
  FlexibleDatesFilter get dates;
  @override
  _$FlexibleDatesFilterInitialCopyWith<_FlexibleDatesFilterInitial>
      get copyWith;
}

/// @nodoc
abstract class _$FlexibleDatesFilterReadyCopyWith<$Res>
    implements $FlexibleDatesFilterStateCopyWith<$Res> {
  factory _$FlexibleDatesFilterReadyCopyWith(_FlexibleDatesFilterReady value,
          $Res Function(_FlexibleDatesFilterReady) then) =
      __$FlexibleDatesFilterReadyCopyWithImpl<$Res>;
  @override
  $Res call(
      {FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate});

  @override
  $FlexibleDatesFilterCopyWith<$Res> get dates;
}

/// @nodoc
class __$FlexibleDatesFilterReadyCopyWithImpl<$Res>
    extends _$FlexibleDatesFilterStateCopyWithImpl<$Res>
    implements _$FlexibleDatesFilterReadyCopyWith<$Res> {
  __$FlexibleDatesFilterReadyCopyWithImpl(_FlexibleDatesFilterReady _value,
      $Res Function(_FlexibleDatesFilterReady) _then)
      : super(_value, (v) => _then(v as _FlexibleDatesFilterReady));

  @override
  _FlexibleDatesFilterReady get _value =>
      super._value as _FlexibleDatesFilterReady;

  @override
  $Res call({
    Object dates = freezed,
    Object minDuration = freezed,
    Object maxDuration = freezed,
    Object minDate = freezed,
    Object maxDate = freezed,
  }) {
    return _then(_FlexibleDatesFilterReady(
      dates == freezed ? _value.dates : dates as FlexibleDatesFilter,
      minDuration == freezed ? _value.minDuration : minDuration as int,
      maxDuration == freezed ? _value.maxDuration : maxDuration as int,
      minDate == freezed ? _value.minDate : minDate as DateTime,
      maxDate == freezed ? _value.maxDate : maxDate as DateTime,
    ));
  }
}

/// @nodoc
class _$_FlexibleDatesFilterReady extends _FlexibleDatesFilterReady {
  _$_FlexibleDatesFilterReady(this.dates, this.minDuration, this.maxDuration,
      this.minDate, this.maxDate)
      : assert(dates != null),
        assert(minDuration != null),
        assert(maxDuration != null),
        assert(minDate != null),
        assert(maxDate != null),
        super._();

  @override
  final FlexibleDatesFilter dates;
  @override
  final int minDuration;
  @override
  final int maxDuration;
  @override
  final DateTime minDate;
  @override
  final DateTime maxDate;

  @override
  String toString() {
    return 'FlexibleDatesFilterState.ready(dates: $dates, minDuration: $minDuration, maxDuration: $maxDuration, minDate: $minDate, maxDate: $maxDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlexibleDatesFilterReady &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)) &&
            (identical(other.minDuration, minDuration) ||
                const DeepCollectionEquality()
                    .equals(other.minDuration, minDuration)) &&
            (identical(other.maxDuration, maxDuration) ||
                const DeepCollectionEquality()
                    .equals(other.maxDuration, maxDuration)) &&
            (identical(other.minDate, minDate) ||
                const DeepCollectionEquality()
                    .equals(other.minDate, minDate)) &&
            (identical(other.maxDate, maxDate) ||
                const DeepCollectionEquality().equals(other.maxDate, maxDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dates) ^
      const DeepCollectionEquality().hash(minDuration) ^
      const DeepCollectionEquality().hash(maxDuration) ^
      const DeepCollectionEquality().hash(minDate) ^
      const DeepCollectionEquality().hash(maxDate);

  @override
  _$FlexibleDatesFilterReadyCopyWith<_FlexibleDatesFilterReady> get copyWith =>
      __$FlexibleDatesFilterReadyCopyWithImpl<_FlexibleDatesFilterReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    @required
        Result initial(int minDuration, int maxDuration, DateTime minDate,
            DateTime maxDate, FlexibleDatesFilter dates),
    @required
        Result ready(FlexibleDatesFilter dates, int minDuration,
            int maxDuration, DateTime minDate, DateTime maxDate),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(dates, minDuration, maxDuration, minDate, maxDate);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate), {
    Result initial(int minDuration, int maxDuration, DateTime minDate,
        DateTime maxDate, FlexibleDatesFilter dates),
    Result ready(FlexibleDatesFilter dates, int minDuration, int maxDuration,
        DateTime minDate, DateTime maxDate),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(dates, minDuration, maxDuration, minDate, maxDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    @required Result initial(_FlexibleDatesFilterInitial value),
    @required Result ready(_FlexibleDatesFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FlexibleDatesFilterStateData value), {
    Result initial(_FlexibleDatesFilterInitial value),
    Result ready(_FlexibleDatesFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _FlexibleDatesFilterReady extends FlexibleDatesFilterState {
  _FlexibleDatesFilterReady._() : super._();
  factory _FlexibleDatesFilterReady(
      FlexibleDatesFilter dates,
      int minDuration,
      int maxDuration,
      DateTime minDate,
      DateTime maxDate) = _$_FlexibleDatesFilterReady;

  @override
  FlexibleDatesFilter get dates;
  @override
  int get minDuration;
  @override
  int get maxDuration;
  @override
  DateTime get minDate;
  @override
  DateTime get maxDate;
  @override
  _$FlexibleDatesFilterReadyCopyWith<_FlexibleDatesFilterReady> get copyWith;
}
