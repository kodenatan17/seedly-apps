import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:seedly_app/cores/env/env.dart';
import 'package:seedly_app/features/notification/applications/entities/notification_content_entity.dart';

class NotificationHandleBackground {
  // Initialize flutter local notifications untuk handle lock screen
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  /// Handle notification saat app di background atau terminated
  /// Akan menampilkan high priority notification yang bisa trigger saat lock screen
  @pragma('vm:entry-point')
  static void handleNotif(RemoteMessage message) async {
    await BaseEnvirontment().initFirebaseEnv();

    // Parse notification data
    final content = NotificationContentEntity.fromRemote(message);

    // Initialize local notifications jika belum
    await _initializeLocalNotifications();

    // Show notification with high priority untuk lock screen
    await _showCallNotification(message, content);
  }

  /// Initialize local notifications dengan Android dan iOS settings
  static Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  /// Callback saat notification di tap
  /// Payload akan berisi data untuk navigate ke CallScreen
  static void _onNotificationTapped(NotificationResponse response) async {
    if (response.payload != null) {
      // Data akan di handle oleh app saat dibuka
      // Navigation akan dilakukan via NotificationCubit
    }
  }

  /// Show high priority notification untuk incoming call
  /// Notification ini akan muncul bahkan saat lock screen
  static Future<void> _showCallNotification(
    RemoteMessage message,
    NotificationContentEntity content,
  ) async {
    const androidDetails = AndroidNotificationDetails(
      'call_channel', // Channel ID
      'Incoming Calls', // Channel Name
      channelDescription: 'Notifications for incoming calls',
      importance: Importance.max,
      priority: Priority.high,
      category: AndroidNotificationCategory.call,
      visibility: NotificationVisibility.public, // Show on lock screen
      playSound: true,
      enableVibration: true,
      ongoing: true, // Make it persistent
      autoCancel: false,
      // Use default system sound
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.critical, // Critical for lock screen
      // Use default system sound
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Create notification payload with call data
    final payload = content.toJson();

    await _localNotifications.show(
      0,
      message.notification?.title ?? 'Incoming Notification',
      message.notification?.body ?? 'You have an incoming notification',
      details,
      payload: payload,
    );
  }
}
