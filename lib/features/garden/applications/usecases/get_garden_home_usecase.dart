import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/garden_home/garden_home_entities.dart';
import '../repository/garden_repository.dart';

/// Fetches the Garden Home dashboard aggregate (`GET /v1/garden/home`).
class GetGardenHomeUseCase {
  const GetGardenHomeUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<GardenHomeEntity>> call() async {
    return await _repository.getGardenHome();
  }
}
