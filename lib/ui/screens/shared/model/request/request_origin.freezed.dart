// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request_origin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RequestOrigin _$RequestOriginFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _RequestOrigin.fromJson(json);
    case 'city':
      return _RequestOriginCity.fromJson(json);
    case 'airport':
      return _RequestOriginAirport.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$RequestOriginTearOff {
  const _$RequestOriginTearOff();

// ignore: unused_element
  _RequestOrigin call(
      {@required String code,
      @required RequestOriginType type,
      @required RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) {
    return _RequestOrigin(
      code: code,
      type: type,
      codeType: codeType,
      customerLocations: customerLocations,
    );
  }

// ignore: unused_element
  _RequestOriginCity city(
      {@required String code,
      RequestOriginType type = RequestOriginType.city,
      RequestOriginCodeType codeType = RequestOriginCodeType.iata,
      Iterable<RequestOrigin> customerLocations}) {
    return _RequestOriginCity(
      code: code,
      type: type,
      codeType: codeType,
      customerLocations: customerLocations,
    );
  }

// ignore: unused_element
  _RequestOriginAirport airport(
      {@required String code,
      RequestOriginType type = RequestOriginType.airport,
      RequestOriginCodeType codeType = RequestOriginCodeType.iata,
      Iterable<RequestOrigin> customerLocations}) {
    return _RequestOriginAirport(
      code: code,
      type: type,
      codeType: codeType,
      customerLocations: customerLocations,
    );
  }

// ignore: unused_element
  RequestOrigin fromJson(Map<String, Object> json) {
    return RequestOrigin.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RequestOrigin = _$RequestOriginTearOff();

/// @nodoc
mixin _$RequestOrigin {
  String get code;
  RequestOriginType get type;
  RequestOriginCodeType get codeType;
  Iterable<RequestOrigin> get customerLocations;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    @required
        Result city(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
    @required
        Result airport(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    Result city(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    Result airport(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestOrigin value), {
    @required Result city(_RequestOriginCity value),
    @required Result airport(_RequestOriginAirport value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestOrigin value), {
    Result city(_RequestOriginCity value),
    Result airport(_RequestOriginAirport value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $RequestOriginCopyWith<RequestOrigin> get copyWith;
}

/// @nodoc
abstract class $RequestOriginCopyWith<$Res> {
  factory $RequestOriginCopyWith(
          RequestOrigin value, $Res Function(RequestOrigin) then) =
      _$RequestOriginCopyWithImpl<$Res>;
  $Res call(
      {String code,
      RequestOriginType type,
      RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations});
}

/// @nodoc
class _$RequestOriginCopyWithImpl<$Res>
    implements $RequestOriginCopyWith<$Res> {
  _$RequestOriginCopyWithImpl(this._value, this._then);

  final RequestOrigin _value;
  // ignore: unused_field
  final $Res Function(RequestOrigin) _then;

  @override
  $Res call({
    Object code = freezed,
    Object type = freezed,
    Object codeType = freezed,
    Object customerLocations = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed ? _value.code : code as String,
      type: type == freezed ? _value.type : type as RequestOriginType,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestOriginCodeType,
      customerLocations: customerLocations == freezed
          ? _value.customerLocations
          : customerLocations as Iterable<RequestOrigin>,
    ));
  }
}

/// @nodoc
abstract class _$RequestOriginCopyWith<$Res>
    implements $RequestOriginCopyWith<$Res> {
  factory _$RequestOriginCopyWith(
          _RequestOrigin value, $Res Function(_RequestOrigin) then) =
      __$RequestOriginCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      RequestOriginType type,
      RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations});
}

/// @nodoc
class __$RequestOriginCopyWithImpl<$Res>
    extends _$RequestOriginCopyWithImpl<$Res>
    implements _$RequestOriginCopyWith<$Res> {
  __$RequestOriginCopyWithImpl(
      _RequestOrigin _value, $Res Function(_RequestOrigin) _then)
      : super(_value, (v) => _then(v as _RequestOrigin));

  @override
  _RequestOrigin get _value => super._value as _RequestOrigin;

  @override
  $Res call({
    Object code = freezed,
    Object type = freezed,
    Object codeType = freezed,
    Object customerLocations = freezed,
  }) {
    return _then(_RequestOrigin(
      code: code == freezed ? _value.code : code as String,
      type: type == freezed ? _value.type : type as RequestOriginType,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestOriginCodeType,
      customerLocations: customerLocations == freezed
          ? _value.customerLocations
          : customerLocations as Iterable<RequestOrigin>,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_RequestOrigin implements _RequestOrigin {
  _$_RequestOrigin(
      {@required this.code,
      @required this.type,
      @required this.codeType,
      this.customerLocations})
      : assert(code != null),
        assert(type != null),
        assert(codeType != null);

  factory _$_RequestOrigin.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestOriginFromJson(json);

  @override
  final String code;
  @override
  final RequestOriginType type;
  @override
  final RequestOriginCodeType codeType;
  @override
  final Iterable<RequestOrigin> customerLocations;

  @override
  String toString() {
    return 'RequestOrigin(code: $code, type: $type, codeType: $codeType, customerLocations: $customerLocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestOrigin &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.codeType, codeType) ||
                const DeepCollectionEquality()
                    .equals(other.codeType, codeType)) &&
            (identical(other.customerLocations, customerLocations) ||
                const DeepCollectionEquality()
                    .equals(other.customerLocations, customerLocations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(codeType) ^
      const DeepCollectionEquality().hash(customerLocations);

  @override
  _$RequestOriginCopyWith<_RequestOrigin> get copyWith =>
      __$RequestOriginCopyWithImpl<_RequestOrigin>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    @required
        Result city(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
    @required
        Result airport(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
  }) {
    assert($default != null);
    assert(city != null);
    assert(airport != null);
    return $default(code, type, codeType, customerLocations);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    Result city(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    Result airport(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(code, type, codeType, customerLocations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestOrigin value), {
    @required Result city(_RequestOriginCity value),
    @required Result airport(_RequestOriginAirport value),
  }) {
    assert($default != null);
    assert(city != null);
    assert(airport != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestOrigin value), {
    Result city(_RequestOriginCity value),
    Result airport(_RequestOriginAirport value),
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
    return _$_$_RequestOriginToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _RequestOrigin implements RequestOrigin {
  factory _RequestOrigin(
      {@required String code,
      @required RequestOriginType type,
      @required RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) = _$_RequestOrigin;

  factory _RequestOrigin.fromJson(Map<String, dynamic> json) =
      _$_RequestOrigin.fromJson;

  @override
  String get code;
  @override
  RequestOriginType get type;
  @override
  RequestOriginCodeType get codeType;
  @override
  Iterable<RequestOrigin> get customerLocations;
  @override
  _$RequestOriginCopyWith<_RequestOrigin> get copyWith;
}

/// @nodoc
abstract class _$RequestOriginCityCopyWith<$Res>
    implements $RequestOriginCopyWith<$Res> {
  factory _$RequestOriginCityCopyWith(
          _RequestOriginCity value, $Res Function(_RequestOriginCity) then) =
      __$RequestOriginCityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      RequestOriginType type,
      RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations});
}

/// @nodoc
class __$RequestOriginCityCopyWithImpl<$Res>
    extends _$RequestOriginCopyWithImpl<$Res>
    implements _$RequestOriginCityCopyWith<$Res> {
  __$RequestOriginCityCopyWithImpl(
      _RequestOriginCity _value, $Res Function(_RequestOriginCity) _then)
      : super(_value, (v) => _then(v as _RequestOriginCity));

  @override
  _RequestOriginCity get _value => super._value as _RequestOriginCity;

  @override
  $Res call({
    Object code = freezed,
    Object type = freezed,
    Object codeType = freezed,
    Object customerLocations = freezed,
  }) {
    return _then(_RequestOriginCity(
      code: code == freezed ? _value.code : code as String,
      type: type == freezed ? _value.type : type as RequestOriginType,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestOriginCodeType,
      customerLocations: customerLocations == freezed
          ? _value.customerLocations
          : customerLocations as Iterable<RequestOrigin>,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_RequestOriginCity implements _RequestOriginCity {
  _$_RequestOriginCity(
      {@required this.code,
      this.type = RequestOriginType.city,
      this.codeType = RequestOriginCodeType.iata,
      this.customerLocations})
      : assert(code != null),
        assert(type != null),
        assert(codeType != null);

  factory _$_RequestOriginCity.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestOriginCityFromJson(json);

  @override
  final String code;
  @JsonKey(defaultValue: RequestOriginType.city)
  @override
  final RequestOriginType type;
  @JsonKey(defaultValue: RequestOriginCodeType.iata)
  @override
  final RequestOriginCodeType codeType;
  @override
  final Iterable<RequestOrigin> customerLocations;

  @override
  String toString() {
    return 'RequestOrigin.city(code: $code, type: $type, codeType: $codeType, customerLocations: $customerLocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestOriginCity &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.codeType, codeType) ||
                const DeepCollectionEquality()
                    .equals(other.codeType, codeType)) &&
            (identical(other.customerLocations, customerLocations) ||
                const DeepCollectionEquality()
                    .equals(other.customerLocations, customerLocations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(codeType) ^
      const DeepCollectionEquality().hash(customerLocations);

  @override
  _$RequestOriginCityCopyWith<_RequestOriginCity> get copyWith =>
      __$RequestOriginCityCopyWithImpl<_RequestOriginCity>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    @required
        Result city(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
    @required
        Result airport(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
  }) {
    assert($default != null);
    assert(city != null);
    assert(airport != null);
    return city(code, type, codeType, customerLocations);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    Result city(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    Result airport(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (city != null) {
      return city(code, type, codeType, customerLocations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestOrigin value), {
    @required Result city(_RequestOriginCity value),
    @required Result airport(_RequestOriginAirport value),
  }) {
    assert($default != null);
    assert(city != null);
    assert(airport != null);
    return city(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestOrigin value), {
    Result city(_RequestOriginCity value),
    Result airport(_RequestOriginAirport value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (city != null) {
      return city(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestOriginCityToJson(this)..['runtimeType'] = 'city';
  }
}

abstract class _RequestOriginCity implements RequestOrigin {
  factory _RequestOriginCity(
      {@required String code,
      RequestOriginType type,
      RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) = _$_RequestOriginCity;

  factory _RequestOriginCity.fromJson(Map<String, dynamic> json) =
      _$_RequestOriginCity.fromJson;

  @override
  String get code;
  @override
  RequestOriginType get type;
  @override
  RequestOriginCodeType get codeType;
  @override
  Iterable<RequestOrigin> get customerLocations;
  @override
  _$RequestOriginCityCopyWith<_RequestOriginCity> get copyWith;
}

/// @nodoc
abstract class _$RequestOriginAirportCopyWith<$Res>
    implements $RequestOriginCopyWith<$Res> {
  factory _$RequestOriginAirportCopyWith(_RequestOriginAirport value,
          $Res Function(_RequestOriginAirport) then) =
      __$RequestOriginAirportCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      RequestOriginType type,
      RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations});
}

/// @nodoc
class __$RequestOriginAirportCopyWithImpl<$Res>
    extends _$RequestOriginCopyWithImpl<$Res>
    implements _$RequestOriginAirportCopyWith<$Res> {
  __$RequestOriginAirportCopyWithImpl(
      _RequestOriginAirport _value, $Res Function(_RequestOriginAirport) _then)
      : super(_value, (v) => _then(v as _RequestOriginAirport));

  @override
  _RequestOriginAirport get _value => super._value as _RequestOriginAirport;

  @override
  $Res call({
    Object code = freezed,
    Object type = freezed,
    Object codeType = freezed,
    Object customerLocations = freezed,
  }) {
    return _then(_RequestOriginAirport(
      code: code == freezed ? _value.code : code as String,
      type: type == freezed ? _value.type : type as RequestOriginType,
      codeType: codeType == freezed
          ? _value.codeType
          : codeType as RequestOriginCodeType,
      customerLocations: customerLocations == freezed
          ? _value.customerLocations
          : customerLocations as Iterable<RequestOrigin>,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_RequestOriginAirport implements _RequestOriginAirport {
  _$_RequestOriginAirport(
      {@required this.code,
      this.type = RequestOriginType.airport,
      this.codeType = RequestOriginCodeType.iata,
      this.customerLocations})
      : assert(code != null),
        assert(type != null),
        assert(codeType != null);

  factory _$_RequestOriginAirport.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestOriginAirportFromJson(json);

  @override
  final String code;
  @JsonKey(defaultValue: RequestOriginType.airport)
  @override
  final RequestOriginType type;
  @JsonKey(defaultValue: RequestOriginCodeType.iata)
  @override
  final RequestOriginCodeType codeType;
  @override
  final Iterable<RequestOrigin> customerLocations;

  @override
  String toString() {
    return 'RequestOrigin.airport(code: $code, type: $type, codeType: $codeType, customerLocations: $customerLocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RequestOriginAirport &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.codeType, codeType) ||
                const DeepCollectionEquality()
                    .equals(other.codeType, codeType)) &&
            (identical(other.customerLocations, customerLocations) ||
                const DeepCollectionEquality()
                    .equals(other.customerLocations, customerLocations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(codeType) ^
      const DeepCollectionEquality().hash(customerLocations);

  @override
  _$RequestOriginAirportCopyWith<_RequestOriginAirport> get copyWith =>
      __$RequestOriginAirportCopyWithImpl<_RequestOriginAirport>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    @required
        Result city(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
    @required
        Result airport(
            String code,
            RequestOriginType type,
            RequestOriginCodeType codeType,
            Iterable<RequestOrigin> customerLocations),
  }) {
    assert($default != null);
    assert(city != null);
    assert(airport != null);
    return airport(code, type, codeType, customerLocations);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations), {
    Result city(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    Result airport(
        String code,
        RequestOriginType type,
        RequestOriginCodeType codeType,
        Iterable<RequestOrigin> customerLocations),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (airport != null) {
      return airport(code, type, codeType, customerLocations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_RequestOrigin value), {
    @required Result city(_RequestOriginCity value),
    @required Result airport(_RequestOriginAirport value),
  }) {
    assert($default != null);
    assert(city != null);
    assert(airport != null);
    return airport(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_RequestOrigin value), {
    Result city(_RequestOriginCity value),
    Result airport(_RequestOriginAirport value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (airport != null) {
      return airport(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RequestOriginAirportToJson(this)..['runtimeType'] = 'airport';
  }
}

abstract class _RequestOriginAirport implements RequestOrigin {
  factory _RequestOriginAirport(
      {@required String code,
      RequestOriginType type,
      RequestOriginCodeType codeType,
      Iterable<RequestOrigin> customerLocations}) = _$_RequestOriginAirport;

  factory _RequestOriginAirport.fromJson(Map<String, dynamic> json) =
      _$_RequestOriginAirport.fromJson;

  @override
  String get code;
  @override
  RequestOriginType get type;
  @override
  RequestOriginCodeType get codeType;
  @override
  Iterable<RequestOrigin> get customerLocations;
  @override
  _$RequestOriginAirportCopyWith<_RequestOriginAirport> get copyWith;
}
