import 'package:json_annotation/json_annotation.dart';
import 'package:growpico_app/cores/data/remote/response/remote_response_mapper.dart';
import 'package:growpico_app/features/auth/applications/entities/auth_session_entities.dart';

part 'auth_account_session_response.g.dart';

/// Session payload for /v1/account/auth/login + /register
/// (api_contracts_backend.md §1). camelCase — do NOT reuse the legacy
/// snake_case AuthSessionResponse.
@JsonSerializable()
class AccountAuthSessionResponse
    implements ResponseMapper<AuthSessionEntity> {
  const AccountAuthSessionResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  factory AccountAuthSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountAuthSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountAuthSessionResponseToJson(this);

  @override
  AuthSessionEntity toDomain() => AuthSessionEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}
