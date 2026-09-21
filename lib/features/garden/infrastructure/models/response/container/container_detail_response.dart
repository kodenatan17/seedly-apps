import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/container/container_entities.dart';

part 'container_detail_response.g.dart';

@JsonSerializable()
class ContainerDeviceSummaryResponse
    implements ResponseMapper<ContainerDeviceSummaryEntity> {
  const ContainerDeviceSummaryResponse({
    required this.id,
    required this.status,
    required this.firmwareVersion,
    required this.lastSeenAt,
  });

  final String id;
  final String status;
  final String firmwareVersion;
  final DateTime lastSeenAt;

  factory ContainerDeviceSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerDeviceSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDeviceSummaryResponseToJson(this);

  @override
  ContainerDeviceSummaryEntity toDomain() => ContainerDeviceSummaryEntity(
    id: id,
    status: status,
    firmwareVersion: firmwareVersion,
    lastSeenAt: lastSeenAt,
  );
}

@JsonSerializable()
class ContainerPlantSummaryResponse
    implements ResponseMapper<ContainerPlantSummaryEntity> {
  const ContainerPlantSummaryResponse({
    required this.id,
    required this.name,
    required this.speciesName,
    required this.stage,
    required this.healthScore,
    required this.plantedAt,
  });

  final String id;
  final String name;
  final String speciesName;
  final String stage;
  final int healthScore;
  final DateTime plantedAt;

  factory ContainerPlantSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerPlantSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPlantSummaryResponseToJson(this);

  @override
  ContainerPlantSummaryEntity toDomain() => ContainerPlantSummaryEntity(
    id: id,
    name: name,
    speciesName: speciesName,
    stage: stage,
    healthScore: healthScore,
    plantedAt: plantedAt,
  );
}

@JsonSerializable()
class ContainerDetailResponse implements ResponseMapper<ContainerDetailEntity> {
  const ContainerDetailResponse({
    required this.id,
    required this.capacity,
    required this.currentPlantCount,
    required this.createdAt,
    required this.updatedAt,
    this.device,
    this.plants = const [],
  });

  final String id;
  final int capacity;
  final int currentPlantCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ContainerDeviceSummaryResponse? device;
  final List<ContainerPlantSummaryResponse> plants;

  factory ContainerDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDetailResponseToJson(this);

  @override
  ContainerDetailEntity toDomain() => ContainerDetailEntity(
    id: id,
    capacity: capacity,
    currentPlantCount: currentPlantCount,
    createdAt: createdAt,
    updatedAt: updatedAt,
    device: device?.toDomain(),
    plants: plants.map((e) => e.toDomain()).toList(),
  );
}
