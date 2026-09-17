import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/achievement/achievement_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Fetches all unlocked achievement badges for the current user
/// (`GET /v1/me/achievements`).
class GetAchievementsUseCase {
  const GetAchievementsUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<List<AchievementEntity>>> call() async {
    return await _repository.fetchAchievements();
  }
}
