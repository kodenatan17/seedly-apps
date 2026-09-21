import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/plant/plant_entities.dart';
import '../repository/garden_repository.dart';

/// Fetches full plant detail (`GET /v1/garden/plants/:id`).
class GetPlantDetailUseCase {
  const GetPlantDetailUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<PlantEntity>> call(String plantId) async {
    return await _repository.getPlantDetail(plantId);
  }
}
