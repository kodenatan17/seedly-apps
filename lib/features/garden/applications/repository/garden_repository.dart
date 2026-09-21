import 'package:seedly_app/cores/domain/base_result_entity_helper.dart';

import '../entities/container/container_entities.dart';
import '../entities/container/container_environment_entities.dart';
import '../entities/container/container_plants_status_entities.dart';
import '../entities/device/calibration_entities.dart';
import '../entities/device/device_entities.dart';
import '../entities/garden_home/garden_home_entities.dart';
import '../entities/plant/plant_entities.dart';
import '../entities/seed/seed_entities.dart';
import '../entities/species/species_entities.dart';

/// Garden feature repository (api_contracts_backend.md §2).
///
/// App-facing surface only. Endpoints authenticated with a device token /
/// `X-Signature` (device provisioning handshake, calibration-sample
/// ingestion, telemetry ingestion) are called by the ESP32 firmware, not by
/// this app, and are intentionally not modelled here.
abstract class GardenRepository {
  // --- Device provisioning, pairing & calibration ---------------------------

  Future<ResultEntity<DeviceClaimEntity>> claimDevice(String serialNumber);

  Future<ResultEntity<DeviceStatusEntity>> checkDeviceStatus(String serial);

  Future<ResultEntity<DeviceEntity>> getDeviceDetail(String deviceId);

  Future<ResultEntity<CalibrationJobEntity>> startDeviceCalibration(
    String deviceId,
  );

  Future<ResultEntity<CalibrationStatusEntity>> pollDeviceCalibration(
    String deviceId,
  );

  // --- Containers & garden ---------------------------------------------------

  Future<ResultEntity<List<ContainerEntity>>> listContainers();

  Future<ResultEntity<ContainerEntity>> createContainer({int? capacity});

  Future<ResultEntity<ContainerDetailEntity>> getContainerDetail(
    String containerId,
  );

  Future<ResultEntity<ContainerEntity>> updateContainerCapacity(
    String containerId,
    int capacity,
  );

  Future<ResultEntity<bool>> deleteContainer(String containerId);

  Future<ResultEntity<ContainerEnvironmentEntity>> getContainerEnvironment(
    String containerId,
  );

  Future<ResultEntity<ContainerPlantsStatusEntity>> getContainerPlantsStatus(
    String containerId,
  );

  Future<ResultEntity<GardenHomeEntity>> getGardenHome();

  // --- Seeds & plants ----------------------------------------------------

  Future<ResultEntity<List<SpeciesEntity>>> listSpecies();

  Future<ResultEntity<SeedResolveEntity>> resolveSeedCode(String code);

  /// `kitCode` XOR `speciesId` — exactly one must be provided.
  Future<ResultEntity<PlantCreateResultEntity>> createPlant({
    required String name,
    required String containerId,
    String? kitCode,
    String? speciesId,
  });

  Future<ResultEntity<PlantEntity>> getPlantDetail(String plantId);

  Future<ResultEntity<bool>> deletePlant(String plantId);
}
