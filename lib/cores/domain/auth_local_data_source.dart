/// Session storage contract needed by `cores/services/interceptors`.
///
/// Implemented by `features/auth/infrastructure` and bound here via DI
/// (`AuthModule.register` in `features/auth/di/auth_module.dart`) so cores
/// never imports a concrete Auth class — only this abstraction.
abstract class AuthLocalDataSource {
  Future<bool> isUserLoggedIn();

  Future<String> getAccessToken();

  Future<String> getRefreshToken();

  Future<void> setToken({
    required String accessToken,
    required String refreshToken,
    String? agoraId,
  });
}
