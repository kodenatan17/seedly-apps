import 'package:seedly_app/cores/domain/auth_refresh_token_result.dart';

/// Token-refresh contract needed by `RefreshTokenInterceptor`.
///
/// Deliberately not named `AuthRemoteService` — that name is reserved for
/// the concrete retrofit client living in `features/auth/infrastructure`.
/// The interceptor depends on "something that can refresh a token", not on
/// Auth's HTTP client.
abstract class AuthTokenRefresher {
  Future<AuthRefreshTokenResult> refreshToken(String refreshToken);
}
