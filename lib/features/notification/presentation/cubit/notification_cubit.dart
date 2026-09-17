import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/features/notification/applications/entities/notification_content_entity.dart';

part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final FirebaseMessaging _fcm;
  NotificationCubit(this._fcm) : super(NotificationInitial());

  StreamSubscription<RemoteMessage>? notificationActionListener;
  StreamSubscription<RemoteMessage>? notificationMessageListener;
  StreamSubscription<String>? notificationTokenChangesListener;

  void init() async {
    // Request permission FIRST
    await initPermissionNotification();

    // Disable system notification presentation
    _disableSystemNotificationPresentation();

    // Handle foreground messages
    initNotificationForeground();

    // Handle ketika user tap notif dari background
    initNotificationOpenInBackground();

    // Handle ketika app dibuka dari terminated state via notif
    initNotificationOpenInTerminated();

    // Handle token refresh
    initNotificationTokenRefresh();
  }

  /// Disable system notification agar tidak muncul banner
  /// Kita akan handle sendiri dengan displayCalling
  Future<void> _disableSystemNotificationPresentation() async {
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: false, // Disable alert/banner
      badge: false, // Disable badge
      sound: false, // Disable sound dari system
    );
  }

  Future<NotificationSettings> initPermissionNotification() async {
    // Request permission tetap diperlukan
    return _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
  }

  void initNotificationTokenRefresh() {
    notificationTokenChangesListener = _fcm.onTokenRefresh.listen((token) {
      emit(NotificationTokenChanges(token));
    });
  }

  void initNotificationOpenInBackground() {
    notificationActionListener = FirebaseMessaging.onMessageOpenedApp.listen((
      message,
    ) {
      final content = NotificationContentEntity.fromRemote(message);
      emit(NotificationBackgroundOpened(content));
    });
  }

  void initNotificationOpenInTerminated() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final content = NotificationContentEntity.fromRemote(message);
        emit(NotificationTerminatedOpened(content));
      }
    });
  }

  /// Handle foreground notification - langsung emit untuk trigger displayCalling
  Future<void> initNotificationForeground() async {
    notificationMessageListener = FirebaseMessaging.onMessage.listen((
      message,
    ) async {
      debugPrint('[FCM] ===== FOREGROUND MESSAGE RECEIVED =====');
      debugPrint('[FCM] Message ID: ${message.messageId}');
      debugPrint('[FCM] Data: ${message.data}');
      debugPrint(
        '[FCM] Notification: ${message.notification?.title} - ${message.notification?.body}',
      );

      final content = NotificationContentEntity.fromRemote(message);
      emit(NotificationReceived(content));
    });
  }

  void stopStream() {
    notificationMessageListener?.cancel();
    notificationActionListener?.cancel();
    notificationTokenChangesListener?.cancel();
  }
}
