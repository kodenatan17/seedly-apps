import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_detail_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

/// Fetches one mission instance with per-objective progress (spec §14).
class GetMissionDetailUseCase {
  const GetMissionDetailUseCase(this._repository);

  final ExperienceRepository _repository;

  Future<ResultEntity<MissionDetailEntity>> call(String id) async {
    return await _repository.fetchMissionDetail(id);
    
  }
}
