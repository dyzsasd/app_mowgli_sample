// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_budget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BudgetFilterStateTearOff {
  const _$BudgetFilterStateTearOff();

// ignore: unused_element
  _BudgetFilter call(BudgetFilter budget, int minValue, int maxValue) {
    return _BudgetFilter(
      budget,
      minValue,
      maxValue,
    );
  }

// ignore: unused_element
  _BudgetFilterInitial initial(
      BudgetFilter budget, int minValue, int maxValue) {
    return _BudgetFilterInitial(
      budget,
      minValue,
      maxValue,
    );
  }

// ignore: unused_element
  _BudgetFilterReady ready(BudgetFilter budget, int minValue, int maxValue) {
    return _BudgetFilterReady(
      budget,
      minValue,
      maxValue,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BudgetFilterState = _$BudgetFilterStateTearOff();

/// @nodoc
mixin _$BudgetFilterState {
  BudgetFilter get budget;
  int get minValue;
  int get maxValue;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    @required Result initial(BudgetFilter budget, int minValue, int maxValue),
    @required Result ready(BudgetFilter budget, int minValue, int maxValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    Result initial(BudgetFilter budget, int minValue, int maxValue),
    Result ready(BudgetFilter budget, int minValue, int maxValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BudgetFilter value), {
    @required Result initial(_BudgetFilterInitial value),
    @required Result ready(_BudgetFilterReady value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BudgetFilter value), {
    Result initial(_BudgetFilterInitial value),
    Result ready(_BudgetFilterReady value),
    @required Result orElse(),
  });

  $BudgetFilterStateCopyWith<BudgetFilterState> get copyWith;
}

/// @nodoc
abstract class $BudgetFilterStateCopyWith<$Res> {
  factory $BudgetFilterStateCopyWith(
          BudgetFilterState value, $Res Function(BudgetFilterState) then) =
      _$BudgetFilterStateCopyWithImpl<$Res>;
  $Res call({BudgetFilter budget, int minValue, int maxValue});

  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class _$BudgetFilterStateCopyWithImpl<$Res>
    implements $BudgetFilterStateCopyWith<$Res> {
  _$BudgetFilterStateCopyWithImpl(this._value, this._then);

  final BudgetFilterState _value;
  // ignore: unused_field
  final $Res Function(BudgetFilterState) _then;

  @override
  $Res call({
    Object budget = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_value.copyWith(
      budget: budget == freezed ? _value.budget : budget as BudgetFilter,
      minValue: minValue == freezed ? _value.minValue : minValue as int,
      maxValue: maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
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
abstract class _$BudgetFilterCopyWith<$Res>
    implements $BudgetFilterStateCopyWith<$Res> {
  factory _$BudgetFilterCopyWith(
          _BudgetFilter value, $Res Function(_BudgetFilter) then) =
      __$BudgetFilterCopyWithImpl<$Res>;
  @override
  $Res call({BudgetFilter budget, int minValue, int maxValue});

  @override
  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class __$BudgetFilterCopyWithImpl<$Res>
    extends _$BudgetFilterStateCopyWithImpl<$Res>
    implements _$BudgetFilterCopyWith<$Res> {
  __$BudgetFilterCopyWithImpl(
      _BudgetFilter _value, $Res Function(_BudgetFilter) _then)
      : super(_value, (v) => _then(v as _BudgetFilter));

  @override
  _BudgetFilter get _value => super._value as _BudgetFilter;

  @override
  $Res call({
    Object budget = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_BudgetFilter(
      budget == freezed ? _value.budget : budget as BudgetFilter,
      minValue == freezed ? _value.minValue : minValue as int,
      maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }
}

/// @nodoc
class _$_BudgetFilter extends _BudgetFilter {
  _$_BudgetFilter(this.budget, this.minValue, this.maxValue)
      : assert(budget != null),
        assert(minValue != null),
        assert(maxValue != null),
        super._();

  @override
  final BudgetFilter budget;
  @override
  final int minValue;
  @override
  final int maxValue;

  @override
  String toString() {
    return 'BudgetFilterState(budget: $budget, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BudgetFilter &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
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
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue);

  @override
  _$BudgetFilterCopyWith<_BudgetFilter> get copyWith =>
      __$BudgetFilterCopyWithImpl<_BudgetFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    @required Result initial(BudgetFilter budget, int minValue, int maxValue),
    @required Result ready(BudgetFilter budget, int minValue, int maxValue),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(budget, minValue, maxValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    Result initial(BudgetFilter budget, int minValue, int maxValue),
    Result ready(BudgetFilter budget, int minValue, int maxValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(budget, minValue, maxValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BudgetFilter value), {
    @required Result initial(_BudgetFilterInitial value),
    @required Result ready(_BudgetFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BudgetFilter value), {
    Result initial(_BudgetFilterInitial value),
    Result ready(_BudgetFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BudgetFilter extends BudgetFilterState {
  _BudgetFilter._() : super._();
  factory _BudgetFilter(BudgetFilter budget, int minValue, int maxValue) =
      _$_BudgetFilter;

  @override
  BudgetFilter get budget;
  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  _$BudgetFilterCopyWith<_BudgetFilter> get copyWith;
}

/// @nodoc
abstract class _$BudgetFilterInitialCopyWith<$Res>
    implements $BudgetFilterStateCopyWith<$Res> {
  factory _$BudgetFilterInitialCopyWith(_BudgetFilterInitial value,
          $Res Function(_BudgetFilterInitial) then) =
      __$BudgetFilterInitialCopyWithImpl<$Res>;
  @override
  $Res call({BudgetFilter budget, int minValue, int maxValue});

  @override
  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class __$BudgetFilterInitialCopyWithImpl<$Res>
    extends _$BudgetFilterStateCopyWithImpl<$Res>
    implements _$BudgetFilterInitialCopyWith<$Res> {
  __$BudgetFilterInitialCopyWithImpl(
      _BudgetFilterInitial _value, $Res Function(_BudgetFilterInitial) _then)
      : super(_value, (v) => _then(v as _BudgetFilterInitial));

  @override
  _BudgetFilterInitial get _value => super._value as _BudgetFilterInitial;

  @override
  $Res call({
    Object budget = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_BudgetFilterInitial(
      budget == freezed ? _value.budget : budget as BudgetFilter,
      minValue == freezed ? _value.minValue : minValue as int,
      maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }
}

/// @nodoc
class _$_BudgetFilterInitial extends _BudgetFilterInitial {
  _$_BudgetFilterInitial(this.budget, this.minValue, this.maxValue)
      : assert(budget != null),
        assert(minValue != null),
        assert(maxValue != null),
        super._();

  @override
  final BudgetFilter budget;
  @override
  final int minValue;
  @override
  final int maxValue;

  @override
  String toString() {
    return 'BudgetFilterState.initial(budget: $budget, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BudgetFilterInitial &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
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
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue);

  @override
  _$BudgetFilterInitialCopyWith<_BudgetFilterInitial> get copyWith =>
      __$BudgetFilterInitialCopyWithImpl<_BudgetFilterInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    @required Result initial(BudgetFilter budget, int minValue, int maxValue),
    @required Result ready(BudgetFilter budget, int minValue, int maxValue),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(budget, minValue, maxValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    Result initial(BudgetFilter budget, int minValue, int maxValue),
    Result ready(BudgetFilter budget, int minValue, int maxValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(budget, minValue, maxValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BudgetFilter value), {
    @required Result initial(_BudgetFilterInitial value),
    @required Result ready(_BudgetFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BudgetFilter value), {
    Result initial(_BudgetFilterInitial value),
    Result ready(_BudgetFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _BudgetFilterInitial extends BudgetFilterState {
  _BudgetFilterInitial._() : super._();
  factory _BudgetFilterInitial(
      BudgetFilter budget, int minValue, int maxValue) = _$_BudgetFilterInitial;

  @override
  BudgetFilter get budget;
  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  _$BudgetFilterInitialCopyWith<_BudgetFilterInitial> get copyWith;
}

/// @nodoc
abstract class _$BudgetFilterReadyCopyWith<$Res>
    implements $BudgetFilterStateCopyWith<$Res> {
  factory _$BudgetFilterReadyCopyWith(
          _BudgetFilterReady value, $Res Function(_BudgetFilterReady) then) =
      __$BudgetFilterReadyCopyWithImpl<$Res>;
  @override
  $Res call({BudgetFilter budget, int minValue, int maxValue});

  @override
  $BudgetFilterCopyWith<$Res> get budget;
}

/// @nodoc
class __$BudgetFilterReadyCopyWithImpl<$Res>
    extends _$BudgetFilterStateCopyWithImpl<$Res>
    implements _$BudgetFilterReadyCopyWith<$Res> {
  __$BudgetFilterReadyCopyWithImpl(
      _BudgetFilterReady _value, $Res Function(_BudgetFilterReady) _then)
      : super(_value, (v) => _then(v as _BudgetFilterReady));

  @override
  _BudgetFilterReady get _value => super._value as _BudgetFilterReady;

  @override
  $Res call({
    Object budget = freezed,
    Object minValue = freezed,
    Object maxValue = freezed,
  }) {
    return _then(_BudgetFilterReady(
      budget == freezed ? _value.budget : budget as BudgetFilter,
      minValue == freezed ? _value.minValue : minValue as int,
      maxValue == freezed ? _value.maxValue : maxValue as int,
    ));
  }
}

/// @nodoc
class _$_BudgetFilterReady extends _BudgetFilterReady {
  _$_BudgetFilterReady(this.budget, this.minValue, this.maxValue)
      : assert(budget != null),
        assert(minValue != null),
        assert(maxValue != null),
        super._();

  @override
  final BudgetFilter budget;
  @override
  final int minValue;
  @override
  final int maxValue;

  @override
  String toString() {
    return 'BudgetFilterState.ready(budget: $budget, minValue: $minValue, maxValue: $maxValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BudgetFilterReady &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
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
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue);

  @override
  _$BudgetFilterReadyCopyWith<_BudgetFilterReady> get copyWith =>
      __$BudgetFilterReadyCopyWithImpl<_BudgetFilterReady>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    @required Result initial(BudgetFilter budget, int minValue, int maxValue),
    @required Result ready(BudgetFilter budget, int minValue, int maxValue),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(budget, minValue, maxValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(BudgetFilter budget, int minValue, int maxValue), {
    Result initial(BudgetFilter budget, int minValue, int maxValue),
    Result ready(BudgetFilter budget, int minValue, int maxValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(budget, minValue, maxValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_BudgetFilter value), {
    @required Result initial(_BudgetFilterInitial value),
    @required Result ready(_BudgetFilterReady value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_BudgetFilter value), {
    Result initial(_BudgetFilterInitial value),
    Result ready(_BudgetFilterReady value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _BudgetFilterReady extends BudgetFilterState {
  _BudgetFilterReady._() : super._();
  factory _BudgetFilterReady(BudgetFilter budget, int minValue, int maxValue) =
      _$_BudgetFilterReady;

  @override
  BudgetFilter get budget;
  @override
  int get minValue;
  @override
  int get maxValue;
  @override
  _$BudgetFilterReadyCopyWith<_BudgetFilterReady> get copyWith;
}
