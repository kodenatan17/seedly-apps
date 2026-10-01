import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seedly_app/cores/constant/base_apis.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/cores/data/remote/response/boolean_only_remote_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_forgot_password_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_google_sign_in_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_login_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_register_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_update_profile_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_refresh_token_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_request_otp_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_submit_otp_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_account_session_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_profile_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_refresh_token_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_update_profile_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_session_response.dart';
import 'package:seedly_app/features/auth/infrastructure/services/dio/auth_api_dio.dart';

part 'auth_remote_service.g.dart';

@RestApi()
abstract class AuthRemoteService {
  @factoryMethod
  factory AuthRemoteService(AuthApiDio dio, {String baseUrl}) =
      _AuthRemoteService;

  @POST(BaseApis.authRequestOtp)
  Future<BaseSuccessResponse<dynamic>> requestOtp(
    @Body() AuthRequestOtpRequestModel body,
  );

  @POST(BaseApis.authSubmitOtp)
  Future<BaseSuccessResponse<AuthSessionResponse>> submitOtp(
    @Body() AuthSubmitOtpRequestModel body,
  );

  @POST(BaseApis.authRefreshToken)
  Future<BaseSuccessResponse<AuthRefreshTokenResponse>> refreshToken(
    @Body() AuthRefreshTokenRequestModel body,
  );

  @POST(BaseApis.authGoogleSignIn)
  Future<BaseSuccessResponse<AuthSessionResponse>> googleSignIn(
    @Body() AuthGoogleSignInRequestModel body,
  );

  @POST(BaseApis.authDeleteAccount)
  Future<BaseSuccessResponse<BooleanOnlyRemoteResponse>> deleteAccount();

  @POST(BaseApis.authLogout)
  Future<BaseSuccessResponse<BooleanOnlyRemoteResponse>> logout();

  @POST(BaseApis.accountAuthLogin)
  Future<BaseSuccessResponse<AccountAuthSessionResponse>> login(
    @Body() AuthLoginRequestModel body, {
    @Header('Idempotency-Key') String? idempotencyKey,
  });

  @POST(BaseApis.accountAuthRegister)
  Future<BaseSuccessResponse<AccountAuthSessionResponse>> register(
    @Body() AuthRegisterRequestModel body, {
    @Header('Idempotency-Key') String? idempotencyKey,
  });

  @POST(BaseApis.accountAuthForgotPassword)
  Future<BaseSuccessResponse<BooleanOnlyRemoteResponse>> forgotPassword(
    @Body() AuthForgotPasswordRequestModel body, {
    @Header('Idempotency-Key') String? idempotencyKey,
  });

  @GET(BaseApis.accountProfile)
  Future<BaseSuccessResponse<AuthProfileResponse>> getProfile();

  @PATCH(BaseApis.accountProfile)
  Future<BaseSuccessResponse<AuthUpdateProfileResponse>> updateProfile(
    @Body() AuthUpdateProfileRequestModel body, {
    @Header('Idempotency-Key') String? idempotencyKey,
  });
}
