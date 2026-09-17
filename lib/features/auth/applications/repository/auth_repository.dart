// TODO: Define the rest once the login/OTP usecases land. Kept separate from
// cores/domain/auth_local_data_source.dart and auth_token_refresher.dart on
// purpose — those two are frozen to what the interceptors need; this
// repository is where the rest of Auth's business logic attaches.
// Google sign-in is implemented; requestOtp/verifyOtp/refreshToken/
// isLoggedIn/authLogout/getCurrentTokens/authDeleteAccount are still TODO.
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';

abstract class AuthRepository {
  Future<ResultEntity<void>> requestOtp(String phoneNumber);

  Future<ResultEntity<void>> verifyOtp(String phoneNumber, String otp);

  Future<ResultEntity<void>> refreshToken(String refreshToken);

  Future<ResultEntity<bool>> isLoggedIn();

  Future<ResultEntity<void>> authLogout();

  Future<ResultEntity<AuthSessionEntity>> getCurrentTokens();

  Future<ResultEntity<void>> authDeleteAccount();

  Future<ResultEntity<AuthSessionEntity>> signInWithGoogle();
}
