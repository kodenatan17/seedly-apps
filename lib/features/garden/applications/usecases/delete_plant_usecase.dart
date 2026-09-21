import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../repository/garden_repository.dart';

/// Deletes a plant (`DELETE /v1/garden/plants/:id`).
class DeletePlantUseCase {
  const DeletePlantUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<bool>> call(String plantId) async {
    return await _repository.deletePlant(plantId);
  }
}
