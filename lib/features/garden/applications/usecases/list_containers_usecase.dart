import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_entities.dart';
import '../repository/garden_repository.dart';

/// Lists the current user's containers (`GET /v1/garden/containers`).
class ListContainersUseCase {
  const ListContainersUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<List<ContainerEntity>>> call() async {
    return await _repository.listContainers();
  }
}
