import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';
import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';

import '../../applications/entities/container/container_entities.dart';
import '../../applications/entities/container/container_environment_entities.dart';
import '../../applications/entities/container/container_plants_status_entities.dart';
import '../../applications/entities/device/calibration_entities.dart';
import '../../applications/entities/device/device_entities.dart';
import '../../applications/entities/garden_home/garden_home_entities.dart';
import '../../applications/entities/plant/plant_entities.dart';
import '../../applications/entities/seed/seed_entities.dart';
import '../../applications/entities/species/species_entities.dart';
import '../../applications/repository/garden_repository.dart';
import '../datasources/garden_remote_data_source.dart';

@LazySingleton(as: GardenRepository)
class GardenRepositoryImpl implements GardenRepository {
  GardenRepositoryImpl(this._gardenRemoteDataSource, this._baseDioErrorHandler);

  final GardenRemoteDataSource _gardenRemoteDataSource;
  final BaseDioErrorHandler _baseDioErrorHandler;

  Future<ResultEntity<T>> _guard<T>(Future<T> Function() call) async {
    try {
      return ResultEntity.success(data: await call());
    } on DioException catch (error) {
      return _baseDioErrorHandler.handleDioError(error) ??
          ResultEntity.error(message: error.message);
    } catch (error) {
      return ResultEntity.error(message: error.toString());
    }
  }

  // --- Device provisioning, pairing & calibration ---------------------------

  @override
  Future<ResultEntity<DeviceClaimEntity>> claimDevice(String serialNumber) =>
      _guard(
        () async => (await _gardenRemoteDataSource.claimDevice(
          serialNumber,
        )).toDomain(),
      );

  @override
  Future<ResultEntity<DeviceStatusEntity>> checkDeviceStatus(String serial) =>
      _guard(
        () async => (await _gardenRemoteDataSource.checkDeviceStatus(
          serial,
        )).toDomain(),
      );

  @override
  Future<ResultEntity<DeviceEntity>> getDeviceDetail(String deviceId) => _guard(
    () async =>
        (await _gardenRemoteDataSource.getDeviceDetail(deviceId)).toDomain(),
  );

  @override
  Future<ResultEntity<CalibrationJobEntity>> startDeviceCalibration(
    String deviceId,
  ) => _guard(
    () async => (await _gardenRemoteDataSource.startDeviceCalibration(
      deviceId,
    )).toDomain(),
  );

  @override
  Future<ResultEntity<CalibrationStatusEntity>> pollDeviceCalibration(
    String deviceId,
  ) => _guard(
    () async => (await _gardenRemoteDataSource.pollDeviceCalibration(
      deviceId,
    )).toDomain(),
  );

  // --- Containers & garden ---------------------------------------------------

  @override
  Future<ResultEntity<List<ContainerEntity>>> listContainers() => _guard(
    () async => (await _gardenRemoteDataSource.listContainers())
        .map((e) => e.toDomain())
        .toList(),
  );

  @override
  Future<ResultEntity<ContainerEntity>> createContainer({int? capacity}) =>
      _guard(
        () async => (await _gardenRemoteDataSource.createContainer(
          capacity: capacity,
        )).toDomain(),
      );

  @override
  Future<ResultEntity<ContainerDetailEntity>> getContainerDetail(
    String containerId,
  ) => _guard(
    () async => (await _gardenRemoteDataSource.getContainerDetail(
      containerId,
    )).toDomain(),
  );

  @override
  Future<ResultEntity<ContainerEntity>> updateContainerCapacity(
    String containerId,
    int capacity,
  ) => _guard(
    () async => (await _gardenRemoteDataSource.updateContainerCapacity(
      containerId,
      capacity,
    )).toDomain(),
  );

  @override
  Future<ResultEntity<bool>> deleteContainer(String containerId) =>
      _guard(() async {
        await _gardenRemoteDataSource.deleteContainer(containerId);
        return true;
      });

  @override
  Future<ResultEntity<ContainerEnvironmentEntity>> getContainerEnvironment(
    String containerId,
  ) => _guard(
    () async => (await _gardenRemoteDataSource.getContainerEnvironment(
      containerId,
    )).toDomain(),
  );

  @override
  Future<ResultEntity<ContainerPlantsStatusEntity>> getContainerPlantsStatus(
    String containerId,
  ) => _guard(
    () async => (await _gardenRemoteDataSource.getContainerPlantsStatus(
      containerId,
    )).toDomain(),
  );

  @override
  Future<ResultEntity<GardenHomeEntity>> getGardenHome() => _guard(
    () async => (await _gardenRemoteDataSource.getGardenHome()).toDomain(),
  );

  // --- Seeds & plants ----------------------------------------------------

  @override
  Future<ResultEntity<List<SpeciesEntity>>> listSpecies() => _guard(
    () async => (await _gardenRemoteDataSource.listSpecies())
        .map((e) => e.toDomain())
        .toList(),
  );

  @override
  Future<ResultEntity<SeedResolveEntity>> resolveSeedCode(String code) =>
      _guard(
        () async =>
            (await _gardenRemoteDataSource.resolveSeedCode(code)).toDomain(),
      );

  @override
  Future<ResultEntity<PlantCreateResultEntity>> createPlant({
    required String name,
    required String containerId,
    String? kitCode,
    String? speciesId,
  }) => _guard(
    () async => (await _gardenRemoteDataSource.createPlant(
      name: name,
      containerId: containerId,
      kitCode: kitCode,
      speciesId: speciesId,
    )).toDomain(),
  );

  @override
  Future<ResultEntity<PlantEntity>> getPlantDetail(String plantId) => _guard(
    () async =>
        (await _gardenRemoteDataSource.getPlantDetail(plantId)).toDomain(),
  );

  @override
  Future<ResultEntity<bool>> deletePlant(String plantId) => _guard(() async {
    await _gardenRemoteDataSource.deletePlant(plantId);
    return true;
  });
}
