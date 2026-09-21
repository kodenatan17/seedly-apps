import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/device/calibration_entities.dart';
import '../repository/garden_repository.dart';

/// Starts a sensor calibration run
/// (`POST /v1/garden/devices/:id/calibration/start`).
class StartDeviceCalibrationUseCase {
  const StartDeviceCalibrationUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<CalibrationJobEntity>> call(String deviceId) async {
    return await _repository.startDeviceCalibration(deviceId);
  }
}
