import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/question/question_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Fetches difficulty-adapted MCQ questions for one plant
/// (`GET /v1/plants/:id/questions`).
class GetPlantQuestionsUseCase {
  const GetPlantQuestionsUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<List<QuestionEntity>>> call(String plantId) async {
    return await _repository.fetchPlantQuestions(plantId);
  }
}
