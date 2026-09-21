import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/device/calibration_entities.dart';

part 'calibration_status_response.g.dart';

@JsonSerializable()
class CalibrationMetricBaselineResponse
    implements ResponseMapper<CalibrationMetricBaselineEntity> {
  const CalibrationMetricBaselineResponse({
    required this.mean,
    required this.stdDev,
  });

  final double mean;
  final double stdDev;

  factory CalibrationMetricBaselineResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$CalibrationMetricBaselineResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CalibrationMetricBaselineResponseToJson(this);

  @override
  CalibrationMetricBaselineEntity toDomain() =>
      CalibrationMetricBaselineEntity(mean: mean, stdDev: stdDev);
}

@JsonSerializable()
class CalibrationStatusResponse
    implements ResponseMapper<CalibrationStatusEntity> {
  const CalibrationStatusResponse({
    required this.jobId,
    required this.deviceId,
    required this.status,
    required this.samplesCollected,
    required this.startedAt,
    this.completedAt,
    this.baseline,
  });

  final String jobId;
  final String deviceId;
  final String status;
  final int samplesCollected;
  final DateTime startedAt;
  final DateTime? completedAt;
  final Map<String, CalibrationMetricBaselineResponse>? baseline;

  factory CalibrationStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$CalibrationStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CalibrationStatusResponseToJson(this);

  @override
  CalibrationStatusEntity toDomain() => CalibrationStatusEntity(
    jobId: jobId,
    deviceId: deviceId,
    status: status,
    samplesCollected: samplesCollected,
    startedAt: startedAt,
    completedAt: completedAt,
    baseline: baseline?.map((key, value) => MapEntry(key, value.toDomain())),
  );
}
