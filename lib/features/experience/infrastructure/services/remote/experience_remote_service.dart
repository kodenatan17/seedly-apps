import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/constant/base_apis.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/request/question/question_answer_request_model.dart';
import 'package:seedly_app/features/experience/infrastructure/models/request/quest/quest_submit_request_model.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/achievement/achievement_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_detail_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_history_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_instance_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/question/question_answer_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/question/question_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/quest/quest_history_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/quest/quest_response.dart';
import 'package:seedly_app/features/experience/infrastructure/services/dio/experience_ret_network_client.dart';

part 'experience_remote_service.g.dart';

@RestApi()
abstract class ExperienceRemoteService {
  @factoryMethod
  factory ExperienceRemoteService(ExperienceRetApiDio dio, {String baseUrl}) =
      _ExperienceRemoteService;

  @GET(BaseApis.experienceMissionList)
  Future<BaseSuccessResponse<List<MissionInstanceResponse>>> fetchMissionList();

  @GET(BaseApis.experienceMissionDetail)
  Future<BaseSuccessResponse<MissionDetailResponse>> fetchMissionDetail(
    @Path('id') String id,
  );

  @GET(BaseApis.experienceMissionHistory)
  Future<BaseSuccessResponse<List<MissionHistoryResponse>>>
  fetchMissionHistory();

  @GET(BaseApis.experienceAchievements)
  Future<BaseSuccessResponse<List<AchievementResponse>>> fetchAchievements();

  @GET(BaseApis.experiencePlantQuests)
  Future<BaseSuccessResponse<List<QuestResponse>>> fetchPlantQuests(
    @Path('id') String plantId,
  );

  @POST(BaseApis.experienceQuestSubmit)
  Future<BaseSuccessResponse<QuestSubmitResponse>> submitQuest(
    @Path('id') String plantId,
    @Path('questId') String questId,
    @Body() QuestSubmitRequestModel body,
    @Header('Idempotency-Key') String idempotencyKey,
  );

  @GET(BaseApis.experienceQuestHistory)
  Future<BaseSuccessResponse<List<QuestHistoryResponse>>> fetchQuestHistory(
    @Path('id') String plantId,
  );

  @GET(BaseApis.experiencePlantQuestions)
  Future<BaseSuccessResponse<List<QuestionResponse>>> fetchPlantQuestions(
    @Path('id') String plantId,
  );

  @POST(BaseApis.experienceQuestionAnswer)
  Future<BaseSuccessResponse<QuestionAnswerResponse>> submitQuestionAnswer(
    @Path('id') String plantId,
    @Path('questionId') String questionId,
    @Body() QuestionAnswerRequestModel body,
    @Header('Idempotency-Key') String idempotencyKey,
  );
}
