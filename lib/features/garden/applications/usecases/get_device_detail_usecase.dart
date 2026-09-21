import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/device/device_entities.dart';
import '../repository/garden_repository.dart';

/// Fetches device lifecycle & runtime status (`GET /v1/garden/devices/:id`).
class GetDeviceDetailUseCase {
  const GetDeviceDetailUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<DeviceEntity>> call(String deviceId) async {
    return await _repository.getDeviceDetail(deviceId);
  }
}
