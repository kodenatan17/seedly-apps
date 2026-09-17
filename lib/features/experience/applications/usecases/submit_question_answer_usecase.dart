import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/question/question_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Submits an MCQ answer
/// (`POST /v1/plants/:id/questions/:questionId/answer`).
///
/// Re-answering the same question is blocked server-side by a 24h cooldown
/// (`409 question_cooldown`), surfaced back through the usual `ResultEntity`
/// error path — no client-side cooldown check.
class SubmitQuestionAnswerUseCase {
  const SubmitQuestionAnswerUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<QuestionAnswerResultEntity>> call({
    required String plantId,
    required String questionId,
    required String answer,
  }) async {
    return await _repository.submitQuestionAnswer(plantId, questionId, answer);
  }
}
