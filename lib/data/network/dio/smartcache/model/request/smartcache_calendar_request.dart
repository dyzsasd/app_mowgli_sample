import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_calendar_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheCalendarRequest {
  @JsonKey(required: true)
  SmartCacheRequestOrigin origin;
  @JsonKey(required: true)
  SmartCacheRequestDestination destination;
  @JsonKey(name: 'outbound_date', required: true)
  SmartCacheHopDate outboundDate;
  @JsonKey(name: 'inbound_date', required: true)
  SmartCacheHopDate inboundDate;
  @JsonKey(required: true)
  SmartCacheJourneyType type;
  @JsonKey(name: 'journey_days')
  SmartCacheJourneyDays journeyDays;
  @JsonKey(name: 'max_stopovers')
  int maxStopOvers;
  SmartCacheDistance distance;
  @JsonKey(name: 'hop_duration')
  SmartCacheHopDuration hopDuration;
  @JsonKey(name: 'checked_baggage')
  int checkedBaggage;
  SmartCacheCabinType cabin;
  SmartCacheCurrency currency;
  @JsonKey(name: 'calendar_field', required: true)
  SmartCacheCalendarField field;

  SmartCacheCalendarRequest(
      {@required this.origin,
      @required this.destination,
      @required this.type,
      @required this.outboundDate,
      @required this.inboundDate,
      @required this.field,
      this.journeyDays,
      this.maxStopOvers,
      this.distance,
      this.hopDuration,
      this.checkedBaggage,
      this.cabin,
      this.currency});

  factory SmartCacheCalendarRequest.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheCalendarRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheCalendarRequestToJson(this);
}

enum SmartCacheCalendarField {
  @JsonValue('OUTBOUND_DEPARTURE_DATE')
  outbound,
  @JsonValue('INBOUND_DEPARTURE_DATE')
  inbound
}
