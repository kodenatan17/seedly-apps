import 'package:injectable/injectable.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_detail_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_history_response.dart';
import 'package:seedly_app/features/experience/infrastructure/models/response/mission/mission_instance_response.dart';
import 'package:seedly_app/features/experience/infrastructure/services/remote/experience_remote_service.dart';

import '../../../../cores/error/api_exception.dart';

abstract class ExperienceRemoteDataSource {
  Future<List<MissionInstanceResponse>> fetchMissions();

  Future<MissionDetailResponse> fetchMissionDetail(String id);

  Future<List<MissionHistoryResponse>> fetchMissionHistory();
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
}
