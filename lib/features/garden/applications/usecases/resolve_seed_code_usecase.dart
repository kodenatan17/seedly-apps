import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/seed/seed_entities.dart';
import '../repository/garden_repository.dart';

/// Resolves a seed/kit code before planting (`POST /v1/garden/seeds/resolve`).
class ResolveSeedCodeUseCase {
  const ResolveSeedCodeUseCase(this._repository);

  final GardenRepository _repository;

  Future<ResultEntity<SeedResolveEntity>> call(String code) async {
    return await _repository.resolveSeedCode(code);
  }
}
