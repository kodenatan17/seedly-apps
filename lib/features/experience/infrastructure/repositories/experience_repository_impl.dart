import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_detail_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_history_entities.dart';
import 'package:seedly_app/features/experience/applications/entities/mission/mission_instance_entities.dart';
import 'package:seedly_app/features/experience/applications/repository/experience_repository.dart';
import 'package:seedly_app/features/experience/infrastructure/datasources/experience_remote_data_source.dart';

@LazySingleton(as: ExperienceRepository)
class ExperienceRepositoryImpl implements ExperienceRepository {
  final ExperienceRemoteDataSource _experienceRemoteDataSource;
  final BaseDioErrorHandler _baseDioErrorHandler;

  ExperienceRepositoryImpl(
    this._experienceRemoteDataSource,
    this._baseDioErrorHandler,
  );

  @override
  Future<ResultEntity<List<MissionInstanceEntity>>> fetchMissions() async {
    try {
      final response = await _experienceRemoteDataSource.fetchMissions();
      return ResultEntity.success(
        data: response.map((e) => e.toDomain()).toList(),
      );
    } on DioException catch (error) {
      return _baseDioErrorHandler.handleDioError(error) ??
          ResultEntity.error(message: error.message);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }

  @override
  Future<ResultEntity<MissionDetailEntity>> fetchMissionDetail(
    String missionId,
  ) async {
    try {
      final response = await _experienceRemoteDataSource.fetchMissionDetail(
        missionId,
      );
      return ResultEntity.success(data: response.toDomain());
    } on DioException catch (error) {
      return _baseDioErrorHandler.handleDioError(error) ??
          ResultEntity.error(message: error.message);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }

  @override
  Future<ResultEntity<List<MissionHistoryEntity>>> fetchMissionHistory() async {
    try {
      final response = await _experienceRemoteDataSource.fetchMissionHistory();
      return ResultEntity.success(
        data: response.map((e) => e.toDomain()).toList(),
      );
    } on DioException catch (error) {
      return _baseDioErrorHandler.handleDioError(error) ??
          ResultEntity.error(message: error.message);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }
}
