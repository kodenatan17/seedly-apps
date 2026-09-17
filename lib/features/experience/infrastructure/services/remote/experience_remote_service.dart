import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/constant/base_apis.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_detail_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_history_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_instance_response.dart';
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
  Future<BaseSuccessResponse<List<MissionHistoryResponse>>> fetchMissionHistory();
}
