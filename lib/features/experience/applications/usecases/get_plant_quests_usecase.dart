import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Fetches active quests for one plant (`GET /v1/plants/:id/quests`).
class GetPlantQuestsUseCase {
  const GetPlantQuestsUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<List<QuestEntity>>> call(String plantId) async {
    return await _repository.fetchPlantQuests(plantId);
  }
}
