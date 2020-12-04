import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';

part 'smartcache_best_deal_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheBestDealRequest {
  @JsonKey(required: true)
  SmartCacheRequestOrigin origin;
  @JsonKey(required: true)
  SmartCacheRequestDestination destination;
  @JsonKey(required: true, name: 'outbound_date')
  SmartCacheHopDate outboundDate;
  @JsonKey(name: 'outbound_time')
  SmartCacheHopTime outboundTime;
  @JsonKey(name: 'inbound_date')
  SmartCacheHopDate inboundDate;
  @JsonKey(name: 'inbound_time')
  SmartCacheHopTime inboundTime;
  @JsonKey(required: true)
  SmartCacheJourneyType type;
  @JsonKey(name: 'journey_days')
  SmartCacheJourneyDays journeyDays;
  @JsonKey(name: 'max_stopovers')
  int maxStopOvers;
  @JsonKey(name: 'hop_duration')
  SmartCacheHopDuration hopDuration;
  SmartCacheDistance distance;
  @JsonKey(name: 'checked_baggage')
  int checkedBaggage;
  SmartCacheCabinType cabin;
  double budget;
  SmartCacheCurrency currency;
  String locale;
  @JsonKey(name: 'continuation_token')
  String continuationToken;
  @JsonKey(defaultValue: 20)
  int size;
  @JsonKey(required: true, name: 'order_by')
  SmartCacheBestDealRequestOrderMetric orderBy;
  @JsonKey(defaultValue: false, name: 'one_by_destination')
  bool oneByDestination;
  @JsonKey(name: 'avatar_width')
  int imageSize;

  SmartCacheBestDealRequest(
      {@required this.origin,
      @required this.destination,
      @required this.outboundDate,
      @required this.type,
      @required this.orderBy,
      this.outboundTime,
      this.inboundDate,
      this.inboundTime,
      this.journeyDays,
      this.maxStopOvers,
      this.hopDuration,
      this.distance,
      this.checkedBaggage,
      this.cabin,
      this.budget,
      this.currency,
      this.locale,
      this.continuationToken,
      this.size,
      this.oneByDestination,
      this.imageSize});

  factory SmartCacheBestDealRequest.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheBestDealRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheBestDealRequestToJson(this);

  SmartCacheBestDealRequest copyWith(
          {SmartCacheRequestOrigin origin,
          SmartCacheRequestDestination destination,
          SmartCacheHopDate outboundDate,
          SmartCacheHopTime outboundTime,
          SmartCacheHopDate inboundDate,
          SmartCacheHopTime inboundTime,
          SmartCacheJourneyType type,
          SmartCacheJourneyDays journeyDays,
          int maxStopOvers,
          SmartCacheHopDuration hopDuration,
          SmartCacheDistance distance,
          int checkedBaggage,
          SmartCacheCabinType cabin,
          double budget,
          SmartCacheCurrency currency,
          String locale,
          String continuationToken,
          int size,
          SmartCacheBestDealRequestOrderMetric orderBy,
          bool oneByDestination,
          int imageSize}) =>
      SmartCacheBestDealRequest(
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        outboundDate: outboundDate ?? this.outboundDate,
        outboundTime: outboundTime ?? this.outboundTime,
        inboundDate: inboundDate ?? this.inboundDate,
        inboundTime: inboundTime ?? this.inboundTime,
        type: type ?? this.type,
        journeyDays: journeyDays ?? this.journeyDays,
        maxStopOvers: maxStopOvers ?? this.maxStopOvers,
        hopDuration: hopDuration ?? this.hopDuration,
        distance: distance ?? this.distance,
        checkedBaggage: checkedBaggage ?? this.checkedBaggage,
        cabin: cabin ?? this.cabin,
        budget: budget ?? this.budget,
        currency: currency ?? this.currency,
        locale: locale ?? this.locale,
        continuationToken: continuationToken ?? this.continuationToken,
        size: size ?? this.size,
        orderBy: orderBy ?? this.orderBy,
        oneByDestination: oneByDestination ?? this.oneByDestination,
        imageSize: imageSize ?? this.imageSize,
      );
}
