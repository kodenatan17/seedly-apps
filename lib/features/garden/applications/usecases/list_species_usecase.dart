import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/species/species_entities.dart';
import '../repository/garden_repository.dart';

/// Lists the species catalogue (`GET /v1/garden/species`).
class ListSpeciesUseCase {
  const ListSpeciesUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<List<SpeciesEntity>>> call() async {
    return await _repository.listSpecies();
  }
}
