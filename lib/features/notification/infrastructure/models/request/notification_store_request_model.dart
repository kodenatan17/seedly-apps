import 'package:json_annotation/json_annotation.dart';

part 'notification_store_request_model.g.dart';

@JsonSerializable()
class NotificationStoreRequestModel {
  final String token;

  NotificationStoreRequestModel({required this.token});

  factory NotificationStoreRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationStoreRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationStoreRequestModelToJson(this);

  @override
  String toString() => toJson().toString();
}
