// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'homepage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

// ignore: unused_element
  _Homepage call({@required HomePageContent data}) {
    return _Homepage(
      data: data,
    );
  }

// ignore: unused_element
  _Loading loading({HomePageLocation location}) {
    return _Loading(
      location: location,
    );
  }

// ignore: unused_element
  _Empty empty({HomePageLocation location}) {
    return _Empty(
      location: location,
    );
  }

// ignore: unused_element
  _Error error({HomePageLocation location}) {
    return _Error(
      location: location,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(HomePageContent data), {
    @required Result loading(HomePageLocation location),
    @required Result empty(HomePageLocation location),
    @required Result error(HomePageLocation location),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(HomePageContent data), {
    Result loading(HomePageLocation location),
    Result empty(HomePageLocation location),
    Result error(HomePageLocation location),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Homepage value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Homepage value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;
}

/// @nodoc
abstract class _$HomepageCopyWith<$Res> {
  factory _$HomepageCopyWith(_Homepage value, $Res Function(_Homepage) then) =
      __$HomepageCopyWithImpl<$Res>;
  $Res call({HomePageContent data});
}

/// @nodoc
class __$HomepageCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res>
    implements _$HomepageCopyWith<$Res> {
  __$HomepageCopyWithImpl(_Homepage _value, $Res Function(_Homepage) _then)
      : super(_value, (v) => _then(v as _Homepage));

  @override
  _Homepage get _value => super._value as _Homepage;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_Homepage(
      data: data == freezed ? _value.data : data as HomePageContent,
    ));
  }
}

/// @nodoc
class _$_Homepage implements _Homepage {
  _$_Homepage({@required this.data}) : assert(data != null);

  @override
  final HomePageContent data;

  @override
  String toString() {
    return 'HomePageState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Homepage &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$HomepageCopyWith<_Homepage> get copyWith =>
      __$HomepageCopyWithImpl<_Homepage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(HomePageContent data), {
    @required Result loading(HomePageLocation location),
    @required Result empty(HomePageLocation location),
    @required Result error(HomePageLocation location),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return $default(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(HomePageContent data), {
    Result loading(HomePageLocation location),
    Result empty(HomePageLocation location),
    Result error(HomePageLocation location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Homepage value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Homepage value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class _Homepage implements HomePageState {
  factory _Homepage({@required HomePageContent data}) = _$_Homepage;

  HomePageContent get data;
  _$HomepageCopyWith<_Homepage> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({HomePageLocation location});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_Loading(
      location:
          location == freezed ? _value.location : location as HomePageLocation,
    ));
  }
}

/// @nodoc
class _$_Loading implements _Loading {
  _$_Loading({this.location});

  @override
  final HomePageLocation location;

  @override
  String toString() {
    return 'HomePageState.loading(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(HomePageContent data), {
    @required Result loading(HomePageLocation location),
    @required Result empty(HomePageLocation location),
    @required Result error(HomePageLocation location),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return loading(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(HomePageContent data), {
    Result loading(HomePageLocation location),
    Result empty(HomePageLocation location),
    Result error(HomePageLocation location),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Homepage value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Homepage value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class _Loading implements HomePageState {
  factory _Loading({HomePageLocation location}) = _$_Loading;

  HomePageLocation get location;
  _$LoadingCopyWith<_Loading> get copyWith;
}

/// @nodoc
abstract class _$EmptyCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
  $Res call({HomePageLocation location});
}

/// @nodoc
class __$EmptyCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res>
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
      location:
          location == freezed ? _value.location : location as HomePageLocation,
    ));
  }
}

/// @nodoc
class _$_Empty implements _Empty {
  _$_Empty({this.location});

  @override
  final HomePageLocation location;

  @override
  String toString() {
    return 'HomePageState.empty(location: $location)';
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
    Result $default(HomePageContent data), {
    @required Result loading(HomePageLocation location),
    @required Result empty(HomePageLocation location),
    @required Result error(HomePageLocation location),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return empty(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(HomePageContent data), {
    Result loading(HomePageLocation location),
    Result empty(HomePageLocation location),
    Result error(HomePageLocation location),
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
    Result $default(_Homepage value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Homepage value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class _Empty implements HomePageState {
  factory _Empty({HomePageLocation location}) = _$_Empty;

  HomePageLocation get location;
  _$EmptyCopyWith<_Empty> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({HomePageLocation location});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res>
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
      location:
          location == freezed ? _value.location : location as HomePageLocation,
    ));
  }
}

/// @nodoc
class _$_Error implements _Error {
  _$_Error({this.location});

  @override
  final HomePageLocation location;

  @override
  String toString() {
    return 'HomePageState.error(location: $location)';
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
    Result $default(HomePageContent data), {
    @required Result loading(HomePageLocation location),
    @required Result empty(HomePageLocation location),
    @required Result error(HomePageLocation location),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return error(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(HomePageContent data), {
    Result loading(HomePageLocation location),
    Result empty(HomePageLocation location),
    Result error(HomePageLocation location),
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
    Result $default(_Homepage value), {
    @required Result loading(_Loading value),
    @required Result empty(_Empty value),
    @required Result error(_Error value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(empty != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Homepage value), {
    Result loading(_Loading value),
    Result empty(_Empty value),
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

abstract class _Error implements HomePageState {
  factory _Error({HomePageLocation location}) = _$_Error;

  HomePageLocation get location;
  _$ErrorCopyWith<_Error> get copyWith;
}
