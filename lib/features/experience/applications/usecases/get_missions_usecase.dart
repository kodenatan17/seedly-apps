import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_instance_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Fetches all missions visible to the current user (spec §14).
class GetMissionsUseCase {
  const GetMissionsUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<List<MissionInstanceEntity>>> call() async {
    return await _repository.fetchMissions();
  }
}
