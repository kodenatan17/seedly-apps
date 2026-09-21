import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/device/device_entities.dart';
import '../repository/garden_repository.dart';

/// Looks up device claim status by serial
/// (`GET /v1/garden/devices/status/:serial`).
class CheckDeviceStatusUseCase {
  const CheckDeviceStatusUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<DeviceStatusEntity>> call(String serial) async {
    return await _repository.checkDeviceStatus(serial);
  }
}
