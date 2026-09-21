import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/container/container_plants_status_entities.dart';
import 'container_environment_response.dart';

part 'container_plants_status_response.g.dart';

@JsonSerializable()
class CompatibilityResponse implements ResponseMapper<CompatibilityEntity> {
  const CompatibilityResponse({
    required this.status,
    required this.score,
    this.conflicts = const [],
  });

  final String status;
  final double score;
  final List<String> conflicts;

  factory CompatibilityResponse.fromJson(Map<String, dynamic> json) =>
      _$CompatibilityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompatibilityResponseToJson(this);

  @override
  CompatibilityEntity toDomain() =>
      CompatibilityEntity(status: status, score: score, conflicts: conflicts);
}

@JsonSerializable()
class PlantConditionMetricResponse
    implements ResponseMapper<PlantConditionMetricEntity> {
  const PlantConditionMetricResponse({
    required this.status,
    required this.label,
    this.deviationPct,
  });

  final String status;
  final String label;
  final double? deviationPct;

  factory PlantConditionMetricResponse.fromJson(Map<String, dynamic> json) =>
      _$PlantConditionMetricResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlantConditionMetricResponseToJson(this);

  @override
  PlantConditionMetricEntity toDomain() => PlantConditionMetricEntity(
    status: status,
    label: label,
    deviationPct: deviationPct,
  );
}

@JsonSerializable()
class PlantConditionSummaryResponse
    implements ResponseMapper<PlantConditionSummaryEntity> {
  const PlantConditionSummaryResponse({
    required this.plantId,
    required this.name,
    required this.stage,
    required this.soilMoisture,
    required this.soilTemperature,
    required this.overall,
    this.sensitivityNote,
  });

  final String plantId;
  final String name;
  final String stage;
  final PlantConditionMetricResponse soilMoisture;
  final PlantConditionMetricResponse soilTemperature;
  final PlantConditionMetricResponse overall;
  final String? sensitivityNote;

  factory PlantConditionSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PlantConditionSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlantConditionSummaryResponseToJson(this);

  @override
  PlantConditionSummaryEntity toDomain() => PlantConditionSummaryEntity(
    plantId: plantId,
    name: name,
    stage: stage,
    soilMoisture: soilMoisture.toDomain(),
    soilTemperature: soilTemperature.toDomain(),
    overall: overall.toDomain(),
    sensitivityNote: sensitivityNote,
  );
}

@JsonSerializable()
class ContainerPlantsStatusResponse
    implements ResponseMapper<ContainerPlantsStatusEntity> {
  const ContainerPlantsStatusResponse({
    required this.containerId,
    required this.evaluatedAt,
    required this.environment,
    required this.compatibility,
    this.plants = const [],
  });

  final String containerId;
  final DateTime evaluatedAt;
  final EnvironmentReadingResponse environment;
  final CompatibilityResponse compatibility;
  final List<PlantConditionSummaryResponse> plants;

  factory ContainerPlantsStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerPlantsStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerPlantsStatusResponseToJson(this);

  @override
  ContainerPlantsStatusEntity toDomain() => ContainerPlantsStatusEntity(
    containerId: containerId,
    evaluatedAt: evaluatedAt,
    environment: environment.toDomain(),
    compatibility: compatibility.toDomain(),
    plants: plants.map((e) => e.toDomain()).toList(),
  );
}
