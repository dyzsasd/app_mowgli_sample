// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Filters _$FiltersFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _Filters.fromJson(json);
    case 'empty':
      return _EmptyFilters.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$FiltersTearOff {
  const _$FiltersTearOff();

// ignore: unused_element
  _Filters call(
      {DatesFilter dates,
      StopOversFilter stopOvers,
      FlightDurationFilter flightDuration,
      BudgetFilter budget}) {
    return _Filters(
      dates: dates,
      stopOvers: stopOvers,
      flightDuration: flightDuration,
      budget: budget,
    );
  }

// ignore: unused_element
  _EmptyFilters empty(
      {@nullable DatesFilter dates,
      @nullable StopOversFilter stopOvers,
      @nullable FlightDurationFilter flightDuration,
      @nullable BudgetFilter budget}) {
    return _EmptyFilters(
      dates: dates,
      stopOvers: stopOvers,
      flightDuration: flightDuration,
      budget: budget,
    );
  }

// ignore: unused_element
  Filters fromJson(Map<String, Object> json) {
    return Filters.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Filters = _$FiltersTearOff();

/// @nodoc
mixin _$Filters {
  DatesFilter get dates;
  StopOversFilter get stopOvers;
  FlightDurationFilter get flightDuration;
  BudgetFilter get budget;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates, StopOversFilter stopOvers,
        FlightDurationFilter flightDuration, BudgetFilter budget), {
    @required
        Result empty(
            @nullable DatesFilter dates,
            @nullable StopOversFilter stopOvers,
            @nullable FlightDurationFilter flightDuration,
            @nullable BudgetFilter budget),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates, StopOversFilter stopOvers,
        FlightDurationFilter flightDuration, BudgetFilter budget), {
    Result empty(
        @nullable DatesFilter dates,
        @nullable StopOversFilter stopOvers,
        @nullable FlightDurationFilter flightDuration,
        @nullable BudgetFilter budget),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Filters value), {
    @required Result empty(_EmptyFilters value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Filters value), {
    Result empty(_EmptyFilters value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $FiltersCopyWith<Filters> get copyWith;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res>;
  $Res call(
      {DatesFilter dates,
      StopOversFilter stopOvers,
      FlightDurationFilter flightDuration,
      BudgetFilter budget});

  $DatesFilterCopyWith<$Res> get dates;
  $StopOversFilterCopyWith<$Res> get stopOvers;
  $FlightDurationFilterCopyWith<$Res> get flightDuration;
  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res> implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  final Filters _value;
  // ignore: unused_field
  final $Res Function(Filters) _then;

  @override
  $Res call({
    Object dates = freezed,
    Object stopOvers = freezed,
    Object flightDuration = freezed,
    Object budget = freezed,
  }) {
    return _then(_value.copyWith(
      dates: dates == freezed ? _value.dates : dates as DatesFilter,
      stopOvers: stopOvers == freezed
          ? _value.stopOvers
          : stopOvers as StopOversFilter,
      flightDuration: flightDuration == freezed
          ? _value.flightDuration
          : flightDuration as FlightDurationFilter,
      budget: budget == freezed ? _value.budget : budget as BudgetFilter,
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

  @override
  $StopOversFilterCopyWith<$Res> get stopOvers {
    if (_value.stopOvers == null) {
      return null;
    }
    return $StopOversFilterCopyWith<$Res>(_value.stopOvers, (value) {
      return _then(_value.copyWith(stopOvers: value));
    });
  }

  @override
  $FlightDurationFilterCopyWith<$Res> get flightDuration {
    if (_value.flightDuration == null) {
      return null;
    }
    return $FlightDurationFilterCopyWith<$Res>(_value.flightDuration, (value) {
      return _then(_value.copyWith(flightDuration: value));
    });
  }

  @override
  $BudgetFilterCopyWith<$Res> get budget {
    if (_value.budget == null) {
      return null;
    }
    return $BudgetFilterCopyWith<$Res>(_value.budget, (value) {
      return _then(_value.copyWith(budget: value));
    });
  }
}

/// @nodoc
abstract class _$FiltersCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$FiltersCopyWith(_Filters value, $Res Function(_Filters) then) =
      __$FiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {DatesFilter dates,
      StopOversFilter stopOvers,
      FlightDurationFilter flightDuration,
      BudgetFilter budget});

  @override
  $DatesFilterCopyWith<$Res> get dates;
  @override
  $StopOversFilterCopyWith<$Res> get stopOvers;
  @override
  $FlightDurationFilterCopyWith<$Res> get flightDuration;
  @override
  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class __$FiltersCopyWithImpl<$Res> extends _$FiltersCopyWithImpl<$Res>
    implements _$FiltersCopyWith<$Res> {
  __$FiltersCopyWithImpl(_Filters _value, $Res Function(_Filters) _then)
      : super(_value, (v) => _then(v as _Filters));

  @override
  _Filters get _value => super._value as _Filters;

  @override
  $Res call({
    Object dates = freezed,
    Object stopOvers = freezed,
    Object flightDuration = freezed,
    Object budget = freezed,
  }) {
    return _then(_Filters(
      dates: dates == freezed ? _value.dates : dates as DatesFilter,
      stopOvers: stopOvers == freezed
          ? _value.stopOvers
          : stopOvers as StopOversFilter,
      flightDuration: flightDuration == freezed
          ? _value.flightDuration
          : flightDuration as FlightDurationFilter,
      budget: budget == freezed ? _value.budget : budget as BudgetFilter,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_Filters extends _Filters {
  const _$_Filters(
      {this.dates, this.stopOvers, this.flightDuration, this.budget})
      : super._();

  factory _$_Filters.fromJson(Map<String, dynamic> json) =>
      _$_$_FiltersFromJson(json);

  @override
  final DatesFilter dates;
  @override
  final StopOversFilter stopOvers;
  @override
  final FlightDurationFilter flightDuration;
  @override
  final BudgetFilter budget;

  @override
  String toString() {
    return 'Filters(dates: $dates, stopOvers: $stopOvers, flightDuration: $flightDuration, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Filters &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)) &&
            (identical(other.stopOvers, stopOvers) ||
                const DeepCollectionEquality()
                    .equals(other.stopOvers, stopOvers)) &&
            (identical(other.flightDuration, flightDuration) ||
                const DeepCollectionEquality()
                    .equals(other.flightDuration, flightDuration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dates) ^
      const DeepCollectionEquality().hash(stopOvers) ^
      const DeepCollectionEquality().hash(flightDuration) ^
      const DeepCollectionEquality().hash(budget);

  @override
  _$FiltersCopyWith<_Filters> get copyWith =>
      __$FiltersCopyWithImpl<_Filters>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates, StopOversFilter stopOvers,
        FlightDurationFilter flightDuration, BudgetFilter budget), {
    @required
        Result empty(
            @nullable DatesFilter dates,
            @nullable StopOversFilter stopOvers,
            @nullable FlightDurationFilter flightDuration,
            @nullable BudgetFilter budget),
  }) {
    assert($default != null);
    assert(empty != null);
    return $default(dates, stopOvers, flightDuration, budget);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates, StopOversFilter stopOvers,
        FlightDurationFilter flightDuration, BudgetFilter budget), {
    Result empty(
        @nullable DatesFilter dates,
        @nullable StopOversFilter stopOvers,
        @nullable FlightDurationFilter flightDuration,
        @nullable BudgetFilter budget),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(dates, stopOvers, flightDuration, budget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Filters value), {
    @required Result empty(_EmptyFilters value),
  }) {
    assert($default != null);
    assert(empty != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Filters value), {
    Result empty(_EmptyFilters value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FiltersToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _Filters extends Filters {
  const _Filters._() : super._();
  const factory _Filters(
      {DatesFilter dates,
      StopOversFilter stopOvers,
      FlightDurationFilter flightDuration,
      BudgetFilter budget}) = _$_Filters;

  factory _Filters.fromJson(Map<String, dynamic> json) = _$_Filters.fromJson;

  @override
  DatesFilter get dates;
  @override
  StopOversFilter get stopOvers;
  @override
  FlightDurationFilter get flightDuration;
  @override
  BudgetFilter get budget;
  @override
  _$FiltersCopyWith<_Filters> get copyWith;
}

/// @nodoc
abstract class _$EmptyFiltersCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$EmptyFiltersCopyWith(
          _EmptyFilters value, $Res Function(_EmptyFilters) then) =
      __$EmptyFiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable DatesFilter dates,
      @nullable StopOversFilter stopOvers,
      @nullable FlightDurationFilter flightDuration,
      @nullable BudgetFilter budget});

  @override
  $DatesFilterCopyWith<$Res> get dates;
  @override
  $StopOversFilterCopyWith<$Res> get stopOvers;
  @override
  $FlightDurationFilterCopyWith<$Res> get flightDuration;
  @override
  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class __$EmptyFiltersCopyWithImpl<$Res> extends _$FiltersCopyWithImpl<$Res>
    implements _$EmptyFiltersCopyWith<$Res> {
  __$EmptyFiltersCopyWithImpl(
      _EmptyFilters _value, $Res Function(_EmptyFilters) _then)
      : super(_value, (v) => _then(v as _EmptyFilters));

  @override
  _EmptyFilters get _value => super._value as _EmptyFilters;

  @override
  $Res call({
    Object dates = freezed,
    Object stopOvers = freezed,
    Object flightDuration = freezed,
    Object budget = freezed,
  }) {
    return _then(_EmptyFilters(
      dates: dates == freezed ? _value.dates : dates as DatesFilter,
      stopOvers: stopOvers == freezed
          ? _value.stopOvers
          : stopOvers as StopOversFilter,
      flightDuration: flightDuration == freezed
          ? _value.flightDuration
          : flightDuration as FlightDurationFilter,
      budget: budget == freezed ? _value.budget : budget as BudgetFilter,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_EmptyFilters extends _EmptyFilters {
  const _$_EmptyFilters(
      {@nullable this.dates,
      @nullable this.stopOvers,
      @nullable this.flightDuration,
      @nullable this.budget})
      : super._();

  factory _$_EmptyFilters.fromJson(Map<String, dynamic> json) =>
      _$_$_EmptyFiltersFromJson(json);

  @override
  @nullable
  final DatesFilter dates;
  @override
  @nullable
  final StopOversFilter stopOvers;
  @override
  @nullable
  final FlightDurationFilter flightDuration;
  @override
  @nullable
  final BudgetFilter budget;

  @override
  String toString() {
    return 'Filters.empty(dates: $dates, stopOvers: $stopOvers, flightDuration: $flightDuration, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmptyFilters &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)) &&
            (identical(other.stopOvers, stopOvers) ||
                const DeepCollectionEquality()
                    .equals(other.stopOvers, stopOvers)) &&
            (identical(other.flightDuration, flightDuration) ||
                const DeepCollectionEquality()
                    .equals(other.flightDuration, flightDuration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dates) ^
      const DeepCollectionEquality().hash(stopOvers) ^
      const DeepCollectionEquality().hash(flightDuration) ^
      const DeepCollectionEquality().hash(budget);

  @override
  _$EmptyFiltersCopyWith<_EmptyFilters> get copyWith =>
      __$EmptyFiltersCopyWithImpl<_EmptyFilters>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(DatesFilter dates, StopOversFilter stopOvers,
        FlightDurationFilter flightDuration, BudgetFilter budget), {
    @required
        Result empty(
            @nullable DatesFilter dates,
            @nullable StopOversFilter stopOvers,
            @nullable FlightDurationFilter flightDuration,
            @nullable BudgetFilter budget),
  }) {
    assert($default != null);
    assert(empty != null);
    return empty(dates, stopOvers, flightDuration, budget);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(DatesFilter dates, StopOversFilter stopOvers,
        FlightDurationFilter flightDuration, BudgetFilter budget), {
    Result empty(
        @nullable DatesFilter dates,
        @nullable StopOversFilter stopOvers,
        @nullable FlightDurationFilter flightDuration,
        @nullable BudgetFilter budget),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(dates, stopOvers, flightDuration, budget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Filters value), {
    @required Result empty(_EmptyFilters value),
  }) {
    assert($default != null);
    assert(empty != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Filters value), {
    Result empty(_EmptyFilters value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EmptyFiltersToJson(this)..['runtimeType'] = 'empty';
  }
}

abstract class _EmptyFilters extends Filters {
  const _EmptyFilters._() : super._();
  const factory _EmptyFilters(
      {@nullable DatesFilter dates,
      @nullable StopOversFilter stopOvers,
      @nullable FlightDurationFilter flightDuration,
      @nullable BudgetFilter budget}) = _$_EmptyFilters;

  factory _EmptyFilters.fromJson(Map<String, dynamic> json) =
      _$_EmptyFilters.fromJson;

  @override
  @nullable
  DatesFilter get dates;
  @override
  @nullable
  StopOversFilter get stopOvers;
  @override
  @nullable
  FlightDurationFilter get flightDuration;
  @override
  @nullable
  BudgetFilter get budget;
  @override
  _$EmptyFiltersCopyWith<_EmptyFilters> get copyWith;
}
