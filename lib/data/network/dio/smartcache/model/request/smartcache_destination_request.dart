import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mowgli/data/network/dio/smartcache/model/smartcache_model.dart';
import 'package:mowgli/ui/utils/json_parser.dart';

part 'smartcache_destination_request.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SmartCacheDestinationRequest {
  @JsonKey(required: true)
  SmartCacheFixedLocation origin;
  @JsonKey(required: true)
  SmartCacheFixedLocation destination;
  @JsonKey(
    required: true,
    name: 'outbound_date',
    toJson: JSONParserUtils.formatDate,
  )
  DateTime outboundDate;
  @JsonKey(
    required: true,
    name: 'inbound_date',
    toJson: JSONParserUtils.formatDate,
  )
  DateTime inboundDate;
  @JsonKey(required: true)
  SmartCacheJourneyType type;
  @JsonKey(name: 'stopovers')
  int maxStopOvers;
  SmartCacheDistance distance;
  int checkedBaggage;
  SmartCacheCabinType cabin;
  String locale;
  @JsonKey(name: 'avatar_width')
  int imageSize;

  SmartCacheDestinationRequest(
      {@required this.origin,
      @required this.destination,
      @required this.outboundDate,
      @required this.type,
      this.inboundDate,
      this.maxStopOvers,
      this.distance,
      this.checkedBaggage,
      this.cabin,
      this.locale,
      this.imageSize});

  factory SmartCacheDestinationRequest.fromJson(Map<String, dynamic> json) =>
      _$SmartCacheDestinationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SmartCacheDestinationRequestToJson(this);

  SmartCacheDestinationRequest copyWith(
          {SmartCacheFixedLocation origin,
          SmartCacheFixedLocation destination,
          DateTime outboundDate,
          DateTime inboundDate,
          SmartCacheJourneyType type,
          int maxStopOvers,
          SmartCacheDistance distance,
          int checkedBaggage,
          SmartCacheCabinType cabin,
          String locale,
          int imageSize}) =>
      SmartCacheDestinationRequest(
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        outboundDate: outboundDate ?? this.outboundDate,
        inboundDate: inboundDate ?? this.inboundDate,
        type: type ?? this.type,
        maxStopOvers: maxStopOvers ?? this.maxStopOvers,
        distance: distance ?? this.distance,
        checkedBaggage: checkedBaggage ?? this.checkedBaggage,
        cabin: cabin ?? this.cabin,
        locale: locale ?? this.locale,
        imageSize: imageSize ?? this.imageSize,
      );
}
