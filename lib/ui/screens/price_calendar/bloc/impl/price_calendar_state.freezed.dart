// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'price_calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PriceCalendarStateTearOff {
  const _$PriceCalendarStateTearOff();

// ignore: unused_element
  _Data call(PriceCalendarContent content) {
    return _Data(
      content,
    );
  }

// ignore: unused_element
  _Initial initial(PriceCalendarContent content) {
    return _Initial(
      content,
    );
  }

// ignore: unused_element
  _Loading loading(PriceCalendarContent content) {
    return _Loading(
      content,
    );
  }

// ignore: unused_element
  _Error error(PriceCalendarContent content) {
    return _Error(
      content,
    );
  }

// ignore: unused_element
  _Ready ready(PriceCalendarContent content, Filters filters, String dealId) {
    return _Ready(
      content,
      filters,
      dealId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PriceCalendarState = _$PriceCalendarStateTearOff();

/// @nodoc
mixin _$PriceCalendarState {
  PriceCalendarContent get content;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    @required Result initial(PriceCalendarContent content),
    @required Result loading(PriceCalendarContent content),
    @required Result error(PriceCalendarContent content),
    @required
        Result ready(
            PriceCalendarContent content, Filters filters, String dealId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    Result initial(PriceCalendarContent content),
    Result loading(PriceCalendarContent content),
    Result error(PriceCalendarContent content),
    Result ready(PriceCalendarContent content, Filters filters, String dealId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Data value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result ready(_Ready value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Data value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    Result ready(_Ready value),
    @required Result orElse(),
  });

  $PriceCalendarStateCopyWith<PriceCalendarState> get copyWith;
}

/// @nodoc
abstract class $PriceCalendarStateCopyWith<$Res> {
  factory $PriceCalendarStateCopyWith(
          PriceCalendarState value, $Res Function(PriceCalendarState) then) =
      _$PriceCalendarStateCopyWithImpl<$Res>;
  $Res call({PriceCalendarContent content});

  $PriceCalendarContentCopyWith<$Res> get content;
}

/// @nodoc
class _$PriceCalendarStateCopyWithImpl<$Res>
    implements $PriceCalendarStateCopyWith<$Res> {
  _$PriceCalendarStateCopyWithImpl(this._value, this._then);

  final PriceCalendarState _value;
  // ignore: unused_field
  final $Res Function(PriceCalendarState) _then;

  @override
  $Res call({
    Object content = freezed,
  }) {
    return _then(_value.copyWith(
      content:
          content == freezed ? _value.content : content as PriceCalendarContent,
    ));
  }

  @override
  $PriceCalendarContentCopyWith<$Res> get content {
    if (_value.content == null) {
      return null;
    }
    return $PriceCalendarContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value));
    });
  }
}

/// @nodoc
abstract class _$DataCopyWith<$Res>
    implements $PriceCalendarStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call({PriceCalendarContent content});

  @override
  $PriceCalendarContentCopyWith<$Res> get content;
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$PriceCalendarStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object content = freezed,
  }) {
    return _then(_Data(
      content == freezed ? _value.content : content as PriceCalendarContent,
    ));
  }
}

/// @nodoc
class _$_Data extends _Data {
  _$_Data(this.content)
      : assert(content != null),
        super._();

  @override
  final PriceCalendarContent content;

  @override
  String toString() {
    return 'PriceCalendarState(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Data &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    @required Result initial(PriceCalendarContent content),
    @required Result loading(PriceCalendarContent content),
    @required Result error(PriceCalendarContent content),
    @required
        Result ready(
            PriceCalendarContent content, Filters filters, String dealId),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return $default(content);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    Result initial(PriceCalendarContent content),
    Result loading(PriceCalendarContent content),
    Result error(PriceCalendarContent content),
    Result ready(PriceCalendarContent content, Filters filters, String dealId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Data value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result ready(_Ready value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Data value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    Result ready(_Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _Data extends PriceCalendarState {
  _Data._() : super._();
  factory _Data(PriceCalendarContent content) = _$_Data;

  @override
  PriceCalendarContent get content;
  @override
  _$DataCopyWith<_Data> get copyWith;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $PriceCalendarStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({PriceCalendarContent content});

  @override
  $PriceCalendarContentCopyWith<$Res> get content;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$PriceCalendarStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object content = freezed,
  }) {
    return _then(_Initial(
      content == freezed ? _value.content : content as PriceCalendarContent,
    ));
  }
}

/// @nodoc
class _$_Initial extends _Initial {
  _$_Initial(this.content)
      : assert(content != null),
        super._();

  @override
  final PriceCalendarContent content;

  @override
  String toString() {
    return 'PriceCalendarState.initial(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    @required Result initial(PriceCalendarContent content),
    @required Result loading(PriceCalendarContent content),
    @required Result error(PriceCalendarContent content),
    @required
        Result ready(
            PriceCalendarContent content, Filters filters, String dealId),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return initial(content);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    Result initial(PriceCalendarContent content),
    Result loading(PriceCalendarContent content),
    Result error(PriceCalendarContent content),
    Result ready(PriceCalendarContent content, Filters filters, String dealId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Data value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result ready(_Ready value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Data value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    Result ready(_Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PriceCalendarState {
  _Initial._() : super._();
  factory _Initial(PriceCalendarContent content) = _$_Initial;

  @override
  PriceCalendarContent get content;
  @override
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $PriceCalendarStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({PriceCalendarContent content});

  @override
  $PriceCalendarContentCopyWith<$Res> get content;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$PriceCalendarStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object content = freezed,
  }) {
    return _then(_Loading(
      content == freezed ? _value.content : content as PriceCalendarContent,
    ));
  }
}

/// @nodoc
class _$_Loading extends _Loading {
  _$_Loading(this.content)
      : assert(content != null),
        super._();

  @override
  final PriceCalendarContent content;

  @override
  String toString() {
    return 'PriceCalendarState.loading(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    @required Result initial(PriceCalendarContent content),
    @required Result loading(PriceCalendarContent content),
    @required Result error(PriceCalendarContent content),
    @required
        Result ready(
            PriceCalendarContent content, Filters filters, String dealId),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return loading(content);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    Result initial(PriceCalendarContent content),
    Result loading(PriceCalendarContent content),
    Result error(PriceCalendarContent content),
    Result ready(PriceCalendarContent content, Filters filters, String dealId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Data value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result ready(_Ready value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Data value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    Result ready(_Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends PriceCalendarState {
  _Loading._() : super._();
  factory _Loading(PriceCalendarContent content) = _$_Loading;

  @override
  PriceCalendarContent get content;
  @override
  _$LoadingCopyWith<_Loading> get copyWith;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $PriceCalendarStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({PriceCalendarContent content});

  @override
  $PriceCalendarContentCopyWith<$Res> get content;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$PriceCalendarStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object content = freezed,
  }) {
    return _then(_Error(
      content == freezed ? _value.content : content as PriceCalendarContent,
    ));
  }
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error(this.content)
      : assert(content != null),
        super._();

  @override
  final PriceCalendarContent content;

  @override
  String toString() {
    return 'PriceCalendarState.error(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    @required Result initial(PriceCalendarContent content),
    @required Result loading(PriceCalendarContent content),
    @required Result error(PriceCalendarContent content),
    @required
        Result ready(
            PriceCalendarContent content, Filters filters, String dealId),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return error(content);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    Result initial(PriceCalendarContent content),
    Result loading(PriceCalendarContent content),
    Result error(PriceCalendarContent content),
    Result ready(PriceCalendarContent content, Filters filters, String dealId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Data value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result ready(_Ready value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Data value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    Result ready(_Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends PriceCalendarState {
  _Error._() : super._();
  factory _Error(PriceCalendarContent content) = _$_Error;

  @override
  PriceCalendarContent get content;
  @override
  _$ErrorCopyWith<_Error> get copyWith;
}

/// @nodoc
abstract class _$ReadyCopyWith<$Res>
    implements $PriceCalendarStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) then) =
      __$ReadyCopyWithImpl<$Res>;
  @override
  $Res call({PriceCalendarContent content, Filters filters, String dealId});

  @override
  $PriceCalendarContentCopyWith<$Res> get content;
  $FiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$ReadyCopyWithImpl<$Res> extends _$PriceCalendarStateCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(_Ready _value, $Res Function(_Ready) _then)
      : super(_value, (v) => _then(v as _Ready));

  @override
  _Ready get _value => super._value as _Ready;

  @override
  $Res call({
    Object content = freezed,
    Object filters = freezed,
    Object dealId = freezed,
  }) {
    return _then(_Ready(
      content == freezed ? _value.content : content as PriceCalendarContent,
      filters == freezed ? _value.filters : filters as Filters,
      dealId == freezed ? _value.dealId : dealId as String,
    ));
  }

  @override
  $FiltersCopyWith<$Res> get filters {
    if (_value.filters == null) {
      return null;
    }
    return $FiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc
class _$_Ready extends _Ready {
  _$_Ready(this.content, this.filters, this.dealId)
      : assert(content != null),
        assert(filters != null),
        assert(dealId != null),
        super._();

  @override
  final PriceCalendarContent content;
  @override
  final Filters filters;
  @override
  final String dealId;

  @override
  String toString() {
    return 'PriceCalendarState.ready(content: $content, filters: $filters, dealId: $dealId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ready &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality()
                    .equals(other.filters, filters)) &&
            (identical(other.dealId, dealId) ||
                const DeepCollectionEquality().equals(other.dealId, dealId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(filters) ^
      const DeepCollectionEquality().hash(dealId);

  @override
  _$ReadyCopyWith<_Ready> get copyWith =>
      __$ReadyCopyWithImpl<_Ready>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    @required Result initial(PriceCalendarContent content),
    @required Result loading(PriceCalendarContent content),
    @required Result error(PriceCalendarContent content),
    @required
        Result ready(
            PriceCalendarContent content, Filters filters, String dealId),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return ready(content, filters, dealId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(PriceCalendarContent content), {
    Result initial(PriceCalendarContent content),
    Result loading(PriceCalendarContent content),
    Result error(PriceCalendarContent content),
    Result ready(PriceCalendarContent content, Filters filters, String dealId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(content, filters, dealId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Data value), {
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result ready(_Ready value),
  }) {
    assert($default != null);
    assert(initial != null);
    assert(loading != null);
    assert(error != null);
    assert(ready != null);
    return ready(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Data value), {
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result error(_Error value),
    Result ready(_Ready value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready extends PriceCalendarState {
  _Ready._() : super._();
  factory _Ready(PriceCalendarContent content, Filters filters, String dealId) =
      _$_Ready;

  @override
  PriceCalendarContent get content;
  Filters get filters;
  String get dealId;
  @override
  _$ReadyCopyWith<_Ready> get copyWith;
}
