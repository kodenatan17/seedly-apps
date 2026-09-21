import 'package:equatable/equatable.dart';

/// Raw environment reading shared by the environment snapshot and the
/// multi-plant status endpoints (contract §2.3.6/3.7). `lightLux` and
/// `humidityPct` are reserved fields — still `null` in the MVP because those
/// sensors are not installed yet, not fictitious data.
class EnvironmentReadingEntity extends Equatable {
  const EnvironmentReadingEntity({
    this.soilMoisturePct,
    this.soilTemperatureC,
    this.lightLux,
    this.humidityPct,
    this.batteryPct,
  });

  final double? soilMoisturePct;
  final double? soilTemperatureC;
  final double? lightLux;
  final double? humidityPct;
  final int? batteryPct;

  @override
  List<Object?> get props => [
    soilMoisturePct,
    soilTemperatureC,
    lightLux,
    humidityPct,
    batteryPct,
  ];
}

/// One metric's interpreted status, e.g. `interpretation.soilMoisture`.
class EnvironmentMetricStatusEntity extends Equatable {
  const EnvironmentMetricStatusEntity({
    required this.label,
    required this.status,
  });

  /// Human-readable, e.g. `"a little dry"`.
  final String label;

  /// One of `GOOD|WARNING|CRITICAL` (server-defined).
  final String status;

  @override
  List<Object?> get props => [label, status];
}

/// Suggested action derived from the environment reading.
class EnvironmentRecommendationEntity extends Equatable {
  const EnvironmentRecommendationEntity({
    required this.action,
    required this.summary,
  });

  /// e.g. `WATER_GARDEN`.
  final String action;
  final String summary;

  @override
  List<Object?> get props => [action, summary];
}

/// Container environment snapshot
/// (`GET /v1/garden/containers/:id/environment`, contract §2.3.6).
class ContainerEnvironmentEntity extends Equatable {
  const ContainerEnvironmentEntity({
    required this.containerId,
    required this.evaluatedAt,
    required this.environment,
    required this.interpretation,
    required this.recommendation,
  });

  final String containerId;
  final DateTime evaluatedAt;
  final EnvironmentReadingEntity environment;

  /// Keyed by metric name (`soilMoisture`, `soilTemperature`, …).
  final Map<String, EnvironmentMetricStatusEntity> interpretation;
  final EnvironmentRecommendationEntity recommendation;

  @override
  List<Object?> get props => [
    containerId,
    evaluatedAt,
    environment,
    interpretation,
    recommendation,
  ];
}
