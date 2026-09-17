import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';

part 'auth_session_response.g.dart';

/// Login payload returned by `/auth/submit-otp` and `/auth/google-sign-in`.
@JsonSerializable()
class AuthSessionResponse implements ResponseMapper<AuthSessionEntity> {
  const AuthSessionResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  factory AuthSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionResponseToJson(this);

  @override
  AuthSessionEntity toDomain() =>
      AuthSessionEntity(accessToken: accessToken, refreshToken: refreshToken);
}
