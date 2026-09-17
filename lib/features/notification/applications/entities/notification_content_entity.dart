import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// NOTE: previously annotated with @HiveType/@HiveField for local caching,
// but hive_generator's source_gen constraint conflicts with
// retrofit_generator (already required app-wide), so it can't be code-
// generated in this project. Nothing opens a Hive box for this yet either
// (no Hive.init/registerAdapter anywhere), so the annotations were dead.
// Re-add via a hand-written TypeAdapter if local caching is actually needed.
class NotificationContentEntity extends Equatable {
  final String? notificationId;
  final String? title;
  final String? subtitle;
  final String? navigationRoute;

  const NotificationContentEntity(
    this.notificationId,
    this.title,
    this.subtitle,
    this.navigationRoute,
  );

  factory NotificationContentEntity.fromRemote(RemoteMessage message) {
    final data = message.data;

    return NotificationContentEntity(
      data['notificationId'],
      data['title'],
      data['subtitle'],
      data['navigationRoute'],
    );
  }

  factory NotificationContentEntity.fromMap(Map<String, dynamic> data) =>
      NotificationContentEntity(
        data['notificationId'],
        data['title'],
        data['subtitle'],
        data['navigationRoute'],
      );

  factory NotificationContentEntity.fromLocal(NotificationResponse message) {
    final payload = message.payload;
    if (payload == null) {
      return const NotificationContentEntity(null, null, null, null);
    }
    return NotificationContentEntity.fromJson(payload);
  }

  factory NotificationContentEntity.fromJson(String data) {
    return NotificationContentEntity.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toMap() => {
    'notificationId': notificationId,
    'title': title,
    'subtitle': subtitle,
    'navigationRoute': navigationRoute,
  };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [notificationId, title, subtitle, navigationRoute];
}
