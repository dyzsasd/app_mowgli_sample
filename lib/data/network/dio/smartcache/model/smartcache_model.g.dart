// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smartcache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartCacheError _$SmartCacheErrorFromJson(Map<String, dynamic> json) {
  return SmartCacheError(
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$SmartCacheErrorToJson(SmartCacheError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}

SmartCacheAmount _$SmartCacheAmountFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['currency', 'value']);
  return SmartCacheAmount(
    currency: json['currency'] as String,
    value: json['value'] as num,
  );
}

Map<String, dynamic> _$SmartCacheAmountToJson(SmartCacheAmount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currency', instance.currency);
  writeNotNull('value', instance.value);
  return val;
}

SmartCacheAmountCat _$SmartCacheAmountCatFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ID']);
  return SmartCacheAmountCat(
    catId: _$enumDecodeNullable(_$SmartCacheAmountCatIDEnumMap, json['ID']),
    lower: (json['lower'] as num)?.toDouble(),
    upper: (json['upper'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SmartCacheAmountCatToJson(SmartCacheAmountCat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', _$SmartCacheAmountCatIDEnumMap[instance.catId]);
  writeNotNull('lower', instance.lower);
  writeNotNull('upper', instance.upper);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SmartCacheAmountCatIDEnumMap = {
  SmartCacheAmountCatID.lowest: 'LOWEST',
  SmartCacheAmountCatID.medium: 'MEDIUM',
  SmartCacheAmountCatID.high: 'HIGH',
};

SmartCacheCalendarCell _$SmartCacheCalendarCellFromJson(
    Map<String, dynamic> json) {
  return SmartCacheCalendarCell(
    amount: json['amount'] == null
        ? null
        : SmartCacheAmount.fromJson(json['amount'] as Map<String, dynamic>),
    cat: _$enumDecodeNullable(_$SmartCacheAmountCatIDEnumMap, json['cat']),
    inboundDepartureDate:
        JSONParserUtils.parseDate(json['inbound_departure_date']),
    offerId: json['offer_id'] as String,
    outboundDepartureDate:
        JSONParserUtils.parseDate(json['outbound_departure_date']),
  );
}

Map<String, dynamic> _$SmartCacheCalendarCellToJson(
    SmartCacheCalendarCell instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount?.toJson());
  writeNotNull('cat', _$SmartCacheAmountCatIDEnumMap[instance.cat]);
  writeNotNull('inbound_departure_date',
      instance.inboundDepartureDate?.toIso8601String());
  writeNotNull('offer_id', instance.offerId);
  writeNotNull('outbound_departure_date',
      instance.outboundDepartureDate?.toIso8601String());
  return val;
}

SmartCacheCoordinates _$SmartCacheCoordinatesFromJson(
    Map<String, dynamic> json) {
  return SmartCacheCoordinates(
    altitude: (json['altitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SmartCacheCoordinatesToJson(
    SmartCacheCoordinates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('altitude', instance.altitude);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}

SmartCacheFlexibleDate _$SmartCacheFlexibleDateFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type']);
  return SmartCacheFlexibleDate(
    type:
        _$enumDecodeNullable(_$SmartCacheFlexibleDateTypeEnumMap, json['type']),
    daysOfWeek: (json['days_of_week'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SmartCacheDayOfWeekEnumMap, e))
        ?.toList(),
    max: json['max'] == null ? null : DateTime.parse(json['max'] as String),
    min: json['min'] == null ? null : DateTime.parse(json['min'] as String),
  );
}

Map<String, dynamic> _$SmartCacheFlexibleDateToJson(
    SmartCacheFlexibleDate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'days_of_week',
      instance.daysOfWeek
          ?.map((e) => _$SmartCacheDayOfWeekEnumMap[e])
          ?.toList());
  writeNotNull('max', JSONParserUtils.formatDate(instance.max));
  writeNotNull('min', JSONParserUtils.formatDate(instance.min));
  writeNotNull('type', _$SmartCacheFlexibleDateTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheFlexibleDateTypeEnumMap = {
  SmartCacheFlexibleDateType.open: 'OPEN',
  SmartCacheFlexibleDateType.range: 'RANGE',
};

const _$SmartCacheDayOfWeekEnumMap = {
  SmartCacheDayOfWeek.monday: 'MONDAY',
  SmartCacheDayOfWeek.tuesday: 'TUESDAY',
  SmartCacheDayOfWeek.wednesday: 'WEDNESDAY',
  SmartCacheDayOfWeek.thursday: 'THURSDAY',
  SmartCacheDayOfWeek.friday: 'FRIDAY',
  SmartCacheDayOfWeek.saturday: 'SATURDAY',
  SmartCacheDayOfWeek.sunday: 'SUNDAY',
};

SmartCacheFixedDate _$SmartCacheFixedDateFromJson(Map<String, dynamic> json) {
  return SmartCacheFixedDate(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    plusMinus: json['plus_minus'] as int,
  );
}

Map<String, dynamic> _$SmartCacheFixedDateToJson(SmartCacheFixedDate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', JSONParserUtils.formatDate(instance.date));
  writeNotNull('plus_minus', instance.plusMinus);
  return val;
}

SmartCacheFlexibleJourneyDays _$SmartCacheFlexibleJourneyDaysFromJson(
    Map<String, dynamic> json) {
  return SmartCacheFlexibleJourneyDays(
    min: json['min'] as int,
    max: json['max'] as int,
  );
}

Map<String, dynamic> _$SmartCacheFlexibleJourneyDaysToJson(
    SmartCacheFlexibleJourneyDays instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max', instance.max);
  writeNotNull('min', instance.min);
  return val;
}

SmartCacheFlexibleTime _$SmartCacheFlexibleTimeFromJson(
    Map<String, dynamic> json) {
  return SmartCacheFlexibleTime(
    min: json['min'] == null ? null : DateTime.parse(json['min'] as String),
    max: json['max'] == null ? null : DateTime.parse(json['max'] as String),
  );
}

Map<String, dynamic> _$SmartCacheFlexibleTimeToJson(
    SmartCacheFlexibleTime instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max', JSONParserUtils.formatTime(instance.max));
  writeNotNull('min', JSONParserUtils.formatTime(instance.min));
  return val;
}

SmartCacheRecommendationSection _$SmartCacheRecommendationSectionFromJson(
    Map<String, dynamic> json) {
  return SmartCacheRecommendationSection(
    name: json['name'] as String,
    offers: (json['offers'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheOffer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    request: json['request'] == null
        ? null
        : SmartCacheBestDealRequest.fromJson(
            json['request'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(
        _$SmartCacheRecommendationSectionTypeEnumMap, json['type']),
    nextRequestKey: json['continuation_token'] as String,
  );
}

Map<String, dynamic> _$SmartCacheRecommendationSectionToJson(
    SmartCacheRecommendationSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('offers', instance.offers?.map((e) => e?.toJson())?.toList());
  writeNotNull('request', instance.request?.toJson());
  writeNotNull(
      'type', _$SmartCacheRecommendationSectionTypeEnumMap[instance.type]);
  writeNotNull('continuation_token', instance.nextRequestKey);
  return val;
}

const _$SmartCacheRecommendationSectionTypeEnumMap = {
  SmartCacheRecommendationSectionType.recommendation: 'RECOMMENDATION',
  SmartCacheRecommendationSectionType.lowestFare: 'LOWEST_FARE',
};

SmartCacheHomePageDateRecommendation
    _$SmartCacheHomePageDateRecommendationFromJson(Map<String, dynamic> json) {
  return SmartCacheHomePageDateRecommendation(
    name: json['name'] as String,
    offers: (json['offers'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheOffer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    request: json['request'] == null
        ? null
        : SmartCacheBestDealRequest.fromJson(
            json['request'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(
        _$SmartCacheHomePageSectionTypeEnumMap, json['type']),
    nextRequestKey: json['continuation_token'] as String,
    thumbnail: json['avatar'] as String,
  );
}

Map<String, dynamic> _$SmartCacheHomePageDateRecommendationToJson(
    SmartCacheHomePageDateRecommendation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('offers', instance.offers?.map((e) => e?.toJson())?.toList());
  writeNotNull('request', instance.request?.toJson());
  writeNotNull('type', _$SmartCacheHomePageSectionTypeEnumMap[instance.type]);
  writeNotNull('continuation_token', instance.nextRequestKey);
  writeNotNull('avatar', instance.thumbnail);
  return val;
}

const _$SmartCacheHomePageSectionTypeEnumMap = {
  SmartCacheHomePageSectionType.recommendation: 'RECOMMENDATION',
  SmartCacheHomePageSectionType.lowestFare: 'LOWEST_FARE',
  SmartCacheHomePageSectionType.dateRecommendation: 'FILTER_RECO',
};

SmartCacheHomePageSection _$SmartCacheHomePageSectionFromJson(
    Map<String, dynamic> json) {
  return SmartCacheHomePageSection(
    name: json['name'] as String,
    offers: (json['offers'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheOffer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    request: json['request'] == null
        ? null
        : SmartCacheBestDealRequest.fromJson(
            json['request'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(
        _$SmartCacheHomePageSectionTypeEnumMap, json['type']),
    nextRequestKey: json['continuation_token'] as String,
  );
}

Map<String, dynamic> _$SmartCacheHomePageSectionToJson(
    SmartCacheHomePageSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('offers', instance.offers?.map((e) => e?.toJson())?.toList());
  writeNotNull('request', instance.request?.toJson());
  writeNotNull('type', _$SmartCacheHomePageSectionTypeEnumMap[instance.type]);
  writeNotNull('continuation_token', instance.nextRequestKey);
  return val;
}

SmartCacheHop _$SmartCacheHopFromJson(Map<String, dynamic> json) {
  return SmartCacheHop(
    arrivalDate: json['arrival_date'] as String,
    arrivalTime: json['arrival_time'] as String,
    departureDate: json['departure_date'] as String,
    departureTime: json['departure_time'] as String,
    destinationCity: json['destination_city'] == null
        ? null
        : SmartCacheCity.fromJson(
            json['destination_city'] as Map<String, dynamic>),
    duration: json['duration'] as int,
    id: json['id'] as String,
    originCity: json['origin_city'] == null
        ? null
        : SmartCacheCity.fromJson(json['origin_city'] as Map<String, dynamic>),
    stopoverDuration: json['stopover_duration'] as num,
    transportServices: (json['transport_services'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheTransportService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$SmartCacheHopTypeEnumMap, json['type']),
    airlineLogo: json['airline_logo'] as String,
  );
}

Map<String, dynamic> _$SmartCacheHopToJson(SmartCacheHop instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arrival_date', instance.arrivalDate);
  writeNotNull('arrival_time', instance.arrivalTime);
  writeNotNull('departure_date', instance.departureDate);
  writeNotNull('departure_time', instance.departureTime);
  writeNotNull('destination_city', instance.destinationCity?.toJson());
  writeNotNull('duration', instance.duration);
  writeNotNull('id', instance.id);
  writeNotNull('origin_city', instance.originCity?.toJson());
  writeNotNull('stopover_duration', instance.stopoverDuration);
  writeNotNull('transport_services',
      instance.transportServices?.map((e) => e?.toJson())?.toList());
  writeNotNull('type', _$SmartCacheHopTypeEnumMap[instance.type]);
  writeNotNull('airline_logo', instance.airlineLogo);
  return val;
}

const _$SmartCacheHopTypeEnumMap = {
  SmartCacheHopType.outbound: 'OUTBOUND',
  SmartCacheHopType.inbound: 'INBOUND',
};

SmartCacheHopDate _$SmartCacheHopDateFromJson(Map<String, dynamic> json) {
  return SmartCacheHopDate(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    flexibleDate: json['flexible_date'] == null
        ? null
        : SmartCacheFlexibleDate.fromJson(
            json['flexible_date'] as Map<String, dynamic>),
    fixedDate: json['fixed_date'] == null
        ? null
        : SmartCacheFixedDate.fromJson(
            json['fixed_date'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$SmartCacheHopDateTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheHopDateToJson(SmartCacheHopDate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', JSONParserUtils.formatDate(instance.date));
  writeNotNull('flexible_date', instance.flexibleDate?.toJson());
  writeNotNull('fixed_date', instance.fixedDate?.toJson());
  writeNotNull('type', _$SmartCacheHopDateTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheHopDateTypeEnumMap = {
  SmartCacheHopDateType.departure: 'DEPARTURE',
  SmartCacheHopDateType.arrival: 'ARRIVAL',
};

SmartCacheHopDuration _$SmartCacheHopDurationFromJson(
    Map<String, dynamic> json) {
  return SmartCacheHopDuration(
    min: json['min'] as int,
    max: json['max'] as int,
  );
}

Map<String, dynamic> _$SmartCacheHopDurationToJson(
    SmartCacheHopDuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max', instance.max);
  writeNotNull('min', instance.min);
  return val;
}

SmartCacheHopTime _$SmartCacheHopTimeFromJson(Map<String, dynamic> json) {
  return SmartCacheHopTime(
    flexibleTime: json['flexible_time'] == null
        ? null
        : SmartCacheFlexibleTime.fromJson(
            json['flexible_time'] as Map<String, dynamic>),
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    type: _$enumDecodeNullable(_$SmartCacheHopTimeTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheHopTimeToJson(SmartCacheHopTime instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flexible_time', instance.flexibleTime?.toJson());
  writeNotNull('time', JSONParserUtils.formatTime(instance.time));
  writeNotNull('type', _$SmartCacheHopTimeTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheHopTimeTypeEnumMap = {
  SmartCacheHopTimeType.departure: 'DEPARTURE',
  SmartCacheHopTimeType.arrival: 'ARRIVAL',
};

SmartCacheJourneyDays _$SmartCacheJourneyDaysFromJson(
    Map<String, dynamic> json) {
  return SmartCacheJourneyDays(
    flexibleJourneyDays: json['flexible_journey_days'] == null
        ? null
        : SmartCacheFlexibleJourneyDays.fromJson(
            json['flexible_journey_days'] as Map<String, dynamic>),
    journeyDays: json['journey_days'] as int,
  );
}

Map<String, dynamic> _$SmartCacheJourneyDaysToJson(
    SmartCacheJourneyDays instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flexible_journey_days', instance.flexibleJourneyDays?.toJson());
  writeNotNull('journey_days', instance.journeyDays);
  return val;
}

SmartCacheDistance _$SmartCacheDistanceFromJson(Map<String, dynamic> json) {
  return SmartCacheDistance(
    min: json['min'] as int,
    max: json['max'] as int,
  );
}

Map<String, dynamic> _$SmartCacheDistanceToJson(SmartCacheDistance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max', instance.max);
  writeNotNull('min', instance.min);
  return val;
}

SmartCacheLocation _$SmartCacheLocationFromJson(Map<String, dynamic> json) {
  return SmartCacheLocation(
    id: json['id'] as String,
    type: _$enumDecodeNullable(_$SmartCacheLocationTypeEnumMap, json['type']),
    name: json['name'] as String,
    code: json['code'] as String,
    codeType:
        _$enumDecodeNullable(_$SmartCacheCodeTypeEnumMap, json['code_type']),
    coordinates: json['coordinate'] == null
        ? null
        : SmartCacheCoordinates.fromJson(
            json['coordinate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmartCacheLocationToJson(SmartCacheLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$SmartCacheLocationTypeEnumMap[instance.type]);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('code_type', _$SmartCacheCodeTypeEnumMap[instance.codeType]);
  writeNotNull('coordinate', instance.coordinates?.toJson());
  return val;
}

const _$SmartCacheLocationTypeEnumMap = {
  SmartCacheLocationType.airport: 'AIRPORT',
  SmartCacheLocationType.trainStation: 'TRAINSTATION',
  SmartCacheLocationType.fairy: 'FURRY',
  SmartCacheLocationType.unknown: 'UNKNOWN',
};

const _$SmartCacheCodeTypeEnumMap = {
  SmartCacheCodeType.iata: 'IATA',
  SmartCacheCodeType.iso3316: 'ISO3316',
  SmartCacheCodeType.ipv4: 'IPv4',
  SmartCacheCodeType.ipv6: 'IPv6',
  SmartCacheCodeType.mowgli: 'MowgliCategory',
  SmartCacheCodeType.custom: 'CustomCategory',
};

SmartCacheFixedLocation _$SmartCacheFixedLocationFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type']);
  return SmartCacheFixedLocation(
    type: _$enumDecodeNullable(
        _$SmartCacheFixedLocationTypeEnumMap, json['type']),
    code: json['code'] as String,
    codeTypes:
        _$enumDecodeNullable(_$SmartCacheCodeTypeEnumMap, json['code_type']),
    customerLocations: (json['customer_locations'] as List)?.map((e) =>
        e == null
            ? null
            : SmartCacheFixedLocation.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$SmartCacheFixedLocationToJson(
    SmartCacheFixedLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('code_type', _$SmartCacheCodeTypeEnumMap[instance.codeTypes]);
  writeNotNull('type', _$SmartCacheFixedLocationTypeEnumMap[instance.type]);
  writeNotNull('customer_locations',
      instance.customerLocations?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$SmartCacheFixedLocationTypeEnumMap = {
  SmartCacheFixedLocationType.airport: 'AIRPORT',
  SmartCacheFixedLocationType.city: 'CITY',
};

SmartCacheCity _$SmartCacheCityFromJson(Map<String, dynamic> json) {
  return SmartCacheCity(
    id: json['id'] as String,
    name: json['name'] as String,
    code: json['code'] as String,
    codeType:
        _$enumDecodeNullable(_$SmartCacheCodeTypeEnumMap, json['code_type']),
    coordinates: json['coordinate'] == null
        ? null
        : SmartCacheCoordinates.fromJson(
            json['coordinate'] as Map<String, dynamic>),
    thumbnail: json['avatar'] as String,
    type: _$enumDecodeNullable(
        _$SmartCacheRequestDestinationTypeEnumMap, json['type']),
    customerLocations: (json['customer_locations'] as List)?.map((e) =>
        e == null
            ? null
            : SmartCacheLocation.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$SmartCacheCityToJson(SmartCacheCity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('code_type', _$SmartCacheCodeTypeEnumMap[instance.codeType]);
  writeNotNull('coordinate', instance.coordinates?.toJson());
  writeNotNull('avatar', instance.thumbnail);
  writeNotNull(
      'type', _$SmartCacheRequestDestinationTypeEnumMap[instance.type]);
  writeNotNull('customer_locations',
      instance.customerLocations?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$SmartCacheRequestDestinationTypeEnumMap = {
  SmartCacheRequestDestinationType.airport: 'AIRPORT',
  SmartCacheRequestDestinationType.city: 'CITY',
  SmartCacheRequestDestinationType.country: 'COUNTRY',
  SmartCacheRequestDestinationType.continent: 'CONTINENT',
  SmartCacheRequestDestinationType.category: 'CATEGORY',
  SmartCacheRequestDestinationType.open: 'OPEN',
};

SmartCacheCountrySubdivision _$SmartCacheCountrySubdivisionFromJson(
    Map<String, dynamic> json) {
  return SmartCacheCountrySubdivision(
    id: json['id'] as String,
    name: json['name'] as String,
    code: json['code'] as String,
    codeType:
        _$enumDecodeNullable(_$SmartCacheCodeTypeEnumMap, json['code_type']),
    avatar: json['avatar'] as String,
  );
}

Map<String, dynamic> _$SmartCacheCountrySubdivisionToJson(
    SmartCacheCountrySubdivision instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('code_type', _$SmartCacheCodeTypeEnumMap[instance.codeType]);
  writeNotNull('avatar', instance.avatar);
  return val;
}

SmartCacheOffer _$SmartCacheOfferFromJson(Map<String, dynamic> json) {
  return SmartCacheOffer(
    hops: (json['hops'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheHop.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    serviceBundles: (json['service_bundles'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheServiceBundle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalAmount: json['total_amount'] == null
        ? null
        : SmartCacheAmount.fromJson(
            json['total_amount'] as Map<String, dynamic>),
    totalTax: json['total_tax'] == null
        ? null
        : SmartCacheAmount.fromJson(json['total_tax'] as Map<String, dynamic>),
    travelers: (json['travelers'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheTraveler.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    viewedAt: JSONParserUtils.parseDateTime(json['viewed_at']),
  )..tips = json['mowgli_tips'] == null
      ? null
      : SmartCacheMowgliTips.fromJson(
          json['mowgli_tips'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SmartCacheOfferToJson(SmartCacheOffer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hops', instance.hops?.map((e) => e?.toJson())?.toList());
  writeNotNull('id', instance.id);
  writeNotNull('service_bundles',
      instance.serviceBundles?.map((e) => e?.toJson())?.toList());
  writeNotNull('total_amount', instance.totalAmount?.toJson());
  writeNotNull('total_tax', instance.totalTax?.toJson());
  writeNotNull(
      'travelers', instance.travelers?.map((e) => e?.toJson())?.toList());
  writeNotNull('viewed_at', instance.viewedAt?.toIso8601String());
  writeNotNull('mowgli_tips', instance.tips?.toJson());
  return val;
}

SmartCacheRequestOrigin _$SmartCacheRequestOriginFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type']);
  return SmartCacheRequestOrigin(
    type: _$enumDecodeNullable(
        _$SmartCacheRequestOriginTypeEnumMap, json['type']),
    code: json['code'] as String,
    codeTypes:
        _$enumDecodeNullable(_$SmartCacheCodeTypeEnumMap, json['code_type']),
    customerLocations: (json['customer_locations'] as List)?.map((e) =>
        e == null
            ? null
            : SmartCacheRequestOrigin.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$SmartCacheRequestOriginToJson(
    SmartCacheRequestOrigin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('code_type', _$SmartCacheCodeTypeEnumMap[instance.codeTypes]);
  writeNotNull('type', _$SmartCacheRequestOriginTypeEnumMap[instance.type]);
  writeNotNull('customer_locations',
      instance.customerLocations?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$SmartCacheRequestOriginTypeEnumMap = {
  SmartCacheRequestOriginType.airport: 'AIRPORT',
  SmartCacheRequestOriginType.city: 'CITY',
  SmartCacheRequestOriginType.ip: 'IP',
};

SmartCacheRequestDestination _$SmartCacheRequestDestinationFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type']);
  return SmartCacheRequestDestination(
    type: _$enumDecodeNullable(
        _$SmartCacheRequestDestinationTypeEnumMap, json['type']),
    codes: (json['codes'] as List)?.map((e) => e as String)?.toList(),
    codeTypes:
        _$enumDecodeNullable(_$SmartCacheCodeTypeEnumMap, json['code_type']),
  );
}

Map<String, dynamic> _$SmartCacheRequestDestinationToJson(
    SmartCacheRequestDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codes', instance.codes);
  writeNotNull('code_type', _$SmartCacheCodeTypeEnumMap[instance.codeTypes]);
  writeNotNull(
      'type', _$SmartCacheRequestDestinationTypeEnumMap[instance.type]);
  return val;
}

SmartCacheService _$SmartCacheServiceFromJson(Map<String, dynamic> json) {
  return SmartCacheService(
    attributes: json['attributes'] as Map<String, dynamic>,
    description: json['description'] as String,
    id: json['id'] as String,
    marketingName: json['marketing_name'] as String,
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$SmartCacheServiceTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheServiceToJson(SmartCacheService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributes', instance.attributes);
  writeNotNull('description', instance.description);
  writeNotNull('id', instance.id);
  writeNotNull('marketing_name', instance.marketingName);
  writeNotNull('name', instance.name);
  writeNotNull('type', _$SmartCacheServiceTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheServiceTypeEnumMap = {
  SmartCacheServiceType.cabinBlass: 'CABINCLASS',
  SmartCacheServiceType.baggage: 'BAGGAGE',
  SmartCacheServiceType.other: 'OTHER',
};

SmartCacheServiceBundle _$SmartCacheServiceBundleFromJson(
    Map<String, dynamic> json) {
  return SmartCacheServiceBundle(
    id: json['id'] as String,
    services: (json['services'] as List)
        ?.map((e) => e == null
            ? null
            : SmartCacheService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    transportServiceId: json['transport_service_id'] as String,
    travelerIds:
        (json['traveler_ids'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SmartCacheServiceBundleToJson(
    SmartCacheServiceBundle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull(
      'services', instance.services?.map((e) => e?.toJson())?.toList());
  writeNotNull('transport_service_id', instance.transportServiceId);
  writeNotNull('traveler_ids', instance.travelerIds);
  return val;
}

SmartCacheTransportService _$SmartCacheTransportServiceFromJson(
    Map<String, dynamic> json) {
  return SmartCacheTransportService(
    arrivalDate: json['arrival_date'] as String,
    arrivalTime: json['arrival_time'] as String,
    departureDate: json['departure_date'] as String,
    departureTime: json['departure_time'] as String,
    destination: json['destination'] == null
        ? null
        : SmartCacheLocation.fromJson(
            json['destination'] as Map<String, dynamic>),
    duration: json['duration'] as int,
    equipment: json['equipment'] as String,
    equipmentName: json['equipment_name'] as String,
    id: json['id'] as String,
    marketingCarrier: json['marketing_carrier'] == null
        ? null
        : SmartCacheCarrier.fromJson(
            json['marketing_carrier'] as Map<String, dynamic>),
    marketingDesignator: json['marketing_designator'] as String,
    operatingCarrier: json['operating_carrier'] == null
        ? null
        : SmartCacheCarrier.fromJson(
            json['operating_carrier'] as Map<String, dynamic>),
    operatingDesignator: json['operating_designator'] as String,
    origin: json['origin'] == null
        ? null
        : SmartCacheLocation.fromJson(json['origin'] as Map<String, dynamic>),
    stopoverDuration: json['stopover_duration'] as int,
    type: _$enumDecodeNullable(
        _$SmartCacheTransportServiceTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheTransportServiceToJson(
    SmartCacheTransportService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arrival_date', instance.arrivalDate);
  writeNotNull('arrival_time', instance.arrivalTime);
  writeNotNull('departure_date', instance.departureDate);
  writeNotNull('departure_time', instance.departureTime);
  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('duration', instance.duration);
  writeNotNull('equipment', instance.equipment);
  writeNotNull('equipment_name', instance.equipmentName);
  writeNotNull('id', instance.id);
  writeNotNull('marketing_carrier', instance.marketingCarrier?.toJson());
  writeNotNull('marketing_designator', instance.marketingDesignator);
  writeNotNull('operating_carrier', instance.operatingCarrier?.toJson());
  writeNotNull('operating_designator', instance.operatingDesignator);
  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull('stopover_duration', instance.stopoverDuration);
  writeNotNull('type', _$SmartCacheTransportServiceTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheTransportServiceTypeEnumMap = {
  SmartCacheTransportServiceType.flight: 'FLIGHT',
  SmartCacheTransportServiceType.train: 'TRAIN',
};

SmartCacheCarrier _$SmartCacheCarrierFromJson(Map<String, dynamic> json) {
  return SmartCacheCarrier(
    name: json['name'] as String,
    code: json['code'] as String,
    logo: json['avatar'] as String,
  );
}

Map<String, dynamic> _$SmartCacheCarrierToJson(SmartCacheCarrier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('avatar', instance.logo);
  return val;
}

SmartCacheTraveler _$SmartCacheTravelerFromJson(Map<String, dynamic> json) {
  return SmartCacheTraveler(
    id: json['id'] as String,
    serviceBundleIds:
        (json['service_bundle_ids'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$SmartCacheTravelerTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheTravelerToJson(SmartCacheTraveler instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('service_bundle_ids', instance.serviceBundleIds);
  writeNotNull('type', _$SmartCacheTravelerTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheTravelerTypeEnumMap = {
  SmartCacheTravelerType.adult: 'ADULT',
  SmartCacheTravelerType.child: 'CHILD',
  SmartCacheTravelerType.infant: 'INFANT',
};

SmartCacheMowgliTips _$SmartCacheMowgliTipsFromJson(Map<String, dynamic> json) {
  return SmartCacheMowgliTips(
    averagePrice: json['is_average_price'] == null
        ? null
        : SmartCacheMowgliTipAveragePrice.fromJson(
            json['is_average_price'] as Map<String, dynamic>),
    lowestPrice: json['is_lowest_price'] == null
        ? null
        : SmartCacheMowgliTipLowestPrice.fromJson(
            json['is_lowest_price'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmartCacheMowgliTipsToJson(
    SmartCacheMowgliTips instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_average_price', instance.averagePrice?.toJson());
  writeNotNull('is_lowest_price', instance.lowestPrice?.toJson());
  return val;
}

SmartCacheMowgliTipLowestPrice _$SmartCacheMowgliTipLowestPriceFromJson(
    Map<String, dynamic> json) {
  return SmartCacheMowgliTipLowestPrice(
    title: json['title'] as String,
    description: json['description'] as String,
    type: _$enumDecodeNullable(
        _$SmartCacheMowgliTipLowestPriceTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheMowgliTipLowestPriceToJson(
    SmartCacheMowgliTipLowestPrice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull(
      'type', _$SmartCacheMowgliTipLowestPriceTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheMowgliTipLowestPriceTypeEnumMap = {
  SmartCacheMowgliTipLowestPriceType.lowestPrice: 'LOWESTPRICE',
  SmartCacheMowgliTipLowestPriceType.nonLowestPrice: 'NONLOWESTPRICE',
};

SmartCacheMowgliTipAveragePrice _$SmartCacheMowgliTipAveragePriceFromJson(
    Map<String, dynamic> json) {
  return SmartCacheMowgliTipAveragePrice(
    title: json['title'] as String,
    description: json['description'] as String,
    type: _$enumDecodeNullable(
        _$SmartCacheMowgliTipAveragePriceTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SmartCacheMowgliTipAveragePriceToJson(
    SmartCacheMowgliTipAveragePrice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull(
      'type', _$SmartCacheMowgliTipAveragePriceTypeEnumMap[instance.type]);
  return val;
}

const _$SmartCacheMowgliTipAveragePriceTypeEnumMap = {
  SmartCacheMowgliTipAveragePriceType.average: 'AVERAGEPRICE',
  SmartCacheMowgliTipAveragePriceType.expensive: 'EXPENSIVE',
  SmartCacheMowgliTipAveragePriceType.superDeal: 'SUPERDEAL',
};
