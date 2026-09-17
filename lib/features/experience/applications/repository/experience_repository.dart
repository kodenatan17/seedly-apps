import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/achievement/achievement_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_detail_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_history_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_instance_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/question/question_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/quest/quest_history_entities.dart';

abstract class ExperienceRepository {
  Future<ResultEntity<List<MissionInstanceEntity>>> fetchMissions();

  Future<ResultEntity<MissionDetailEntity>> fetchMissionDetail(
    String missionId,
  );

  Future<ResultEntity<List<MissionHistoryEntity>>> fetchMissionHistory();

  Future<ResultEntity<List<AchievementEntity>>> fetchAchievements();

  Future<ResultEntity<List<QuestEntity>>> fetchPlantQuests(String plantId);

  Future<ResultEntity<QuestSubmitResultEntity>> submitQuest(
    String plantId,
    String questId,
    Map<String, dynamic> payload,
  );

  Future<ResultEntity<List<QuestHistoryEntity>>> fetchQuestHistory(
    String plantId,
  );

  Future<ResultEntity<List<QuestionEntity>>> fetchPlantQuestions(
    String plantId,
  );

  Future<ResultEntity<QuestionAnswerResultEntity>> submitQuestionAnswer(
    String plantId,
    String questionId,
    String answer,
  );
}
