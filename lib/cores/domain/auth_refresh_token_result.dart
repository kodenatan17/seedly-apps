import 'package:equatable/equatable.dart';

/// The only "refresh token result" shape `cores/` ever sees.
///
/// `features/auth` maps its own response DTO onto this before handing it
/// back through [AuthTokenRefresher], so no feature-specific model leaks
/// into cores.
class AuthRefreshTokenResult extends Equatable {
  const AuthRefreshTokenResult({
    required this.accessToken,
    required this.refreshToken,
    this.agoraId,
  });

  final String accessToken;
  final String refreshToken;
  final String? agoraId;

  @override
  List<Object?> get props => [accessToken, refreshToken, agoraId];
}
