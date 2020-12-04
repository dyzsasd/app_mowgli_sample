// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'section_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SectionListStateTearOff {
  const _$SectionListStateTearOff();

// ignore: unused_element
  SectionListStateData call(SectionListData data) {
    return SectionListStateData(
      data,
    );
  }

// ignore: unused_element
  _Loading loading() {
    return _Loading();
  }

// ignore: unused_element
  _Error error() {
    return _Error();
  }

// ignore: unused_element
  NoMoreDeals noMoreDeals(SectionListData data) {
    return NoMoreDeals(
      data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SectionListState = _$SectionListStateTearOff();

/// @nodoc
mixin _$SectionListState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SectionListData data), {
    @required Result loading(),
    @required Result error(),
    @required Result noMoreDeals(SectionListData data),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SectionListData data), {
    Result loading(),
    Result error(),
    Result noMoreDeals(SectionListData data),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(SectionListStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result noMoreDeals(NoMoreDeals value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SectionListStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    Result noMoreDeals(NoMoreDeals value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $SectionListStateCopyWith<$Res> {
  factory $SectionListStateCopyWith(
          SectionListState value, $Res Function(SectionListState) then) =
      _$SectionListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SectionListStateCopyWithImpl<$Res>
    implements $SectionListStateCopyWith<$Res> {
  _$SectionListStateCopyWithImpl(this._value, this._then);

  final SectionListState _value;
  // ignore: unused_field
  final $Res Function(SectionListState) _then;
}

/// @nodoc
abstract class $SectionListStateDataCopyWith<$Res> {
  factory $SectionListStateDataCopyWith(SectionListStateData value,
          $Res Function(SectionListStateData) then) =
      _$SectionListStateDataCopyWithImpl<$Res>;
  $Res call({SectionListData data});
}

/// @nodoc
class _$SectionListStateDataCopyWithImpl<$Res>
    extends _$SectionListStateCopyWithImpl<$Res>
    implements $SectionListStateDataCopyWith<$Res> {
  _$SectionListStateDataCopyWithImpl(
      SectionListStateData _value, $Res Function(SectionListStateData) _then)
      : super(_value, (v) => _then(v as SectionListStateData));

  @override
  SectionListStateData get _value => super._value as SectionListStateData;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(SectionListStateData(
      data == freezed ? _value.data : data as SectionListData,
    ));
  }
}

/// @nodoc
class _$SectionListStateData extends SectionListStateData {
  _$SectionListStateData(this.data)
      : assert(data != null),
        super._();

  @override
  final SectionListData data;

  @override
  String toString() {
    return 'SectionListState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SectionListStateData &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $SectionListStateDataCopyWith<SectionListStateData> get copyWith =>
      _$SectionListStateDataCopyWithImpl<SectionListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SectionListData data), {
    @required Result loading(),
    @required Result error(),
    @required Result noMoreDeals(SectionListData data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return $default(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SectionListData data), {
    Result loading(),
    Result error(),
    Result noMoreDeals(SectionListData data),
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
    Result $default(SectionListStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result noMoreDeals(NoMoreDeals value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SectionListStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    Result noMoreDeals(NoMoreDeals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class SectionListStateData extends SectionListState {
  SectionListStateData._() : super._();
  factory SectionListStateData(SectionListData data) = _$SectionListStateData;

  SectionListData get data;
  $SectionListStateDataCopyWith<SectionListStateData> get copyWith;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SectionListStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc
class _$_Loading extends _Loading {
  _$_Loading() : super._();

  @override
  String toString() {
    return 'SectionListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SectionListData data), {
    @required Result loading(),
    @required Result error(),
    @required Result noMoreDeals(SectionListData data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SectionListData data), {
    Result loading(),
    Result error(),
    Result noMoreDeals(SectionListData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(SectionListStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result noMoreDeals(NoMoreDeals value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SectionListStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    Result noMoreDeals(NoMoreDeals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SectionListState {
  _Loading._() : super._();
  factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$SectionListStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc
class _$_Error extends _Error {
  _$_Error() : super._();

  @override
  String toString() {
    return 'SectionListState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SectionListData data), {
    @required Result loading(),
    @required Result error(),
    @required Result noMoreDeals(SectionListData data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SectionListData data), {
    Result loading(),
    Result error(),
    Result noMoreDeals(SectionListData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(SectionListStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result noMoreDeals(NoMoreDeals value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SectionListStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    Result noMoreDeals(NoMoreDeals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends SectionListState {
  _Error._() : super._();
  factory _Error() = _$_Error;
}

/// @nodoc
abstract class $NoMoreDealsCopyWith<$Res> {
  factory $NoMoreDealsCopyWith(
          NoMoreDeals value, $Res Function(NoMoreDeals) then) =
      _$NoMoreDealsCopyWithImpl<$Res>;
  $Res call({SectionListData data});
}

/// @nodoc
class _$NoMoreDealsCopyWithImpl<$Res>
    extends _$SectionListStateCopyWithImpl<$Res>
    implements $NoMoreDealsCopyWith<$Res> {
  _$NoMoreDealsCopyWithImpl(
      NoMoreDeals _value, $Res Function(NoMoreDeals) _then)
      : super(_value, (v) => _then(v as NoMoreDeals));

  @override
  NoMoreDeals get _value => super._value as NoMoreDeals;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(NoMoreDeals(
      data == freezed ? _value.data : data as SectionListData,
    ));
  }
}

/// @nodoc
class _$NoMoreDeals extends NoMoreDeals {
  _$NoMoreDeals(this.data)
      : assert(data != null),
        super._();

  @override
  final SectionListData data;

  @override
  String toString() {
    return 'SectionListState.noMoreDeals(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NoMoreDeals &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $NoMoreDealsCopyWith<NoMoreDeals> get copyWith =>
      _$NoMoreDealsCopyWithImpl<NoMoreDeals>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(SectionListData data), {
    @required Result loading(),
    @required Result error(),
    @required Result noMoreDeals(SectionListData data),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return noMoreDeals(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(SectionListData data), {
    Result loading(),
    Result error(),
    Result noMoreDeals(SectionListData data),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noMoreDeals != null) {
      return noMoreDeals(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(SectionListStateData value), {
    @required Result loading(_Loading value),
    @required Result error(_Error value),
    @required Result noMoreDeals(NoMoreDeals value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    assert(noMoreDeals != null);
    return noMoreDeals(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(SectionListStateData value), {
    Result loading(_Loading value),
    Result error(_Error value),
    Result noMoreDeals(NoMoreDeals value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noMoreDeals != null) {
      return noMoreDeals(this);
    }
    return orElse();
  }
}

abstract class NoMoreDeals extends SectionListState {
  NoMoreDeals._() : super._();
  factory NoMoreDeals(SectionListData data) = _$NoMoreDeals;

  SectionListData get data;
  $NoMoreDealsCopyWith<NoMoreDeals> get copyWith;
}
