import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_entities.dart';
import '../repository/garden_repository.dart';

/// Creates a container (`POST /v1/garden/containers`).
///
/// [capacity] is optional — the backend defaults to `1` when omitted.
/// Supported values: 1/3/5.
class CreateContainerUseCase {
  const CreateContainerUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<ContainerEntity>> call({int? capacity}) async {
    return await _repository.createContainer(capacity: capacity);
  }
}
