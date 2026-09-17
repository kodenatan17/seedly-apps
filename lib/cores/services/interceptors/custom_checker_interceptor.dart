import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:seedly_app/cores/dependency/injection.dart';

class CustomCheckerInterceptor extends ChuckerDioInterceptor {
  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    final localNotificationPlugin = getIt<FlutterLocalNotificationsPlugin>();

    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      "Chucker Channel",
      "Chucker Channel",
      channelDescription: "Chucker Channel",
      icon: "@mipmap/launcher_icon",
      importance: Importance.low,
      fullScreenIntent: false,
      visibility: NotificationVisibility.secret,
      priority: Priority.low,
      playSound: false,
      enableVibration: false,
      autoCancel: false,
    ), iOS: DarwinNotificationDetails(
    presentSound: false,
    presentBadge: false,
    presentAlert: true,
  ),);

    await localNotificationPlugin.show(1, "Chucker Flutter",
        "Tap notification to expand network request", notificationDetails,
        payload: "chucker_flutter");
    super.onResponse(response, handler);
  }
}
