import 'package:equatable/equatable.dart';

/// Started calibration run (`POST /v1/garden/devices/:id/calibration/start`,
/// contract §2.1.5.1 — inferred, no literal JSON example in spec).
class CalibrationJobEntity extends Equatable {
  const CalibrationJobEntity({
    required this.jobId,
    required this.deviceId,
    required this.status,
    required this.startedAt,
    required this.expiresAt,
    required this.expectedSamples,
  });

  final String jobId;
  final String deviceId;

  /// One of `RUNNING|READY|EXPIRED`.
  final String status;
  final DateTime startedAt;
  final DateTime expiresAt;
  final int expectedSamples;

  @override
  List<Object?> get props => [
    jobId,
    deviceId,
    status,
    startedAt,
    expiresAt,
    expectedSamples,
  ];
}

/// Per-metric baseline computed from calibration samples, e.g. the
/// `"moisture"` entry of `baseline` in §2.1.5.3.
class CalibrationMetricBaselineEntity extends Equatable {
  const CalibrationMetricBaselineEntity({
    required this.mean,
    required this.stdDev,
  });

  final double mean;
  final double stdDev;

  @override
  List<Object?> get props => [mean, stdDev];
}

/// Polled calibration job status (`GET /v1/garden/devices/:id/calibration`,
/// contract §2.1.5.3 — inferred). [baseline] is only populated once
/// [status] is `READY`.
class CalibrationStatusEntity extends Equatable {
  const CalibrationStatusEntity({
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

  /// One of `RUNNING|READY|EXPIRED`.
  final String status;
  final int samplesCollected;
  final DateTime startedAt;
  final DateTime? completedAt;

  /// Keyed by metric name (e.g. `moisture`). Null/omitted while `RUNNING`
  /// or after `EXPIRED`.
  final Map<String, CalibrationMetricBaselineEntity>? baseline;

  @override
  List<Object?> get props => [
    jobId,
    deviceId,
    status,
    samplesCollected,
    startedAt,
    completedAt,
    baseline,
  ];
}
