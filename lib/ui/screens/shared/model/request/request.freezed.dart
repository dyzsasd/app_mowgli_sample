// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Request _$RequestFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _Request.fromJson(json);
    case 'location':
      return RequestLocation.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$RequestTearOff {
  const _$RequestTearOff();

// ignore: unused_element
  _Request call(
      {@required RequestOrigin origin,
      @required RequestDestination destination,
      @required @nullable RequestDate outboundDate,
      @required @nullable RequestDate inboundDate,
      @required Filters filters,
      RequestJourneyType journeyType = RequestJourneyType.roundTrip,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder = RequestSortOrder.price}) {
    return _Request(
      origin: origin,
      destination: destination,
      outboundDate: outboundDate,
      inboundDate: inboundDate,
      filters: filters,
      journeyType: journeyType,
      maxStopOvers: maxStopOvers,
      distance: distance,
      maxBudget: maxBudget,
      maxResults: maxResults,
      nextRequestKey: nextRequestKey,
      sortOrder: sortOrder,
    );
  }

// ignore: unused_element
  RequestLocation location(
      {@required RequestOrigin origin,
      @required RequestDestination destination,
      @nullable RequestDate outboundDate,
      @nullable RequestDate inboundDate,
      @nullable Filters filters,
      @nullable RequestJourneyType journeyType,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder = RequestSortOrder.price}) {
    return RequestLocation(
      origin: origin,
      destination: destination,
      outboundDate: outboundDate,
      inboundDate: inboundDate,
      filters: filters,
      journeyType: journeyType,
      maxStopOvers: maxStopOvers,
      distance: distance,
      maxBudget: maxBudget,
      maxResults: maxResults,
      nextRequestKey: nextRequestKey,
      sortOrder: sortOrder,
    );
  }

// ignore: unused_element
  Request fromJson(Map<String, Object> json) {
    return Request.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Request = _$RequestTearOff();

/// @nodoc
mixin _$Request {
  RequestOrigin get origin;
  RequestDestination get destination;
  @nullable
  RequestDate get outboundDate;
  @nullable
  RequestDate get inboundDate;
  Filters get filters;
  RequestJourneyType get journeyType;
  @nullable
  int get maxStopOvers;
  @nullable
  RequestDistance get distance;
  @nullable
  int get maxBudget;
  @nullable
  int get maxResults;
  @nullable
  String get nextRequestKey;
  RequestSortOrder get sortOrder;

  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        Filters filters,
        RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder), {
    @required
        Result location(
            RequestOrigin origin,
            RequestDestination destination,
            @nullable RequestDate outboundDate,
            @nullable RequestDate inboundDate,
            @nullable Filters filters,
            @nullable RequestJourneyType journeyType,
            @nullable int maxStopOvers,
            @nullable RequestDistance distance,
            @nullable int maxBudget,
            @nullable int maxResults,
            @nullable String nextRequestKey,
            RequestSortOrder sortOrder),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        Filters filters,
        RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder), {
    Result location(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        @nullable Filters filters,
        @nullable RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Request value), {
    @required Result location(RequestLocation value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Request value), {
    Result location(RequestLocation value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $RequestCopyWith<Request> get copyWith;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res>;
  $Res call(
      {RequestOrigin origin,
      RequestDestination destination,
      @nullable RequestDate outboundDate,
      @nullable RequestDate inboundDate,
      Filters filters,
      RequestJourneyType journeyType,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder});

  $RequestOriginCopyWith<$Res> get origin;
  $RequestDestinationCopyWith<$Res> get destination;
  $RequestDateCopyWith<$Res> get outboundDate;
  $RequestDateCopyWith<$Res> get inboundDate;
  $FiltersCopyWith<$Res> get filters;
  $RequestDistanceCopyWith<$Res> get distance;
}

/// @nodoc
class _$RequestCopyWithImpl<$Res> implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  final Request _value;
  // ignore: unused_field
  final $Res Function(Request) _then;

  @override
  $Res call({
    Object origin = freezed,
    Object destination = freezed,
    Object outboundDate = freezed,
    Object inboundDate = freezed,
    Object filters = freezed,
    Object journeyType = freezed,
    Object maxStopOvers = freezed,
    Object distance = freezed,
    Object maxBudget = freezed,
    Object maxResults = freezed,
    Object nextRequestKey = freezed,
    Object sortOrder = freezed,
  }) {
    return _then(_value.copyWith(
      origin: origin == freezed ? _value.origin : origin as RequestOrigin,
      destination: destination == freezed
          ? _value.destination
          : destination as RequestDestination,
      outboundDate: outboundDate == freezed
          ? _value.outboundDate
          : outboundDate as RequestDate,
      inboundDate: inboundDate == freezed
          ? _value.inboundDate
          : inboundDate as RequestDate,
      filters: filters == freezed ? _value.filters : filters as Filters,
      journeyType: journeyType == freezed
          ? _value.journeyType
          : journeyType as RequestJourneyType,
      maxStopOvers:
          maxStopOvers == freezed ? _value.maxStopOvers : maxStopOvers as int,
      distance:
          distance == freezed ? _value.distance : distance as RequestDistance,
      maxBudget: maxBudget == freezed ? _value.maxBudget : maxBudget as int,
      maxResults: maxResults == freezed ? _value.maxResults : maxResults as int,
      nextRequestKey: nextRequestKey == freezed
          ? _value.nextRequestKey
          : nextRequestKey as String,
      sortOrder: sortOrder == freezed
          ? _value.sortOrder
          : sortOrder as RequestSortOrder,
    ));
  }

  @override
  $RequestOriginCopyWith<$Res> get origin {
    if (_value.origin == null) {
      return null;
    }
    return $RequestOriginCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value));
    });
  }

  @override
  $RequestDestinationCopyWith<$Res> get destination {
    if (_value.destination == null) {
      return null;
    }
    return $RequestDestinationCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value));
    });
  }

  @override
  $RequestDateCopyWith<$Res> get outboundDate {
    if (_value.outboundDate == null) {
      return null;
    }
    return $RequestDateCopyWith<$Res>(_value.outboundDate, (value) {
      return _then(_value.copyWith(outboundDate: value));
    });
  }

  @override
  $RequestDateCopyWith<$Res> get inboundDate {
    if (_value.inboundDate == null) {
      return null;
    }
    return $RequestDateCopyWith<$Res>(_value.inboundDate, (value) {
      return _then(_value.copyWith(inboundDate: value));
    });
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

  @override
  $RequestDistanceCopyWith<$Res> get distance {
    if (_value.distance == null) {
      return null;
    }
    return $RequestDistanceCopyWith<$Res>(_value.distance, (value) {
      return _then(_value.copyWith(distance: value));
    });
  }
}

/// @nodoc
abstract class _$RequestCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$RequestCopyWith(_Request value, $Res Function(_Request) then) =
      __$RequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {RequestOrigin origin,
      RequestDestination destination,
      @nullable RequestDate outboundDate,
      @nullable RequestDate inboundDate,
      Filters filters,
      RequestJourneyType journeyType,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder});

  @override
  $RequestOriginCopyWith<$Res> get origin;
  @override
  $RequestDestinationCopyWith<$Res> get destination;
  @override
  $RequestDateCopyWith<$Res> get outboundDate;
  @override
  $RequestDateCopyWith<$Res> get inboundDate;
  @override
  $FiltersCopyWith<$Res> get filters;
  @override
  $RequestDistanceCopyWith<$Res> get distance;
}

/// @nodoc
class __$RequestCopyWithImpl<$Res> extends _$RequestCopyWithImpl<$Res>
    implements _$RequestCopyWith<$Res> {
  __$RequestCopyWithImpl(_Request _value, $Res Function(_Request) _then)
      : super(_value, (v) => _then(v as _Request));

  @override
  _Request get _value => super._value as _Request;

  @override
  $Res call({
    Object origin = freezed,
    Object destination = freezed,
    Object outboundDate = freezed,
    Object inboundDate = freezed,
    Object filters = freezed,
    Object journeyType = freezed,
    Object maxStopOvers = freezed,
    Object distance = freezed,
    Object maxBudget = freezed,
    Object maxResults = freezed,
    Object nextRequestKey = freezed,
    Object sortOrder = freezed,
  }) {
    return _then(_Request(
      origin: origin == freezed ? _value.origin : origin as RequestOrigin,
      destination: destination == freezed
          ? _value.destination
          : destination as RequestDestination,
      outboundDate: outboundDate == freezed
          ? _value.outboundDate
          : outboundDate as RequestDate,
      inboundDate: inboundDate == freezed
          ? _value.inboundDate
          : inboundDate as RequestDate,
      filters: filters == freezed ? _value.filters : filters as Filters,
      journeyType: journeyType == freezed
          ? _value.journeyType
          : journeyType as RequestJourneyType,
      maxStopOvers:
          maxStopOvers == freezed ? _value.maxStopOvers : maxStopOvers as int,
      distance:
          distance == freezed ? _value.distance : distance as RequestDistance,
      maxBudget: maxBudget == freezed ? _value.maxBudget : maxBudget as int,
      maxResults: maxResults == freezed ? _value.maxResults : maxResults as int,
      nextRequestKey: nextRequestKey == freezed
          ? _value.nextRequestKey
          : nextRequestKey as String,
      sortOrder: sortOrder == freezed
          ? _value.sortOrder
          : sortOrder as RequestSortOrder,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$_Request extends _Request {
  _$_Request(
      {@required this.origin,
      @required this.destination,
      @required @nullable this.outboundDate,
      @required @nullable this.inboundDate,
      @required this.filters,
      this.journeyType = RequestJourneyType.roundTrip,
      @nullable this.maxStopOvers,
      @nullable this.distance,
      @nullable this.maxBudget,
      @nullable this.maxResults,
      @nullable this.nextRequestKey,
      this.sortOrder = RequestSortOrder.price})
      : assert(origin != null),
        assert(destination != null),
        assert(filters != null),
        assert(journeyType != null),
        assert(sortOrder != null),
        super._();

  factory _$_Request.fromJson(Map<String, dynamic> json) =>
      _$_$_RequestFromJson(json);

  @override
  final RequestOrigin origin;
  @override
  final RequestDestination destination;
  @override
  @nullable
  final RequestDate outboundDate;
  @override
  @nullable
  final RequestDate inboundDate;
  @override
  final Filters filters;
  @JsonKey(defaultValue: RequestJourneyType.roundTrip)
  @override
  final RequestJourneyType journeyType;
  @override
  @nullable
  final int maxStopOvers;
  @override
  @nullable
  final RequestDistance distance;
  @override
  @nullable
  final int maxBudget;
  @override
  @nullable
  final int maxResults;
  @override
  @nullable
  final String nextRequestKey;
  @JsonKey(defaultValue: RequestSortOrder.price)
  @override
  final RequestSortOrder sortOrder;

  @override
  String toString() {
    return 'Request(origin: $origin, destination: $destination, outboundDate: $outboundDate, inboundDate: $inboundDate, filters: $filters, journeyType: $journeyType, maxStopOvers: $maxStopOvers, distance: $distance, maxBudget: $maxBudget, maxResults: $maxResults, nextRequestKey: $nextRequestKey, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Request &&
            (identical(other.origin, origin) ||
                const DeepCollectionEquality().equals(other.origin, origin)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)) &&
            (identical(other.outboundDate, outboundDate) ||
                const DeepCollectionEquality()
                    .equals(other.outboundDate, outboundDate)) &&
            (identical(other.inboundDate, inboundDate) ||
                const DeepCollectionEquality()
                    .equals(other.inboundDate, inboundDate)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality()
                    .equals(other.filters, filters)) &&
            (identical(other.journeyType, journeyType) ||
                const DeepCollectionEquality()
                    .equals(other.journeyType, journeyType)) &&
            (identical(other.maxStopOvers, maxStopOvers) ||
                const DeepCollectionEquality()
                    .equals(other.maxStopOvers, maxStopOvers)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.maxBudget, maxBudget) ||
                const DeepCollectionEquality()
                    .equals(other.maxBudget, maxBudget)) &&
            (identical(other.maxResults, maxResults) ||
                const DeepCollectionEquality()
                    .equals(other.maxResults, maxResults)) &&
            (identical(other.nextRequestKey, nextRequestKey) ||
                const DeepCollectionEquality()
                    .equals(other.nextRequestKey, nextRequestKey)) &&
            (identical(other.sortOrder, sortOrder) ||
                const DeepCollectionEquality()
                    .equals(other.sortOrder, sortOrder)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(origin) ^
      const DeepCollectionEquality().hash(destination) ^
      const DeepCollectionEquality().hash(outboundDate) ^
      const DeepCollectionEquality().hash(inboundDate) ^
      const DeepCollectionEquality().hash(filters) ^
      const DeepCollectionEquality().hash(journeyType) ^
      const DeepCollectionEquality().hash(maxStopOvers) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(maxBudget) ^
      const DeepCollectionEquality().hash(maxResults) ^
      const DeepCollectionEquality().hash(nextRequestKey) ^
      const DeepCollectionEquality().hash(sortOrder);

  @override
  _$RequestCopyWith<_Request> get copyWith =>
      __$RequestCopyWithImpl<_Request>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        Filters filters,
        RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder), {
    @required
        Result location(
            RequestOrigin origin,
            RequestDestination destination,
            @nullable RequestDate outboundDate,
            @nullable RequestDate inboundDate,
            @nullable Filters filters,
            @nullable RequestJourneyType journeyType,
            @nullable int maxStopOvers,
            @nullable RequestDistance distance,
            @nullable int maxBudget,
            @nullable int maxResults,
            @nullable String nextRequestKey,
            RequestSortOrder sortOrder),
  }) {
    assert($default != null);
    assert(location != null);
    return $default(
        origin,
        destination,
        outboundDate,
        inboundDate,
        filters,
        journeyType,
        maxStopOvers,
        distance,
        maxBudget,
        maxResults,
        nextRequestKey,
        sortOrder);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        Filters filters,
        RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder), {
    Result location(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        @nullable Filters filters,
        @nullable RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(
          origin,
          destination,
          outboundDate,
          inboundDate,
          filters,
          journeyType,
          maxStopOvers,
          distance,
          maxBudget,
          maxResults,
          nextRequestKey,
          sortOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Request value), {
    @required Result location(RequestLocation value),
  }) {
    assert($default != null);
    assert(location != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Request value), {
    Result location(RequestLocation value),
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
    return _$_$_RequestToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _Request extends Request {
  _Request._() : super._();
  factory _Request(
      {@required RequestOrigin origin,
      @required RequestDestination destination,
      @required @nullable RequestDate outboundDate,
      @required @nullable RequestDate inboundDate,
      @required Filters filters,
      RequestJourneyType journeyType,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder}) = _$_Request;

  factory _Request.fromJson(Map<String, dynamic> json) = _$_Request.fromJson;

  @override
  RequestOrigin get origin;
  @override
  RequestDestination get destination;
  @override
  @nullable
  RequestDate get outboundDate;
  @override
  @nullable
  RequestDate get inboundDate;
  @override
  Filters get filters;
  @override
  RequestJourneyType get journeyType;
  @override
  @nullable
  int get maxStopOvers;
  @override
  @nullable
  RequestDistance get distance;
  @override
  @nullable
  int get maxBudget;
  @override
  @nullable
  int get maxResults;
  @override
  @nullable
  String get nextRequestKey;
  @override
  RequestSortOrder get sortOrder;
  @override
  _$RequestCopyWith<_Request> get copyWith;
}

/// @nodoc
abstract class $RequestLocationCopyWith<$Res>
    implements $RequestCopyWith<$Res> {
  factory $RequestLocationCopyWith(
          RequestLocation value, $Res Function(RequestLocation) then) =
      _$RequestLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {RequestOrigin origin,
      RequestDestination destination,
      @nullable RequestDate outboundDate,
      @nullable RequestDate inboundDate,
      @nullable Filters filters,
      @nullable RequestJourneyType journeyType,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder});

  @override
  $RequestOriginCopyWith<$Res> get origin;
  @override
  $RequestDestinationCopyWith<$Res> get destination;
  @override
  $RequestDateCopyWith<$Res> get outboundDate;
  @override
  $RequestDateCopyWith<$Res> get inboundDate;
  @override
  $FiltersCopyWith<$Res> get filters;
  @override
  $RequestDistanceCopyWith<$Res> get distance;
}

/// @nodoc
class _$RequestLocationCopyWithImpl<$Res> extends _$RequestCopyWithImpl<$Res>
    implements $RequestLocationCopyWith<$Res> {
  _$RequestLocationCopyWithImpl(
      RequestLocation _value, $Res Function(RequestLocation) _then)
      : super(_value, (v) => _then(v as RequestLocation));

  @override
  RequestLocation get _value => super._value as RequestLocation;

  @override
  $Res call({
    Object origin = freezed,
    Object destination = freezed,
    Object outboundDate = freezed,
    Object inboundDate = freezed,
    Object filters = freezed,
    Object journeyType = freezed,
    Object maxStopOvers = freezed,
    Object distance = freezed,
    Object maxBudget = freezed,
    Object maxResults = freezed,
    Object nextRequestKey = freezed,
    Object sortOrder = freezed,
  }) {
    return _then(RequestLocation(
      origin: origin == freezed ? _value.origin : origin as RequestOrigin,
      destination: destination == freezed
          ? _value.destination
          : destination as RequestDestination,
      outboundDate: outboundDate == freezed
          ? _value.outboundDate
          : outboundDate as RequestDate,
      inboundDate: inboundDate == freezed
          ? _value.inboundDate
          : inboundDate as RequestDate,
      filters: filters == freezed ? _value.filters : filters as Filters,
      journeyType: journeyType == freezed
          ? _value.journeyType
          : journeyType as RequestJourneyType,
      maxStopOvers:
          maxStopOvers == freezed ? _value.maxStopOvers : maxStopOvers as int,
      distance:
          distance == freezed ? _value.distance : distance as RequestDistance,
      maxBudget: maxBudget == freezed ? _value.maxBudget : maxBudget as int,
      maxResults: maxResults == freezed ? _value.maxResults : maxResults as int,
      nextRequestKey: nextRequestKey == freezed
          ? _value.nextRequestKey
          : nextRequestKey as String,
      sortOrder: sortOrder == freezed
          ? _value.sortOrder
          : sortOrder as RequestSortOrder,
    ));
  }
}

@JsonSerializable(explicitToJson: true, anyMap: true)

/// @nodoc
class _$RequestLocation extends RequestLocation {
  _$RequestLocation(
      {@required this.origin,
      @required this.destination,
      @nullable this.outboundDate,
      @nullable this.inboundDate,
      @nullable this.filters,
      @nullable this.journeyType,
      @nullable this.maxStopOvers,
      @nullable this.distance,
      @nullable this.maxBudget,
      @nullable this.maxResults,
      @nullable this.nextRequestKey,
      this.sortOrder = RequestSortOrder.price})
      : assert(origin != null),
        assert(destination != null),
        assert(sortOrder != null),
        super._();

  factory _$RequestLocation.fromJson(Map<String, dynamic> json) =>
      _$_$RequestLocationFromJson(json);

  @override
  final RequestOrigin origin;
  @override
  final RequestDestination destination;
  @override
  @nullable
  final RequestDate outboundDate;
  @override
  @nullable
  final RequestDate inboundDate;
  @override
  @nullable
  final Filters filters;
  @override
  @nullable
  final RequestJourneyType journeyType;
  @override
  @nullable
  final int maxStopOvers;
  @override
  @nullable
  final RequestDistance distance;
  @override
  @nullable
  final int maxBudget;
  @override
  @nullable
  final int maxResults;
  @override
  @nullable
  final String nextRequestKey;
  @JsonKey(defaultValue: RequestSortOrder.price)
  @override
  final RequestSortOrder sortOrder;

  @override
  String toString() {
    return 'Request.location(origin: $origin, destination: $destination, outboundDate: $outboundDate, inboundDate: $inboundDate, filters: $filters, journeyType: $journeyType, maxStopOvers: $maxStopOvers, distance: $distance, maxBudget: $maxBudget, maxResults: $maxResults, nextRequestKey: $nextRequestKey, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestLocation &&
            (identical(other.origin, origin) ||
                const DeepCollectionEquality().equals(other.origin, origin)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)) &&
            (identical(other.outboundDate, outboundDate) ||
                const DeepCollectionEquality()
                    .equals(other.outboundDate, outboundDate)) &&
            (identical(other.inboundDate, inboundDate) ||
                const DeepCollectionEquality()
                    .equals(other.inboundDate, inboundDate)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality()
                    .equals(other.filters, filters)) &&
            (identical(other.journeyType, journeyType) ||
                const DeepCollectionEquality()
                    .equals(other.journeyType, journeyType)) &&
            (identical(other.maxStopOvers, maxStopOvers) ||
                const DeepCollectionEquality()
                    .equals(other.maxStopOvers, maxStopOvers)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.maxBudget, maxBudget) ||
                const DeepCollectionEquality()
                    .equals(other.maxBudget, maxBudget)) &&
            (identical(other.maxResults, maxResults) ||
                const DeepCollectionEquality()
                    .equals(other.maxResults, maxResults)) &&
            (identical(other.nextRequestKey, nextRequestKey) ||
                const DeepCollectionEquality()
                    .equals(other.nextRequestKey, nextRequestKey)) &&
            (identical(other.sortOrder, sortOrder) ||
                const DeepCollectionEquality()
                    .equals(other.sortOrder, sortOrder)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(origin) ^
      const DeepCollectionEquality().hash(destination) ^
      const DeepCollectionEquality().hash(outboundDate) ^
      const DeepCollectionEquality().hash(inboundDate) ^
      const DeepCollectionEquality().hash(filters) ^
      const DeepCollectionEquality().hash(journeyType) ^
      const DeepCollectionEquality().hash(maxStopOvers) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(maxBudget) ^
      const DeepCollectionEquality().hash(maxResults) ^
      const DeepCollectionEquality().hash(nextRequestKey) ^
      const DeepCollectionEquality().hash(sortOrder);

  @override
  $RequestLocationCopyWith<RequestLocation> get copyWith =>
      _$RequestLocationCopyWithImpl<RequestLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        Filters filters,
        RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder), {
    @required
        Result location(
            RequestOrigin origin,
            RequestDestination destination,
            @nullable RequestDate outboundDate,
            @nullable RequestDate inboundDate,
            @nullable Filters filters,
            @nullable RequestJourneyType journeyType,
            @nullable int maxStopOvers,
            @nullable RequestDistance distance,
            @nullable int maxBudget,
            @nullable int maxResults,
            @nullable String nextRequestKey,
            RequestSortOrder sortOrder),
  }) {
    assert($default != null);
    assert(location != null);
    return location(
        origin,
        destination,
        outboundDate,
        inboundDate,
        filters,
        journeyType,
        maxStopOvers,
        distance,
        maxBudget,
        maxResults,
        nextRequestKey,
        sortOrder);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        Filters filters,
        RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder), {
    Result location(
        RequestOrigin origin,
        RequestDestination destination,
        @nullable RequestDate outboundDate,
        @nullable RequestDate inboundDate,
        @nullable Filters filters,
        @nullable RequestJourneyType journeyType,
        @nullable int maxStopOvers,
        @nullable RequestDistance distance,
        @nullable int maxBudget,
        @nullable int maxResults,
        @nullable String nextRequestKey,
        RequestSortOrder sortOrder),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (location != null) {
      return location(
          origin,
          destination,
          outboundDate,
          inboundDate,
          filters,
          journeyType,
          maxStopOvers,
          distance,
          maxBudget,
          maxResults,
          nextRequestKey,
          sortOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_Request value), {
    @required Result location(RequestLocation value),
  }) {
    assert($default != null);
    assert(location != null);
    return location(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_Request value), {
    Result location(RequestLocation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (location != null) {
      return location(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RequestLocationToJson(this)..['runtimeType'] = 'location';
  }
}

abstract class RequestLocation extends Request {
  RequestLocation._() : super._();
  factory RequestLocation(
      {@required RequestOrigin origin,
      @required RequestDestination destination,
      @nullable RequestDate outboundDate,
      @nullable RequestDate inboundDate,
      @nullable Filters filters,
      @nullable RequestJourneyType journeyType,
      @nullable int maxStopOvers,
      @nullable RequestDistance distance,
      @nullable int maxBudget,
      @nullable int maxResults,
      @nullable String nextRequestKey,
      RequestSortOrder sortOrder}) = _$RequestLocation;

  factory RequestLocation.fromJson(Map<String, dynamic> json) =
      _$RequestLocation.fromJson;

  @override
  RequestOrigin get origin;
  @override
  RequestDestination get destination;
  @override
  @nullable
  RequestDate get outboundDate;
  @override
  @nullable
  RequestDate get inboundDate;
  @override
  @nullable
  Filters get filters;
  @override
  @nullable
  RequestJourneyType get journeyType;
  @override
  @nullable
  int get maxStopOvers;
  @override
  @nullable
  RequestDistance get distance;
  @override
  @nullable
  int get maxBudget;
  @override
  @nullable
  int get maxResults;
  @override
  @nullable
  String get nextRequestKey;
  @override
  RequestSortOrder get sortOrder;
  @override
  $RequestLocationCopyWith<RequestLocation> get copyWith;
}
