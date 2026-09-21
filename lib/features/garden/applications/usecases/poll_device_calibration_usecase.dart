import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/device/calibration_entities.dart';
import '../repository/garden_repository.dart';

/// Polls calibration job status, meant to be called every 5s while running
/// (`GET /v1/garden/devices/:id/calibration`).
class PollDeviceCalibrationUseCase {
  const PollDeviceCalibrationUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<CalibrationStatusEntity>> call(String deviceId) async {
    return await _repository.pollDeviceCalibration(deviceId);
  }
}
