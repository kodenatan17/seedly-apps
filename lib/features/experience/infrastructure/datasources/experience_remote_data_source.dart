import 'package:injectable/injectable.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/achievement/achievement_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_detail_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_history_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_instance_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/question/question_answer_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/question/question_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/quest/quest_history_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/quest/quest_response.dart';
import 'package:seedly_app/features/experience/infrastructure/services/remote/experience_remote_service.dart';
import 'package:uuid/uuid.dart';

import '../../../../cores/error/api_exception.dart';
import '../models/request/question/question_answer_request_model.dart';
import '../models/request/quest/quest_submit_request_model.dart';

abstract class ExperienceRemoteDataSource {
  Future<List<MissionInstanceResponse>> fetchMissions();

  Future<MissionDetailResponse> fetchMissionDetail(String id);

  Future<List<MissionHistoryResponse>> fetchMissionHistory();

  Future<List<AchievementResponse>> fetchAchievements();

  Future<List<QuestResponse>> fetchPlantQuests(String plantId);

  Future<QuestSubmitResponse> submitQuest(
    String plantId,
    String questId,
    Map<String, dynamic> payload,
  );

  Future<List<QuestHistoryResponse>> fetchQuestHistory(String plantId);

  Future<List<QuestionResponse>> fetchPlantQuestions(String plantId);

  Future<QuestionAnswerResponse> submitQuestionAnswer(
    String plantId,
    String questionId,
    String answer,
  );
}

/// Bound when no authenticated HTTP client is configured yet.
///
/// Fails loudly with a typed failure instead of returning empty data, so the
/// UI can show a retry state rather than a misleading "no missions".
@LazySingleton(as: ExperienceRemoteDataSource)
class ExperienceRemoteDataSourceImpl implements ExperienceRemoteDataSource {
  final ExperienceRemoteService _experienceRemoteService;
  const ExperienceRemoteDataSourceImpl(this._experienceRemoteService);

  @override
  Future<List<MissionInstanceResponse>> fetchMissions() async {
    final response = await _experienceRemoteService.fetchMissionList();
    return response.data;
  }

  @override
  Future<MissionDetailResponse> fetchMissionDetail(String id) async {
    final response = await _experienceRemoteService.fetchMissionDetail(id);
    return response.data;
  }

  @override
  Future<List<MissionHistoryResponse>> fetchMissionHistory() async {
    final response = await _experienceRemoteService.fetchMissionHistory();
    return response.data;
  }

  @override
  Future<List<AchievementResponse>> fetchAchievements() async {
    final response = await _experienceRemoteService.fetchAchievements();
    return response.data;
  }

  @override
  Future<List<QuestResponse>> fetchPlantQuests(String plantId) async {
    final response = await _experienceRemoteService.fetchPlantQuests(plantId);
    return response.data;
  }

  @override
  Future<QuestSubmitResponse> submitQuest(
    String plantId,
    String questId,
    Map<String, dynamic> payload,
  ) async {
    final response = await _experienceRemoteService.submitQuest(
      plantId,
      questId,
      QuestSubmitRequestModel(payload: payload),
      const Uuid().v4(),
    );
    return response.data;
  }

  @override
  Future<List<QuestHistoryResponse>> fetchQuestHistory(String plantId) async {
    final response = await _experienceRemoteService.fetchQuestHistory(plantId);
    return response.data;
  }

  @override
  Future<List<QuestionResponse>> fetchPlantQuestions(String plantId) async {
    final response = await _experienceRemoteService.fetchPlantQuestions(
      plantId,
    );
    return response.data;
  }

  @override
  Future<QuestionAnswerResponse> submitQuestionAnswer(
    String plantId,
    String questionId,
    String answer,
  ) async {
    final response = await _experienceRemoteService.submitQuestionAnswer(
      plantId,
      questionId,
      QuestionAnswerRequestModel(answer: answer),
      const Uuid().v4(),
    );
    return response.data;
  }
}
