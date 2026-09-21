import 'package:json_annotation/json_annotation.dart';

part 'create_container_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateContainerRequestModel {
  const CreateContainerRequestModel({this.capacity});

  /// Optional — the backend defaults to `1` when omitted. Supported values:
  /// 1/3/5.
  final int? capacity;

  factory CreateContainerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateContainerRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateContainerRequestModelToJson(this);
}
