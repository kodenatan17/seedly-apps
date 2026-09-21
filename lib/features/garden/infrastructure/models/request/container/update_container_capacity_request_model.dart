import 'package:json_annotation/json_annotation.dart';

part 'update_container_capacity_request_model.g.dart';

@JsonSerializable()
class UpdateContainerCapacityRequestModel {
  const UpdateContainerCapacityRequestModel({required this.capacity});

  final int capacity;

  factory UpdateContainerCapacityRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdateContainerCapacityRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateContainerCapacityRequestModelToJson(this);
}
