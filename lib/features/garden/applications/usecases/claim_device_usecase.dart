import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/device/device_entities.dart';
import '../repository/garden_repository.dart';

/// Claims an IoT device via its QR-code serial
/// (`POST /v1/garden/devices/claim`).
class ClaimDeviceUseCase {
  const ClaimDeviceUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<DeviceClaimEntity>> call(String serialNumber) async {
    return await _repository.claimDevice(serialNumber);
  }
}
