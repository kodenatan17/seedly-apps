import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/container/container_entities.dart';

part 'container_response.g.dart';

/// Shared response shape for list/create/update — mirrors [ContainerEntity]:
/// `createdAt` only appears on the create response, `updatedAt` only on the
/// update response, and the list response omits both.
@JsonSerializable()
class ContainerResponse implements ResponseMapper<ContainerEntity> {
  const ContainerResponse({
    required this.id,
    required this.capacity,
    required this.currentPlantCount,
    this.deviceId,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final int capacity;
  final int currentPlantCount;
  final String? deviceId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerResponseToJson(this);

  @override
  ContainerEntity toDomain() => ContainerEntity(
    id: id,
    capacity: capacity,
    currentPlantCount: currentPlantCount,
    deviceId: deviceId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
