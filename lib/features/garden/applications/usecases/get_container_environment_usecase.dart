import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_environment_entities.dart';
import '../repository/garden_repository.dart';

/// Fetches a container's latest environment snapshot and recommendation
/// (`GET /v1/garden/containers/:id/environment`).
class GetContainerEnvironmentUseCase {
  const GetContainerEnvironmentUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<ContainerEnvironmentEntity>> call(
    String containerId,
  ) async {
    return await _repository.getContainerEnvironment(containerId);
  }
}
