import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_plants_status_entities.dart';
import '../repository/garden_repository.dart';

/// Fetches multi-plant condition & compatibility for a container
/// (`GET /v1/garden/containers/:id/plants/status`).
class GetContainerPlantsStatusUseCase {
  const GetContainerPlantsStatusUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<ContainerPlantsStatusEntity>> call(
    String containerId,
  ) async {
    return await _repository.getContainerPlantsStatus(containerId);
  }
}
