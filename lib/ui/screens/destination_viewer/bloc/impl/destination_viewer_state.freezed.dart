// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'destination_viewer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DestinationViewerStateTearOff {
  const _$DestinationViewerStateTearOff();

// ignore: unused_element
  _DestinationViewerStateData call({Location location, Request request}) {
    return _DestinationViewerStateData(
      location: location,
      request: request,
    );
  }

// ignore: unused_element
  _DestinationViewerStateInitial initial({Location location, Request request}) {
    return _DestinationViewerStateInitial(
      location: location,
      request: request,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DestinationViewerState = _$DestinationViewerStateTearOff();

/// @nodoc
mixin _$DestinationViewerState {
  Location get location;
  Request get request;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Location location, Request request), {
    @required Result initial(Location location, Request request),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Location location, Request request), {
    Result initial(Location location, Request request),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DestinationViewerStateData value), {
    @required Result initial(_DestinationViewerStateInitial value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DestinationViewerStateData value), {
    Result initial(_DestinationViewerStateInitial value),
    @required Result orElse(),
  });

  $DestinationViewerStateCopyWith<DestinationViewerState> get copyWith;
}

/// @nodoc
abstract class $DestinationViewerStateCopyWith<$Res> {
  factory $DestinationViewerStateCopyWith(DestinationViewerState value,
          $Res Function(DestinationViewerState) then) =
      _$DestinationViewerStateCopyWithImpl<$Res>;
  $Res call({Location location, Request request});

  $RequestCopyWith<$Res> get request;
}

/// @nodoc
class _$DestinationViewerStateCopyWithImpl<$Res>
    implements $DestinationViewerStateCopyWith<$Res> {
  _$DestinationViewerStateCopyWithImpl(this._value, this._then);

  final DestinationViewerState _value;
  // ignore: unused_field
  final $Res Function(DestinationViewerState) _then;

  @override
  $Res call({
    Object location = freezed,
    Object request = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed ? _value.location : location as Location,
      request: request == freezed ? _value.request : request as Request,
    ));
  }

  @override
  $RequestCopyWith<$Res> get request {
    if (_value.request == null) {
      return null;
    }
    return $RequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc
abstract class _$DestinationViewerStateDataCopyWith<$Res>
    implements $DestinationViewerStateCopyWith<$Res> {
  factory _$DestinationViewerStateDataCopyWith(
          _DestinationViewerStateData value,
          $Res Function(_DestinationViewerStateData) then) =
      __$DestinationViewerStateDataCopyWithImpl<$Res>;
  @override
  $Res call({Location location, Request request});

  @override
  $RequestCopyWith<$Res> get request;
}

/// @nodoc
class __$DestinationViewerStateDataCopyWithImpl<$Res>
    extends _$DestinationViewerStateCopyWithImpl<$Res>
    implements _$DestinationViewerStateDataCopyWith<$Res> {
  __$DestinationViewerStateDataCopyWithImpl(_DestinationViewerStateData _value,
      $Res Function(_DestinationViewerStateData) _then)
      : super(_value, (v) => _then(v as _DestinationViewerStateData));

  @override
  _DestinationViewerStateData get _value =>
      super._value as _DestinationViewerStateData;

  @override
  $Res call({
    Object location = freezed,
    Object request = freezed,
  }) {
    return _then(_DestinationViewerStateData(
      location: location == freezed ? _value.location : location as Location,
      request: request == freezed ? _value.request : request as Request,
    ));
  }
}

/// @nodoc
class _$_DestinationViewerStateData extends _DestinationViewerStateData {
  _$_DestinationViewerStateData({this.location, this.request}) : super._();

  @override
  final Location location;
  @override
  final Request request;

  @override
  String toString() {
    return 'DestinationViewerState(location: $location, request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DestinationViewerStateData &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.request, request) ||
                const DeepCollectionEquality().equals(other.request, request)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(request);

  @override
  _$DestinationViewerStateDataCopyWith<_DestinationViewerStateData>
      get copyWith => __$DestinationViewerStateDataCopyWithImpl<
          _DestinationViewerStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Location location, Request request), {
    @required Result initial(Location location, Request request),
  }) {
    assert($default != null);
    assert(initial != null);
    return $default(location, request);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Location location, Request request), {
    Result initial(Location location, Request request),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(location, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DestinationViewerStateData value), {
    @required Result initial(_DestinationViewerStateInitial value),
  }) {
    assert($default != null);
    assert(initial != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DestinationViewerStateData value), {
    Result initial(_DestinationViewerStateInitial value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _DestinationViewerStateData extends DestinationViewerState {
  _DestinationViewerStateData._() : super._();
  factory _DestinationViewerStateData({Location location, Request request}) =
      _$_DestinationViewerStateData;

  @override
  Location get location;
  @override
  Request get request;
  @override
  _$DestinationViewerStateDataCopyWith<_DestinationViewerStateData>
      get copyWith;
}

/// @nodoc
abstract class _$DestinationViewerStateInitialCopyWith<$Res>
    implements $DestinationViewerStateCopyWith<$Res> {
  factory _$DestinationViewerStateInitialCopyWith(
          _DestinationViewerStateInitial value,
          $Res Function(_DestinationViewerStateInitial) then) =
      __$DestinationViewerStateInitialCopyWithImpl<$Res>;
  @override
  $Res call({Location location, Request request});

  @override
  $RequestCopyWith<$Res> get request;
}

/// @nodoc
class __$DestinationViewerStateInitialCopyWithImpl<$Res>
    extends _$DestinationViewerStateCopyWithImpl<$Res>
    implements _$DestinationViewerStateInitialCopyWith<$Res> {
  __$DestinationViewerStateInitialCopyWithImpl(
      _DestinationViewerStateInitial _value,
      $Res Function(_DestinationViewerStateInitial) _then)
      : super(_value, (v) => _then(v as _DestinationViewerStateInitial));

  @override
  _DestinationViewerStateInitial get _value =>
      super._value as _DestinationViewerStateInitial;

  @override
  $Res call({
    Object location = freezed,
    Object request = freezed,
  }) {
    return _then(_DestinationViewerStateInitial(
      location: location == freezed ? _value.location : location as Location,
      request: request == freezed ? _value.request : request as Request,
    ));
  }
}

/// @nodoc
class _$_DestinationViewerStateInitial extends _DestinationViewerStateInitial {
  _$_DestinationViewerStateInitial({this.location, this.request}) : super._();

  @override
  final Location location;
  @override
  final Request request;

  @override
  String toString() {
    return 'DestinationViewerState.initial(location: $location, request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DestinationViewerStateInitial &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.request, request) ||
                const DeepCollectionEquality().equals(other.request, request)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(request);

  @override
  _$DestinationViewerStateInitialCopyWith<_DestinationViewerStateInitial>
      get copyWith => __$DestinationViewerStateInitialCopyWithImpl<
          _DestinationViewerStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(Location location, Request request), {
    @required Result initial(Location location, Request request),
  }) {
    assert($default != null);
    assert(initial != null);
    return initial(location, request);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(Location location, Request request), {
    Result initial(Location location, Request request),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(location, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_DestinationViewerStateData value), {
    @required Result initial(_DestinationViewerStateInitial value),
  }) {
    assert($default != null);
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_DestinationViewerStateData value), {
    Result initial(_DestinationViewerStateInitial value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DestinationViewerStateInitial extends DestinationViewerState {
  _DestinationViewerStateInitial._() : super._();
  factory _DestinationViewerStateInitial({Location location, Request request}) =
      _$_DestinationViewerStateInitial;

  @override
  Location get location;
  @override
  Request get request;
  @override
  _$DestinationViewerStateInitialCopyWith<_DestinationViewerStateInitial>
      get copyWith;
}
