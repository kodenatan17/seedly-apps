import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_entities.dart';
import '../repository/garden_repository.dart';

/// Fetches full container detail, including paired device and plants
/// (`GET /v1/garden/containers/:id`).
class GetContainerDetailUseCase {
  const GetContainerDetailUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<ContainerDetailEntity>> call(String containerId) async {
    return await _repository.getContainerDetail(containerId);
  }
}
