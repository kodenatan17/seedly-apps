import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_performance_dio/firebase_performance_dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:seedly_app/cores/env/env.dart';
import 'package:seedly_app/cores/services/interceptors/authorization_interceptor.dart';
import 'package:seedly_app/cores/services/interceptors/firebase_performance_interceptor.dart';
import 'package:seedly_app/cores/services/interceptors/refresh_token_interceptor.dart';
import 'package:seedly_app/features/notification/infrastructure/services/remote/notification_remote_service.dart';

@singleton
class NotificationRetApiDio extends DioForNative {
  NotificationRetApiDio() {
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
    // interceptors.add(CustomCheckerInterceptor());
    // if (!kReleaseMode) {
    //   interceptors.add(
    //     PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseBody: true,
    //       responseHeader: false,
    //     ),
    //   );
    //   interceptors.add(CustomCheckerInterceptor());
    // }
    interceptors.add(DioFirebasePerformanceInterceptor());
    interceptors.add(
      FirebasePerformanceInterceptor(domainPath: options.baseUrl),
    );
  }
}

@module
abstract class NotificationRetrofitInjectableModule {
  NotificationRemoteService getNotificationRemoteService(
    NotificationRetApiDio client,
  ) => NotificationRemoteService(client);
}
