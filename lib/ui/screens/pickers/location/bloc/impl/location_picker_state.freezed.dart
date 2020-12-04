// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LocationPickerStateTearOff {
  const _$LocationPickerStateTearOff();

// ignore: unused_element
  LocationPickerDataState call(
      {@required LocationPickerSuggestions data,
      LocationPickerSuggestionItem location,
      bool showValidateButton}) {
    return LocationPickerDataState(
      data: data,
      location: location,
      showValidateButton: showValidateButton,
    );
  }

// ignore: unused_element
  _Initial initial({LocationPickerSuggestionItem location}) {
    return _Initial(
      location: location,
    );
  }

// ignore: unused_element
  LocationPickerReadyState ready(
      {LocationPickerSuggestionItem location,
      Iterable<LocationPickerSuggestionItem> airports}) {
    return LocationPickerReadyState(
      location: location,
      airports: airports,
    );
  }

// ignore: unused_element
  _Empty empty({LocationPickerSuggestionItem location}) {
    return _Empty(
      location: location,
    );
  }

// ignore: unused_element
  _Loading loading(
      {LocationPickerSuggestionItem location,
      LocationPickerSuggestions previousSuggestions}) {
    return _Loading(
      location: location,
      previousSuggestions: previousSuggestions,
    );
  }

// ignore: unused_element
  _Error error({LocationPickerSuggestionItem location}) {
    return _Error(
      location: location,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LocationPickerState = _$LocationPickerStateTearOff();

/// @nodoc
mixin _$LocationPickerState {
  LocationPickerSuggestionItem get location;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  });

  $LocationPickerStateCopyWith<LocationPickerState> get copyWith;
}

/// @nodoc
abstract class $LocationPickerStateCopyWith<$Res> {
  factory $LocationPickerStateCopyWith(
          LocationPickerState value, $Res Function(LocationPickerState) then) =
      _$LocationPickerStateCopyWithImpl<$Res>;
  $Res call({LocationPickerSuggestionItem location});
}

/// @nodoc
class _$LocationPickerStateCopyWithImpl<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  _$LocationPickerStateCopyWithImpl(this._value, this._then);

  final LocationPickerState _value;
  // ignore: unused_field
  final $Res Function(LocationPickerState) _then;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
    ));
  }
}

/// @nodoc
abstract class $LocationPickerDataStateCopyWith<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  factory $LocationPickerDataStateCopyWith(LocationPickerDataState value,
          $Res Function(LocationPickerDataState) then) =
      _$LocationPickerDataStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LocationPickerSuggestions data,
      LocationPickerSuggestionItem location,
      bool showValidateButton});
}

/// @nodoc
class _$LocationPickerDataStateCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res>
    implements $LocationPickerDataStateCopyWith<$Res> {
  _$LocationPickerDataStateCopyWithImpl(LocationPickerDataState _value,
      $Res Function(LocationPickerDataState) _then)
      : super(_value, (v) => _then(v as LocationPickerDataState));

  @override
  LocationPickerDataState get _value => super._value as LocationPickerDataState;

  @override
  $Res call({
    Object data = freezed,
    Object location = freezed,
    Object showValidateButton = freezed,
  }) {
    return _then(LocationPickerDataState(
      data: data == freezed ? _value.data : data as LocationPickerSuggestions,
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
      showValidateButton: showValidateButton == freezed
          ? _value.showValidateButton
          : showValidateButton as bool,
    ));
  }
}

/// @nodoc
class _$LocationPickerDataState extends LocationPickerDataState {
  _$LocationPickerDataState(
      {@required this.data, this.location, this.showValidateButton})
      : assert(data != null),
        super._();

  @override
  final LocationPickerSuggestions data;
  @override
  final LocationPickerSuggestionItem location;
  @override
  final bool showValidateButton;

  @override
  String toString() {
    return 'LocationPickerState(data: $data, location: $location, showValidateButton: $showValidateButton)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocationPickerDataState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.showValidateButton, showValidateButton) ||
                const DeepCollectionEquality()
                    .equals(other.showValidateButton, showValidateButton)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(showValidateButton);

  @override
  $LocationPickerDataStateCopyWith<LocationPickerDataState> get copyWith =>
      _$LocationPickerDataStateCopyWithImpl<LocationPickerDataState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return $default(data, location, showValidateButton);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(data, location, showValidateButton);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
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

abstract class LocationPickerDataState extends LocationPickerState {
  LocationPickerDataState._() : super._();
  factory LocationPickerDataState(
      {@required LocationPickerSuggestions data,
      LocationPickerSuggestionItem location,
      bool showValidateButton}) = _$LocationPickerDataState;

  LocationPickerSuggestions get data;
  @override
  LocationPickerSuggestionItem get location;
  bool get showValidateButton;
  @override
  $LocationPickerDataStateCopyWith<LocationPickerDataState> get copyWith;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({LocationPickerSuggestionItem location});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_Initial(
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
    ));
  }
}

/// @nodoc
class _$_Initial extends _Initial {
  _$_Initial({this.location}) : super._();

  @override
  final LocationPickerSuggestionItem location;

  @override
  String toString() {
    return 'LocationPickerState.initial(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return initial(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
    Result empty(_Empty value),
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

abstract class _Initial extends LocationPickerState {
  _Initial._() : super._();
  factory _Initial({LocationPickerSuggestionItem location}) = _$_Initial;

  @override
  LocationPickerSuggestionItem get location;
  @override
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class $LocationPickerReadyStateCopyWith<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  factory $LocationPickerReadyStateCopyWith(LocationPickerReadyState value,
          $Res Function(LocationPickerReadyState) then) =
      _$LocationPickerReadyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LocationPickerSuggestionItem location,
      Iterable<LocationPickerSuggestionItem> airports});
}

/// @nodoc
class _$LocationPickerReadyStateCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res>
    implements $LocationPickerReadyStateCopyWith<$Res> {
  _$LocationPickerReadyStateCopyWithImpl(LocationPickerReadyState _value,
      $Res Function(LocationPickerReadyState) _then)
      : super(_value, (v) => _then(v as LocationPickerReadyState));

  @override
  LocationPickerReadyState get _value =>
      super._value as LocationPickerReadyState;

  @override
  $Res call({
    Object location = freezed,
    Object airports = freezed,
  }) {
    return _then(LocationPickerReadyState(
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
      airports: airports == freezed
          ? _value.airports
          : airports as Iterable<LocationPickerSuggestionItem>,
    ));
  }
}

/// @nodoc
class _$LocationPickerReadyState extends LocationPickerReadyState {
  _$LocationPickerReadyState({this.location, this.airports}) : super._();

  @override
  final LocationPickerSuggestionItem location;
  @override
  final Iterable<LocationPickerSuggestionItem> airports;

  @override
  String toString() {
    return 'LocationPickerState.ready(location: $location, airports: $airports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocationPickerReadyState &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.airports, airports) ||
                const DeepCollectionEquality()
                    .equals(other.airports, airports)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(airports);

  @override
  $LocationPickerReadyStateCopyWith<LocationPickerReadyState> get copyWith =>
      _$LocationPickerReadyStateCopyWithImpl<LocationPickerReadyState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return ready(location, airports);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(location, airports);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class LocationPickerReadyState extends LocationPickerState {
  LocationPickerReadyState._() : super._();
  factory LocationPickerReadyState(
          {LocationPickerSuggestionItem location,
          Iterable<LocationPickerSuggestionItem> airports}) =
      _$LocationPickerReadyState;

  @override
  LocationPickerSuggestionItem get location;
  Iterable<LocationPickerSuggestionItem> get airports;
  @override
  $LocationPickerReadyStateCopyWith<LocationPickerReadyState> get copyWith;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
  @override
  $Res call({LocationPickerSuggestionItem location});
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$LocationPickerStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_Empty(
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
    ));
  }
}

/// @nodoc
class _$_Empty extends _Empty {
  _$_Empty({this.location}) : super._();

  @override
  final LocationPickerSuggestionItem location;

  @override
  String toString() {
    return 'LocationPickerState.empty(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Empty &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  _$EmptyCopyWith<_Empty> get copyWith =>
      __$EmptyCopyWithImpl<_Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return empty(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
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

abstract class _Empty extends LocationPickerState {
  _Empty._() : super._();
  factory _Empty({LocationPickerSuggestionItem location}) = _$_Empty;

  @override
  LocationPickerSuggestionItem get location;
  @override
  _$EmptyCopyWith<_Empty> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {LocationPickerSuggestionItem location,
      LocationPickerSuggestions previousSuggestions});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$LocationPickerStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object location = freezed,
    Object previousSuggestions = freezed,
  }) {
    return _then(_Loading(
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
      previousSuggestions: previousSuggestions == freezed
          ? _value.previousSuggestions
          : previousSuggestions as LocationPickerSuggestions,
    ));
  }
}

/// @nodoc
class _$_Loading extends _Loading {
  _$_Loading({this.location, this.previousSuggestions}) : super._();

  @override
  final LocationPickerSuggestionItem location;
  @override
  final LocationPickerSuggestions previousSuggestions;

  @override
  String toString() {
    return 'LocationPickerState.loading(location: $location, previousSuggestions: $previousSuggestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.previousSuggestions, previousSuggestions) ||
                const DeepCollectionEquality()
                    .equals(other.previousSuggestions, previousSuggestions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(previousSuggestions);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return loading(location, previousSuggestions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(location, previousSuggestions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
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

abstract class _Loading extends LocationPickerState {
  _Loading._() : super._();
  factory _Loading(
      {LocationPickerSuggestionItem location,
      LocationPickerSuggestions previousSuggestions}) = _$_Loading;

  @override
  LocationPickerSuggestionItem get location;
  LocationPickerSuggestions get previousSuggestions;
  @override
  _$LoadingCopyWith<_Loading> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $LocationPickerStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({LocationPickerSuggestionItem location});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$LocationPickerStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_Error(
      location: location == freezed
          ? _value.location
          : location as LocationPickerSuggestionItem,
    ));
  }
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error({this.location}) : super._();

  @override
  final LocationPickerSuggestionItem location;

  @override
  String toString() {
    return 'LocationPickerState.error(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    @required Result initial(LocationPickerSuggestionItem location),
    @required
        Result ready(LocationPickerSuggestionItem location,
            Iterable<LocationPickerSuggestionItem> airports),
    @required Result empty(LocationPickerSuggestionItem location),
    @required
        Result loading(LocationPickerSuggestionItem location,
            LocationPickerSuggestions previousSuggestions),
    @required Result error(LocationPickerSuggestionItem location),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return error(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(LocationPickerSuggestions data,
        LocationPickerSuggestionItem location, bool showValidateButton), {
    Result initial(LocationPickerSuggestionItem location),
    Result ready(LocationPickerSuggestionItem location,
        Iterable<LocationPickerSuggestionItem> airports),
    Result empty(LocationPickerSuggestionItem location),
    Result loading(LocationPickerSuggestionItem location,
        LocationPickerSuggestions previousSuggestions),
    Result error(LocationPickerSuggestionItem location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    @required Result initial(_Initial value),
    @required Result ready(LocationPickerReadyState value),
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(ready != null);
    assert(empty != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(LocationPickerDataState value), {
    Result initial(_Initial value),
    Result ready(LocationPickerReadyState value),
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

abstract class _Error extends LocationPickerState {
  _Error._() : super._();
  factory _Error({LocationPickerSuggestionItem location}) = _$_Error;

  @override
  LocationPickerSuggestionItem get location;
  @override
  _$ErrorCopyWith<_Error> get copyWith;
}
