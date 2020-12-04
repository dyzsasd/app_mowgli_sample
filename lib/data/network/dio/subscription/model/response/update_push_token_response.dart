import 'package:json_annotation/json_annotation.dart';

part 'update_push_token_response.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UpdatePushTokenResponse {
  @JsonKey(defaultValue: false, name: 'ok', required: true)
  bool value;

  UpdatePushTokenResponse({this.value});

  factory UpdatePushTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePushTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePushTokenResponseToJson(this);
}
