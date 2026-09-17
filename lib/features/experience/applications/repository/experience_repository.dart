import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_detail_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_history_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_instance_entities.dart';

abstract class ExperienceRepository {
  Future<ResultEntity<List<MissionInstanceEntity>>> fetchMissions();   
  
  Future<ResultEntity<MissionDetailEntity>> fetchMissionDetail(String missionId);
  
  Future<ResultEntity<List<MissionHistoryEntity>>> fetchMissionHistory();
}
