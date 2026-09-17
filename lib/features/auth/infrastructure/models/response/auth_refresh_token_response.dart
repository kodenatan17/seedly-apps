import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/cores/domain/auth_refresh_token_result.dart';

part 'auth_refresh_token_response.g.dart';

@JsonSerializable()
class AuthRefreshTokenResponse
    implements ResponseMapper<AuthRefreshTokenResult> {
  const AuthRefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    this.agoraId,
  });

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'agora_id')
  final String? agoraId;

  factory AuthRefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthRefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRefreshTokenResponseToJson(this);

  @override
  AuthRefreshTokenResult toDomain() => AuthRefreshTokenResult(
    accessToken: accessToken,
    refreshToken: refreshToken,
    agoraId: agoraId,
  );
}
