import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/error/mission_failure.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_history_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';

@lazySingleton
class GetMissionHistoryUseCase {
  final ExperienceRepository _repository;

  GetMissionHistoryUseCase(this._repository);

  Future<ResultEntity<List<MissionHistoryEntity>>> call() async {
    return await _repository.fetchMissionHistory();
  }
}
