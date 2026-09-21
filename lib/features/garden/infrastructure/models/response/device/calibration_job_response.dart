import 'package:json_annotation/json_annotation.dart';
import 'package:seedly_app/cores/data/remote/response/remote_response_mapper.dart';

import '../../../../applications/entities/device/calibration_entities.dart';

part 'calibration_job_response.g.dart';

@JsonSerializable()
class CalibrationJobResponse implements ResponseMapper<CalibrationJobEntity> {
  const CalibrationJobResponse({
    required this.jobId,
    required this.deviceId,
    required this.status,
    required this.startedAt,
    required this.expiresAt,
    required this.expectedSamples,
  });

  final String jobId;
  final String deviceId;
  final String status;
  final DateTime startedAt;
  final DateTime expiresAt;
  final int expectedSamples;

  factory CalibrationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CalibrationJobResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CalibrationJobResponseToJson(this);

  @override
  CalibrationJobEntity toDomain() => CalibrationJobEntity(
    jobId: jobId,
    deviceId: deviceId,
    status: status,
    startedAt: startedAt,
    expiresAt: expiresAt,
    expectedSamples: expectedSamples,
  );
}
