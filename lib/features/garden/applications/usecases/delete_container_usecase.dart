import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../repository/garden_repository.dart';

/// Deletes a container (`DELETE /v1/garden/containers/:id`).
///
/// Delete policy for containers still holding plants/a device is explicitly
/// marked "pending" in the spec — the backend may reject with a `409`/`422`
/// that surfaces through [ResultError].
class DeleteContainerUseCase {
  const DeleteContainerUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<bool>> call(String containerId) async {
    return await _repository.deleteContainer(containerId);
  }
}
