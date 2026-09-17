import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_history_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Fetches completed quest history for one plant
/// (`GET /v1/plants/:id/quests/progress`).
class GetQuestHistoryUseCase {
  const GetQuestHistoryUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<List<QuestHistoryEntity>>> call(String plantId) async {
    return await _repository.fetchQuestHistory(plantId);
  }
}
