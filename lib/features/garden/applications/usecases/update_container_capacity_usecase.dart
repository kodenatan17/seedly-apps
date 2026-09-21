import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_entities.dart';
import '../repository/garden_repository.dart';

/// Updates a container's capacity (`PATCH /v1/garden/containers/:id`).
class UpdateContainerCapacityUseCase {
  const UpdateContainerCapacityUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<ContainerEntity>> call(
    String containerId,
    int capacity,
  ) async {
    return await _repository.updateContainerCapacity(containerId, capacity);
  }
}
