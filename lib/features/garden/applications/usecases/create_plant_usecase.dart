import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/plant/plant_entities.dart';
import '../repository/garden_repository.dart';

/// Creates a plant in a container (`POST /v1/garden/plants`).
///
/// `kitCode` XOR `speciesId` — exactly one must be provided; the repository
/// forwards both through to the request body unchanged.
class CreatePlantUseCase {
  const CreatePlantUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<PlantCreateResultEntity>> call({
    required String name,
    required String containerId,
    String? kitCode,
    String? speciesId,
  }) async {
    return await _repository.createPlant(
      name: name,
      containerId: containerId,
      kitCode: kitCode,
      speciesId: speciesId,
    );
  }
}
