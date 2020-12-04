// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'filters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FiltersStateTearOff {
  const _$FiltersStateTearOff();

// ignore: unused_element
  FiltersDataState call(
      {@required Filters currentFilters, Filters initialFilters}) {
    return FiltersDataState(
      currentFilters: currentFilters,
      initialFilters: initialFilters,
    );
  }

// ignore: unused_element
  _FiltersEmptyState empty({Filters initialFilters}) {
    return _FiltersEmptyState(
      initialFilters: initialFilters,
    );
  }

// ignore: unused_element
  FiltersReadyState ready(
      {@required Filters currentFilters, Filters initialFilters}) {
    return FiltersReadyState(
      currentFilters: currentFilters,
      initialFilters: initialFilters,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FiltersState = _$FiltersStateTearOff();

/// @nodoc
mixin _$FiltersState {
  Filters get initialFilters;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    @required Result empty(Filters initialFilters),
    @required Result ready(Filters currentFilters, Filters initialFilters),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    Result empty(Filters initialFilters),
    Result ready(Filters currentFilters, Filters initialFilters),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FiltersDataState value), {
    @required Result empty(_FiltersEmptyState value),
    @required Result ready(FiltersReadyState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FiltersDataState value), {
    Result empty(_FiltersEmptyState value),
    Result ready(FiltersReadyState value),
    @required Result orElse(),
  });

  $FiltersStateCopyWith<FiltersState> get copyWith;
}

/// @nodoc
abstract class $FiltersStateCopyWith<$Res> {
  factory $FiltersStateCopyWith(
          FiltersState value, $Res Function(FiltersState) then) =
      _$FiltersStateCopyWithImpl<$Res>;
  $Res call({Filters initialFilters});

  $FiltersCopyWith<$Res> get initialFilters;
}

/// @nodoc
class _$FiltersStateCopyWithImpl<$Res> implements $FiltersStateCopyWith<$Res> {
  _$FiltersStateCopyWithImpl(this._value, this._then);

  final FiltersState _value;
  // ignore: unused_field
  final $Res Function(FiltersState) _then;

  @override
  $Res call({
    Object initialFilters = freezed,
  }) {
    return _then(_value.copyWith(
      initialFilters: initialFilters == freezed
          ? _value.initialFilters
          : initialFilters as Filters,
    ));
  }

  @override
  $FiltersCopyWith<$Res> get initialFilters {
    if (_value.initialFilters == null) {
      return null;
    }
    return $FiltersCopyWith<$Res>(_value.initialFilters, (value) {
      return _then(_value.copyWith(initialFilters: value));
    });
  }
}

/// @nodoc
abstract class $FiltersDataStateCopyWith<$Res>
    implements $FiltersStateCopyWith<$Res> {
  factory $FiltersDataStateCopyWith(
          FiltersDataState value, $Res Function(FiltersDataState) then) =
      _$FiltersDataStateCopyWithImpl<$Res>;
  @override
  $Res call({Filters currentFilters, Filters initialFilters});

  $FiltersCopyWith<$Res> get currentFilters;
  @override
  $FiltersCopyWith<$Res> get initialFilters;
}

/// @nodoc
class _$FiltersDataStateCopyWithImpl<$Res>
    extends _$FiltersStateCopyWithImpl<$Res>
    implements $FiltersDataStateCopyWith<$Res> {
  _$FiltersDataStateCopyWithImpl(
      FiltersDataState _value, $Res Function(FiltersDataState) _then)
      : super(_value, (v) => _then(v as FiltersDataState));

  @override
  FiltersDataState get _value => super._value as FiltersDataState;

  @override
  $Res call({
    Object currentFilters = freezed,
    Object initialFilters = freezed,
  }) {
    return _then(FiltersDataState(
      currentFilters: currentFilters == freezed
          ? _value.currentFilters
          : currentFilters as Filters,
      initialFilters: initialFilters == freezed
          ? _value.initialFilters
          : initialFilters as Filters,
    ));
  }

  @override
  $FiltersCopyWith<$Res> get currentFilters {
    if (_value.currentFilters == null) {
      return null;
    }
    return $FiltersCopyWith<$Res>(_value.currentFilters, (value) {
      return _then(_value.copyWith(currentFilters: value));
    });
  }
}

/// @nodoc
class _$FiltersDataState extends FiltersDataState {
  _$FiltersDataState({@required this.currentFilters, this.initialFilters})
      : assert(currentFilters != null),
        super._();

  @override
  final Filters currentFilters;
  @override
  final Filters initialFilters;

  @override
  String toString() {
    return 'FiltersState(currentFilters: $currentFilters, initialFilters: $initialFilters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FiltersDataState &&
            (identical(other.currentFilters, currentFilters) ||
                const DeepCollectionEquality()
                    .equals(other.currentFilters, currentFilters)) &&
            (identical(other.initialFilters, initialFilters) ||
                const DeepCollectionEquality()
                    .equals(other.initialFilters, initialFilters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentFilters) ^
      const DeepCollectionEquality().hash(initialFilters);

  @override
  $FiltersDataStateCopyWith<FiltersDataState> get copyWith =>
      _$FiltersDataStateCopyWithImpl<FiltersDataState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    @required Result empty(Filters initialFilters),
    @required Result ready(Filters currentFilters, Filters initialFilters),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(ready != null);
    return $default(currentFilters, initialFilters);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    Result empty(Filters initialFilters),
    Result ready(Filters currentFilters, Filters initialFilters),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(currentFilters, initialFilters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FiltersDataState value), {
    @required Result empty(_FiltersEmptyState value),
    @required Result ready(FiltersReadyState value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(ready != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FiltersDataState value), {
    Result empty(_FiltersEmptyState value),
    Result ready(FiltersReadyState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class FiltersDataState extends FiltersState {
  FiltersDataState._() : super._();
  factory FiltersDataState(
      {@required Filters currentFilters,
      Filters initialFilters}) = _$FiltersDataState;

  Filters get currentFilters;
  @override
  Filters get initialFilters;
  @override
  $FiltersDataStateCopyWith<FiltersDataState> get copyWith;
}

/// @nodoc
abstract class _$FiltersEmptyStateCopyWith<$Res>
    implements $FiltersStateCopyWith<$Res> {
  factory _$FiltersEmptyStateCopyWith(
          _FiltersEmptyState value, $Res Function(_FiltersEmptyState) then) =
      __$FiltersEmptyStateCopyWithImpl<$Res>;
  @override
  $Res call({Filters initialFilters});

  @override
  $FiltersCopyWith<$Res> get initialFilters;
}

/// @nodoc
class __$FiltersEmptyStateCopyWithImpl<$Res>
    extends _$FiltersStateCopyWithImpl<$Res>
    implements _$FiltersEmptyStateCopyWith<$Res> {
  __$FiltersEmptyStateCopyWithImpl(
      _FiltersEmptyState _value, $Res Function(_FiltersEmptyState) _then)
      : super(_value, (v) => _then(v as _FiltersEmptyState));

  @override
  _FiltersEmptyState get _value => super._value as _FiltersEmptyState;

  @override
  $Res call({
    Object initialFilters = freezed,
  }) {
    return _then(_FiltersEmptyState(
      initialFilters: initialFilters == freezed
          ? _value.initialFilters
          : initialFilters as Filters,
    ));
  }
}

/// @nodoc
class _$_FiltersEmptyState extends _FiltersEmptyState {
  _$_FiltersEmptyState({this.initialFilters}) : super._();

  @override
  final Filters initialFilters;

  @override
  String toString() {
    return 'FiltersState.empty(initialFilters: $initialFilters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FiltersEmptyState &&
            (identical(other.initialFilters, initialFilters) ||
                const DeepCollectionEquality()
                    .equals(other.initialFilters, initialFilters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialFilters);

  @override
  _$FiltersEmptyStateCopyWith<_FiltersEmptyState> get copyWith =>
      __$FiltersEmptyStateCopyWithImpl<_FiltersEmptyState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    @required Result empty(Filters initialFilters),
    @required Result ready(Filters currentFilters, Filters initialFilters),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(ready != null);
    return empty(initialFilters);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    Result empty(Filters initialFilters),
    Result ready(Filters currentFilters, Filters initialFilters),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(initialFilters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FiltersDataState value), {
    @required Result empty(_FiltersEmptyState value),
    @required Result ready(FiltersReadyState value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(ready != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FiltersDataState value), {
    Result empty(_FiltersEmptyState value),
    Result ready(FiltersReadyState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _FiltersEmptyState extends FiltersState {
  _FiltersEmptyState._() : super._();
  factory _FiltersEmptyState({Filters initialFilters}) = _$_FiltersEmptyState;

  @override
  Filters get initialFilters;
  @override
  _$FiltersEmptyStateCopyWith<_FiltersEmptyState> get copyWith;
}

/// @nodoc
abstract class $FiltersReadyStateCopyWith<$Res>
    implements $FiltersStateCopyWith<$Res> {
  factory $FiltersReadyStateCopyWith(
          FiltersReadyState value, $Res Function(FiltersReadyState) then) =
      _$FiltersReadyStateCopyWithImpl<$Res>;
  @override
  $Res call({Filters currentFilters, Filters initialFilters});

  $FiltersCopyWith<$Res> get currentFilters;
  @override
  $FiltersCopyWith<$Res> get initialFilters;
}

/// @nodoc
class _$FiltersReadyStateCopyWithImpl<$Res>
    extends _$FiltersStateCopyWithImpl<$Res>
    implements $FiltersReadyStateCopyWith<$Res> {
  _$FiltersReadyStateCopyWithImpl(
      FiltersReadyState _value, $Res Function(FiltersReadyState) _then)
      : super(_value, (v) => _then(v as FiltersReadyState));

  @override
  FiltersReadyState get _value => super._value as FiltersReadyState;

  @override
  $Res call({
    Object currentFilters = freezed,
    Object initialFilters = freezed,
  }) {
    return _then(FiltersReadyState(
      currentFilters: currentFilters == freezed
          ? _value.currentFilters
          : currentFilters as Filters,
      initialFilters: initialFilters == freezed
          ? _value.initialFilters
          : initialFilters as Filters,
    ));
  }

  @override
  $FiltersCopyWith<$Res> get currentFilters {
    if (_value.currentFilters == null) {
      return null;
    }
    return $FiltersCopyWith<$Res>(_value.currentFilters, (value) {
      return _then(_value.copyWith(currentFilters: value));
    });
  }
}

/// @nodoc
class _$FiltersReadyState extends FiltersReadyState {
  _$FiltersReadyState({@required this.currentFilters, this.initialFilters})
      : assert(currentFilters != null),
        super._();

  @override
  final Filters currentFilters;
  @override
  final Filters initialFilters;

  @override
  String toString() {
    return 'FiltersState.ready(currentFilters: $currentFilters, initialFilters: $initialFilters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FiltersReadyState &&
            (identical(other.currentFilters, currentFilters) ||
                const DeepCollectionEquality()
                    .equals(other.currentFilters, currentFilters)) &&
            (identical(other.initialFilters, initialFilters) ||
                const DeepCollectionEquality()
                    .equals(other.initialFilters, initialFilters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentFilters) ^
      const DeepCollectionEquality().hash(initialFilters);

  @override
  $FiltersReadyStateCopyWith<FiltersReadyState> get copyWith =>
      _$FiltersReadyStateCopyWithImpl<FiltersReadyState>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    @required Result empty(Filters initialFilters),
    @required Result ready(Filters currentFilters, Filters initialFilters),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(ready != null);
    return ready(currentFilters, initialFilters);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Filters currentFilters, Filters initialFilters), {
    Result empty(Filters initialFilters),
    Result ready(Filters currentFilters, Filters initialFilters),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(currentFilters, initialFilters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(FiltersDataState value), {
    @required Result empty(_FiltersEmptyState value),
    @required Result ready(FiltersReadyState value),
  }) {
    assert($default != null);
    assert(empty != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(FiltersDataState value), {
    Result empty(_FiltersEmptyState value),
    Result ready(FiltersReadyState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class FiltersReadyState extends FiltersState {
  FiltersReadyState._() : super._();
  factory FiltersReadyState(
      {@required Filters currentFilters,
      Filters initialFilters}) = _$FiltersReadyState;

  Filters get currentFilters;
  @override
  Filters get initialFilters;
  @override
  $FiltersReadyStateCopyWith<FiltersReadyState> get copyWith;
}
