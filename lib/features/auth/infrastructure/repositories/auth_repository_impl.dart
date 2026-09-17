import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import 'package:seedly_app/features/auth/applications/entities/auth_session_entities.dart';
import 'package:seedly_app/features/auth/applications/repository/auth_repository.dart';
import 'package:seedly_app/features/auth/infrastructure/datasources/auth_local_data_source.dart';
import 'package:seedly_app/features/auth/infrastructure/datasources/google_auth_data_source.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_google_sign_in_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/services/remote/auth_remote_service.dart';

// TODO: Implement requestOtp/verifyOtp/refreshToken/isLoggedIn/authLogout/
// getCurrentTokens/authDeleteAccount alongside the OTP login usecases.
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._authRemoteService,
    this._googleAuthDataSource,
    this._authSessionLocalDataSource,
    this._baseDioErrorHandler,
  );

  final AuthRemoteService _authRemoteService;
  final GoogleAuthDataSource _googleAuthDataSource;
  final AuthSessionLocalDataSource _authSessionLocalDataSource;
  final BaseDioErrorHandler _baseDioErrorHandler;

  @override
  Future<ResultEntity<AuthSessionEntity>> signInWithGoogle() async {
    try {
      final idToken = await _googleAuthDataSource.signIn();
      final response = await _authRemoteService.googleSignIn(
        AuthGoogleSignInRequestModel(idToken: idToken),
      );
      final session = response.data.toDomain();
      await _authSessionLocalDataSource.setToken(
        accessToken: session.accessToken,
        refreshToken: session.refreshToken ?? '',
      );
      return ResultEntity.success(data: session);
    } on GoogleSignInException catch (error) {
      final message = error.code == GoogleSignInExceptionCode.canceled
          ? 'Sign in was cancelled.'
          : error.description ?? 'Google sign-in failed.';
      return ResultEntity.error(message: message);
    } on DioException catch (error) {
      return _baseDioErrorHandler.handleDioError(error) ??
          ResultEntity.error(message: error.message);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }

  @override
  Future<ResultEntity<void>> requestOtp(String phoneNumber) {
    throw UnimplementedError();
  }

  @override
  Future<ResultEntity<void>> verifyOtp(String phoneNumber, String otp) {
    throw UnimplementedError();
  }

  @override
  Future<ResultEntity<void>> refreshToken(String refreshToken) {
    throw UnimplementedError();
  }

  @override
  Future<ResultEntity<bool>> isLoggedIn() {
    throw UnimplementedError();
  }

  @override
  Future<ResultEntity<void>> authLogout() {
    throw UnimplementedError();
  }

  @override
  Future<ResultEntity<AuthSessionEntity>> getCurrentTokens() {
    throw UnimplementedError();
  }

  @override
  Future<ResultEntity<void>> authDeleteAccount() {
    throw UnimplementedError();
  }
}
