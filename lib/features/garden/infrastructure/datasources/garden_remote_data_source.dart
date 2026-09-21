import 'package:injectable/injectable.dart';

import '../models/request/container/create_container_request_model.dart';
import '../models/request/container/update_container_capacity_request_model.dart';
import '../models/request/device/claim_device_request_model.dart';
import '../models/request/plant/create_plant_request_model.dart';
import '../models/request/seed/resolve_seed_request_model.dart';
import '../models/response/container/container_detail_response.dart';
import '../models/response/container/container_environment_response.dart';
import '../models/response/container/container_plants_status_response.dart';
import '../models/response/container/container_response.dart';
import '../models/response/device/calibration_job_response.dart';
import '../models/response/device/calibration_status_response.dart';
import '../models/response/device/device_claim_response.dart';
import '../models/response/device/device_response.dart';
import '../models/response/device/device_status_response.dart';
import '../models/response/garden_home/garden_home_response.dart';
import '../models/response/plant/plant_create_response.dart';
import '../models/response/plant/plant_response.dart';
import '../models/response/seed/seed_resolve_response.dart';
import '../models/response/species/species_response.dart';
import '../services/remote/garden_remote_service.dart';

abstract class GardenRemoteDataSource {
  // --- Device provisioning, pairing & calibration ---------------------------

  Future<DeviceClaimResponse> claimDevice(String serialNumber);

  Future<DeviceStatusResponse> checkDeviceStatus(String serial);

  Future<DeviceResponse> getDeviceDetail(String deviceId);

  Future<CalibrationJobResponse> startDeviceCalibration(String deviceId);

  Future<CalibrationStatusResponse> pollDeviceCalibration(String deviceId);

  // --- Containers & garden ---------------------------------------------------

  Future<List<ContainerResponse>> listContainers();

  Future<ContainerResponse> createContainer({int? capacity});

  Future<ContainerDetailResponse> getContainerDetail(String containerId);

  Future<ContainerResponse> updateContainerCapacity(
    String containerId,
    int capacity,
  );

  Future<void> deleteContainer(String containerId);

  Future<ContainerEnvironmentResponse> getContainerEnvironment(
    String containerId,
  );

  Future<ContainerPlantsStatusResponse> getContainerPlantsStatus(
    String containerId,
  );

  Future<GardenHomeResponse> getGardenHome();

  // --- Seeds & plants ----------------------------------------------------

  Future<List<SpeciesResponse>> listSpecies();

  Future<SeedResolveResponse> resolveSeedCode(String code);

  Future<PlantCreateResponse> createPlant({
    required String name,
    required String containerId,
    String? kitCode,
    String? speciesId,
  });

  Future<PlantResponse> getPlantDetail(String plantId);

  Future<void> deletePlant(String plantId);
}

@LazySingleton(as: GardenRemoteDataSource)
class GardenRemoteDataSourceImpl implements GardenRemoteDataSource {
  const GardenRemoteDataSourceImpl(this._gardenRemoteService);

  final GardenRemoteService _gardenRemoteService;

  @override
  Future<DeviceClaimResponse> claimDevice(String serialNumber) async {
    final response = await _gardenRemoteService.claimDevice(
      ClaimDeviceRequestModel(serialNumber: serialNumber),
    );
    return response.data;
  }

  @override
  Future<DeviceStatusResponse> checkDeviceStatus(String serial) async {
    final response = await _gardenRemoteService.checkDeviceStatus(serial);
    return response.data;
  }

  @override
  Future<DeviceResponse> getDeviceDetail(String deviceId) async {
    final response = await _gardenRemoteService.getDeviceDetail(deviceId);
    return response.data;
  }

  @override
  Future<CalibrationJobResponse> startDeviceCalibration(String deviceId) async {
    final response = await _gardenRemoteService.startDeviceCalibration(
      deviceId,
    );
    return response.data;
  }

  @override
  Future<CalibrationStatusResponse> pollDeviceCalibration(
    String deviceId,
  ) async {
    final response = await _gardenRemoteService.pollDeviceCalibration(deviceId);
    return response.data;
  }

  @override
  Future<List<ContainerResponse>> listContainers() async {
    final response = await _gardenRemoteService.listContainers();
    return response.data.items;
  }

  @override
  Future<ContainerResponse> createContainer({int? capacity}) async {
    final response = await _gardenRemoteService.createContainer(
      CreateContainerRequestModel(capacity: capacity),
    );
    return response.data;
  }

  @override
  Future<ContainerDetailResponse> getContainerDetail(String containerId) async {
    final response = await _gardenRemoteService.getContainerDetail(containerId);
    return response.data;
  }

  @override
  Future<ContainerResponse> updateContainerCapacity(
    String containerId,
    int capacity,
  ) async {
    final response = await _gardenRemoteService.updateContainerCapacity(
      containerId,
      UpdateContainerCapacityRequestModel(capacity: capacity),
    );
    return response.data;
  }

  @override
  Future<void> deleteContainer(String containerId) async {
    await _gardenRemoteService.deleteContainer(containerId);
  }

  @override
  Future<ContainerEnvironmentResponse> getContainerEnvironment(
    String containerId,
  ) async {
    final response = await _gardenRemoteService.getContainerEnvironment(
      containerId,
    );
    return response.data;
  }

  @override
  Future<ContainerPlantsStatusResponse> getContainerPlantsStatus(
    String containerId,
  ) async {
    final response = await _gardenRemoteService.getContainerPlantsStatus(
      containerId,
    );
    return response.data;
  }

  @override
  Future<GardenHomeResponse> getGardenHome() async {
    final response = await _gardenRemoteService.getGardenHome();
    return response.data;
  }

  @override
  Future<List<SpeciesResponse>> listSpecies() async {
    final response = await _gardenRemoteService.listSpecies();
    return response.data.items;
  }

  @override
  Future<SeedResolveResponse> resolveSeedCode(String code) async {
    final response = await _gardenRemoteService.resolveSeedCode(
      ResolveSeedRequestModel(code: code),
    );
    return response.data;
  }

  @override
  Future<PlantCreateResponse> createPlant({
    required String name,
    required String containerId,
    String? kitCode,
    String? speciesId,
  }) async {
    assert(
      (kitCode == null) != (speciesId == null),
      'createPlant requires exactly one of kitCode/speciesId',
    );
    final response = await _gardenRemoteService.createPlant(
      CreatePlantRequestModel(
        name: name,
        containerId: containerId,
        kitCode: kitCode,
        speciesId: speciesId,
      ),
    );
    return response.data;
  }

  @override
  Future<PlantResponse> getPlantDetail(String plantId) async {
    final response = await _gardenRemoteService.getPlantDetail(plantId);
    return response.data;
  }

  @override
  Future<void> deletePlant(String plantId) async {
    await _gardenRemoteService.deletePlant(plantId);
  }
}
