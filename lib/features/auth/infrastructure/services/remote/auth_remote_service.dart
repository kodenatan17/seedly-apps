import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seedly_app/cores/constant/base_apis.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/cores/data/remote/response/boolean_only_remote_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_google_sign_in_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_refresh_token_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_request_otp_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_submit_otp_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_refresh_token_response.dart';
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
}
