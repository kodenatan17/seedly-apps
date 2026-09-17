import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

class FirebasePerformanceInterceptor extends InterceptorsWrapper {
  final String domainPath;
  final String traceName;
  FirebasePerformanceInterceptor({
    required this.domainPath,
    this.traceName = 'api_trace',
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.baseUrl.contains(domainPath)) {
      // Create a trace with a custom trace name, combining traceName and request path
      final trace = FirebasePerformance.instance
          .newTrace('${traceName}_${options.baseUrl}');
      await trace.start();
      options.extra['firebaseTrace'] = trace;
    }
    handler.next(options);
    // continue to the next interceptor
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final trace = response.requestOptions.extra['firebaseTrace'] as Trace?;
    if (trace != null) {
      await trace.stop();
    }
    handler.next(response);
    // continue to the next interceptor
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Stop the trace on error as well
    final trace = err.requestOptions.extra['firebaseTrace'] as Trace?;
    if (trace != null) {
      await trace.stop();
    }
    handler.next(err);
  }
}