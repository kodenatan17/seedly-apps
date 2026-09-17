import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:seedly_app/cores/env/env.dart';
import 'package:seedly_app/cores/services/interceptors/authorization_interceptor.dart';
import 'package:seedly_app/cores/services/interceptors/refresh_token_interceptor.dart';

/// Auth's own Dio instance, mirroring `ExperienceRetApiDio`.
///
/// Carries the same [AuthorizationInterceptors] + [RefreshTokenInterceptor]
/// pair as every other feature's client, since a call through this client
/// (e.g. a future authenticated auth endpoint) can 401 too. The refresh-token
/// endpoint itself is exempt from the refresh loop by
/// [RefreshTokenInterceptor]'s own `_isRefreshTokenEndpoint` guard.
class AuthApiDio extends DioForNative {
  AuthApiDio() {
    _configureOptions();
    _configureInterceptors();
  }

  void _configureOptions() {
    options.baseUrl = BaseEnvirontment().baseUrl;
    options.connectTimeout = const Duration(
      seconds: BaseEnvirontment.connectionTimeout,
    );
    options.receiveTimeout = const Duration(
      seconds: BaseEnvirontment.receiveTimeout,
    );
    options.responseType = ResponseType.json;
  }

  void _configureInterceptors() {
    interceptors.add(AuthorizationInterceptors());
    interceptors.add(RefreshTokenInterceptor(this));
    interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }
}
