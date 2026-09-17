import 'package:seedly_app/cores/domain/auth_refresh_token_result.dart';
import 'package:seedly_app/cores/domain/auth_token_refresher.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_refresh_token_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/services/remote/auth_remote_service.dart';

/// Adapter that keeps [AuthRefreshTokenRequestModel]/response DTOs from ever
/// reaching cores/ — the only thing crossing the boundary is
/// [AuthRefreshTokenResult].
///
/// Exception-transparent by design: `RefreshTokenInterceptor.onError` already
/// wraps the call in a try/catch and rejects the original error on failure.
class AuthTokenRefresherImpl implements AuthTokenRefresher {
  const AuthTokenRefresherImpl(this._authRemoteService);

  final AuthRemoteService _authRemoteService;

  @override
  Future<AuthRefreshTokenResult> refreshToken(String refreshToken) async {
    final response = await _authRemoteService.refreshToken(
      AuthRefreshTokenRequestModel(refreshToken: refreshToken),
    );
    return response.data.toDomain();
  }
}
