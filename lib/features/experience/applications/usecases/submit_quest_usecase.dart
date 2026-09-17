import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Submits a button-verified quest
/// (`POST /v1/plants/:id/quests/:questId/submit`).
///
/// Only for `verification: BUTTON` quests — `SENSOR`/`GROWTH_REPORT`/
/// `QUESTION`-verified quests complete automatically from their own source
/// event and never call this.
class SubmitQuestUseCase {
  const SubmitQuestUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<QuestSubmitResultEntity>> call({
    required String plantId,
    required String questId,
    Map<String, dynamic> payload = const {},
  }) async {
    return await _repository.submitQuest(plantId, questId, payload);
  }
}
