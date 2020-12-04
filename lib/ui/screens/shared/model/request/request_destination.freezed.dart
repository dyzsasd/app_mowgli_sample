// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RequestDestination _$RequestDestinationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _RequestDestination.fromJson(json);
    case 'none':
      return _NoRequestDestination.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$RequestDestinationTearOff {
  const _$RequestDestinationTearOff();

// ignore: unused_element
  _RequestDestination call(
      {@required RequestDestinationType type,
      List<String> codes,
      RequestDestinationCodeType codeType}) {
    return _RequestDestination(
      type: type,
      codes: codes,
      codeType: codeType,
    );
  }

// ignore: unused_element
  _NoRequestDestination none(
      {@nullable List<String> codes,
      RequestDestinationType type = RequestDestinationType.all,
      @nullable RequestDestinationCodeType codeType}) {
    return _NoRequestDestination(
      codes: codes,
      type: type,
      codeType: codeType,
    );
  }

// ignore: unused_element
  RequestDestination fromJson(Map<String, Object> json) {
    return RequestDestination.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RequestDestination = _$RequestDestinationTearOff();

/// @nodoc
mixin _$RequestDestination {
  RequestDestinationType get type;
  List<String> get codes;
  RequestDestinationCodeType get codeType;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDestinationType type, List<String> codes,
        RequestDestinationCodeType codeType), {
    @required
        Result none(@nullable List<String> codes, RequestDestinationType type,
            @nullable RequestDestinationCodeType codeType),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDestinationType type, List<String> codes,
        RequestDestinationCodeType codeType), {
    Result none(@nullable List<String> codes, RequestDestinationType type,
        @nullable RequestDestinationCodeType codeType),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestDestination value), {
    @required Result none(_NoRequestDestination value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestDestination value), {
    Result none(_NoRequestDestination value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $RequestDestinationCopyWith<RequestDestination> get copyWith;
}

/// @nodoc
abstract class $RequestDestinationCopyWith<$Res> {
  factory $RequestDestinationCopyWith(
          RequestDestination value, $Res Function(RequestDestination) then) =
      _$RequestDestinationCopyWithImpl<$Res>;
  $Res call(
      {RequestDestinationType type,
      List<String> codes,
      RequestDestinationCodeType codeType});
}

/// @nodoc
class _$RequestDestinationCopyWithImpl<$Res>
    implements $RequestDestinationCopyWith<$Res> {
  _$RequestDestinationCopyWithImpl(this._value, this._then);

  final RequestDestination _value;
  // ignore: unused_field
  final $Res Function(RequestDestination) _then;

  @override
  $Res call({
    Object type = freezed,
    Object codes = freezed,
    Object codeType = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as RequestDestinationType,
      codes: codes == freezed ? _value.codes : codes as List<String>,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestDestinationCodeType,
    ));
  }
}

/// @nodoc
abstract class _$RequestDestinationCopyWith<$Res>
    implements $RequestDestinationCopyWith<$Res> {
  factory _$RequestDestinationCopyWith(
          _RequestDestination value, $Res Function(_RequestDestination) then) =
      __$RequestDestinationCopyWithImpl<$Res>;
  @override
  $Res call(
      {RequestDestinationType type,
      List<String> codes,
      RequestDestinationCodeType codeType});
}

/// @nodoc
class __$RequestDestinationCopyWithImpl<$Res>
    extends _$RequestDestinationCopyWithImpl<$Res>
    implements _$RequestDestinationCopyWith<$Res> {
  __$RequestDestinationCopyWithImpl(
      _RequestDestination _value, $Res Function(_RequestDestination) _then)
      : super(_value, (v) => _then(v as _RequestDestination));

  @override
  _RequestDestination get _value => super._value as _RequestDestination;

  @override
  $Res call({
    Object type = freezed,
    Object codes = freezed,
    Object codeType = freezed,
  }) {
    return _then(_RequestDestination(
      type: type == freezed ? _value.type : type as RequestDestinationType,
      codes: codes == freezed ? _value.codes : codes as List<String>,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestDestinationCodeType,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_RequestDestination extends _RequestDestination {
  _$_RequestDestination({@required this.type, this.codes, this.codeType})
      : assert(type != null),
        super._();

  factory _$_RequestDestination.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestDestinationFromJson(json);

  @override
  final RequestDestinationType type;
  @override
  final List<String> codes;
  @override
  final RequestDestinationCodeType codeType;

  @override
  String toString() {
    return 'RequestDestination(type: $type, codes: $codes, codeType: $codeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestDestination &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.codes, codes) ||
                const DeepCollectionEquality().equals(other.codes, codes)) &&
            (identical(other.codeType, codeType) ||
                const DeepCollectionEquality()
                    .equals(other.codeType, codeType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(codes) ^
      const DeepCollectionEquality().hash(codeType);

  @override
  _$RequestDestinationCopyWith<_RequestDestination> get copyWith =>
      __$RequestDestinationCopyWithImpl<_RequestDestination>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDestinationType type, List<String> codes,
        RequestDestinationCodeType codeType), {
    @required
        Result none(@nullable List<String> codes, RequestDestinationType type,
            @nullable RequestDestinationCodeType codeType),
  }) {
    assert($default != null);
    assert(none != null);
    return $default(type, codes, codeType);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDestinationType type, List<String> codes,
        RequestDestinationCodeType codeType), {
    Result none(@nullable List<String> codes, RequestDestinationType type,
        @nullable RequestDestinationCodeType codeType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(type, codes, codeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestDestination value), {
    @required Result none(_NoRequestDestination value),
  }) {
    assert($default != null);
    assert(none != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestDestination value), {
    Result none(_NoRequestDestination value),
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
    return _$_$_RequestDestinationToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _RequestDestination extends RequestDestination {
  _RequestDestination._() : super._();
  factory _RequestDestination(
      {@required RequestDestinationType type,
      List<String> codes,
      RequestDestinationCodeType codeType}) = _$_RequestDestination;

  factory _RequestDestination.fromJson(Map<String, dynamic> json) =
      _$_RequestDestination.fromJson;

  @override
  RequestDestinationType get type;
  @override
  List<String> get codes;
  @override
  RequestDestinationCodeType get codeType;
  @override
  _$RequestDestinationCopyWith<_RequestDestination> get copyWith;
}

/// @nodoc
abstract class _$NoRequestDestinationCopyWith<$Res>
    implements $RequestDestinationCopyWith<$Res> {
  factory _$NoRequestDestinationCopyWith(_NoRequestDestination value,
          $Res Function(_NoRequestDestination) then) =
      __$NoRequestDestinationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable List<String> codes,
      RequestDestinationType type,
      @nullable RequestDestinationCodeType codeType});
}

/// @nodoc
class __$NoRequestDestinationCopyWithImpl<$Res>
    extends _$RequestDestinationCopyWithImpl<$Res>
    implements _$NoRequestDestinationCopyWith<$Res> {
  __$NoRequestDestinationCopyWithImpl(
      _NoRequestDestination _value, $Res Function(_NoRequestDestination) _then)
      : super(_value, (v) => _then(v as _NoRequestDestination));

  @override
  _NoRequestDestination get _value => super._value as _NoRequestDestination;

  @override
  $Res call({
    Object codes = freezed,
    Object type = freezed,
    Object codeType = freezed,
  }) {
    return _then(_NoRequestDestination(
      codes: codes == freezed ? _value.codes : codes as List<String>,
      type: type == freezed ? _value.type : type as RequestDestinationType,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestDestinationCodeType,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_NoRequestDestination extends _NoRequestDestination {
  _$_NoRequestDestination(
      {@nullable this.codes,
      this.type = RequestDestinationType.all,
      @nullable this.codeType})
      : assert(type != null),
        super._();

  factory _$_NoRequestDestination.fromJson(Map<String, dynamic> json) =>
      _$_$_NoRequestDestinationFromJson(json);

  @override
  @nullable
  final List<String> codes;
  @JsonKey(defaultValue: RequestDestinationType.all)
  @override
  final RequestDestinationType type;
  @override
  @nullable
  final RequestDestinationCodeType codeType;

  @override
  String toString() {
    return 'RequestDestination.none(codes: $codes, type: $type, codeType: $codeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoRequestDestination &&
            (identical(other.codes, codes) ||
                const DeepCollectionEquality().equals(other.codes, codes)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.codeType, codeType) ||
                const DeepCollectionEquality()
                    .equals(other.codeType, codeType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(codes) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(codeType);

  @override
  _$NoRequestDestinationCopyWith<_NoRequestDestination> get copyWith =>
      __$NoRequestDestinationCopyWithImpl<_NoRequestDestination>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(RequestDestinationType type, List<String> codes,
        RequestDestinationCodeType codeType), {
    @required
        Result none(@nullable List<String> codes, RequestDestinationType type,
            @nullable RequestDestinationCodeType codeType),
  }) {
    assert($default != null);
    assert(none != null);
    return none(codes, type, codeType);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(RequestDestinationType type, List<String> codes,
        RequestDestinationCodeType codeType), {
    Result none(@nullable List<String> codes, RequestDestinationType type,
        @nullable RequestDestinationCodeType codeType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(codes, type, codeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestDestination value), {
    @required Result none(_NoRequestDestination value),
  }) {
    assert($default != null);
    assert(none != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestDestination value), {
    Result none(_NoRequestDestination value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoRequestDestinationToJson(this)..['runtimeType'] = 'none';
  }
}

abstract class _NoRequestDestination extends RequestDestination {
  _NoRequestDestination._() : super._();
  factory _NoRequestDestination(
      {@nullable List<String> codes,
      RequestDestinationType type,
      @nullable RequestDestinationCodeType codeType}) = _$_NoRequestDestination;

  factory _NoRequestDestination.fromJson(Map<String, dynamic> json) =
      _$_NoRequestDestination.fromJson;

  @override
  @nullable
  List<String> get codes;
  @override
  RequestDestinationType get type;
  @override
  @nullable
  RequestDestinationCodeType get codeType;
  @override
  _$NoRequestDestinationCopyWith<_NoRequestDestination> get copyWith;
}
