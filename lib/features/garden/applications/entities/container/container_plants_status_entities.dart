import 'package:equatable/equatable.dart';

import 'container_environment_entities.dart';

/// Multi-plant compatibility summary, e.g. `compatibility`.
class CompatibilityEntity extends Equatable {
  const CompatibilityEntity({
    required this.status,
    required this.score,
    this.conflicts = const [],
  });

  /// One of `GOOD|WARNING|INCOMPATIBLE`.
  final String status;

  /// `0.0`–`1.0` (deterministic overlap-ratio formula).
  final double score;
  final List<String> conflicts;

  @override
  List<Object?> get props => [status, score, conflicts];
}

/// One plant's condition metric, e.g. `plants[].condition.soilMoisture`.
class PlantConditionMetricEntity extends Equatable {
  const PlantConditionMetricEntity({
    required this.status,
    required this.label,
    this.deviationPct,
  });

  /// One of `GOOD|WARNING|CRITICAL`.
  final String status;
  final String label;
  final double? deviationPct;

  @override
  List<Object?> get props => [status, label, deviationPct];
}

/// Per-plant condition entry inside the multi-plant status response.
class PlantConditionSummaryEntity extends Equatable {
  const PlantConditionSummaryEntity({
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

  /// e.g. `VEGETATIVE`.
  final String stage;
  final PlantConditionMetricEntity soilMoisture;
  final PlantConditionMetricEntity soilTemperature;
  final PlantConditionMetricEntity overall;

  /// e.g. `"Lettuce is more sensitive to dry soil"`.
  final String? sensitivityNote;

  @override
  List<Object?> get props => [
    plantId,
    name,
    stage,
    soilMoisture,
    soilTemperature,
    overall,
    sensitivityNote,
  ];
}

/// Multi-plant condition & compatibility
/// (`GET /v1/garden/containers/:id/plants/status`, contract §2.3.7).
class ContainerPlantsStatusEntity extends Equatable {
  const ContainerPlantsStatusEntity({
    required this.containerId,
    required this.evaluatedAt,
    required this.environment,
    required this.compatibility,
    this.plants = const [],
  });

  final String containerId;
  final DateTime evaluatedAt;
  final EnvironmentReadingEntity environment;
  final CompatibilityEntity compatibility;
  final List<PlantConditionSummaryEntity> plants;

  @override
  List<Object?> get props => [
    containerId,
    evaluatedAt,
    environment,
    compatibility,
    plants,
  ];
}
