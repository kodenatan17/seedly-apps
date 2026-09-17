import 'package:json_annotation/json_annotation.dart';

part 'auth_refresh_token_request_model.g.dart';

@JsonSerializable()
class AuthRefreshTokenRequestModel {
  const AuthRefreshTokenRequestModel({required this.refreshToken});

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  factory AuthRefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRefreshTokenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRefreshTokenRequestModelToJson(this);
}
