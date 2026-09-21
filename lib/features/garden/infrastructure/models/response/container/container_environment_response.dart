import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/container/container_environment_entities.dart';

part 'container_environment_response.g.dart';

@JsonSerializable()
class EnvironmentReadingResponse
    implements ResponseMapper<EnvironmentReadingEntity> {
  const EnvironmentReadingResponse({
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

  factory EnvironmentReadingResponse.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentReadingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentReadingResponseToJson(this);

  @override
  EnvironmentReadingEntity toDomain() => EnvironmentReadingEntity(
    soilMoisturePct: soilMoisturePct,
    soilTemperatureC: soilTemperatureC,
    lightLux: lightLux,
    humidityPct: humidityPct,
    batteryPct: batteryPct,
  );
}

@JsonSerializable()
class EnvironmentMetricStatusResponse
    implements ResponseMapper<EnvironmentMetricStatusEntity> {
  const EnvironmentMetricStatusResponse({
    required this.label,
    required this.status,
  });

  final String label;
  final String status;

  factory EnvironmentMetricStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentMetricStatusResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EnvironmentMetricStatusResponseToJson(this);

  @override
  EnvironmentMetricStatusEntity toDomain() =>
      EnvironmentMetricStatusEntity(label: label, status: status);
}

@JsonSerializable()
class EnvironmentRecommendationResponse
    implements ResponseMapper<EnvironmentRecommendationEntity> {
  const EnvironmentRecommendationResponse({
    required this.action,
    required this.summary,
  });

  final String action;
  final String summary;

  factory EnvironmentRecommendationResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$EnvironmentRecommendationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EnvironmentRecommendationResponseToJson(this);

  @override
  EnvironmentRecommendationEntity toDomain() =>
      EnvironmentRecommendationEntity(action: action, summary: summary);
}

@JsonSerializable()
class ContainerEnvironmentResponse
    implements ResponseMapper<ContainerEnvironmentEntity> {
  const ContainerEnvironmentResponse({
    required this.containerId,
    required this.evaluatedAt,
    required this.environment,
    required this.interpretation,
    required this.recommendation,
  });

  final String containerId;
  final DateTime evaluatedAt;
  final EnvironmentReadingResponse environment;
  final Map<String, EnvironmentMetricStatusResponse> interpretation;
  final EnvironmentRecommendationResponse recommendation;

  factory ContainerEnvironmentResponse.fromJson(Map<String, dynamic> json) =>
      _$ContainerEnvironmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerEnvironmentResponseToJson(this);

  @override
  ContainerEnvironmentEntity toDomain() => ContainerEnvironmentEntity(
    containerId: containerId,
    evaluatedAt: evaluatedAt,
    environment: environment.toDomain(),
    interpretation: interpretation.map(
      (key, value) => MapEntry(key, value.toDomain()),
    ),
    recommendation: recommendation.toDomain(),
  );
}
