import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:seedly_app/cores/constant/base_apis.dart';
import 'package:seedly_app/cores/data/remote/response/base_success_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/request/container/create_container_request_model.dart';
import 'package:seedly_app/features/garden/infrastructure/models/request/container/update_container_capacity_request_model.dart';
import 'package:seedly_app/features/garden/infrastructure/models/request/device/claim_device_request_model.dart';
import 'package:seedly_app/features/garden/infrastructure/models/request/plant/create_plant_request_model.dart';
import 'package:seedly_app/features/garden/infrastructure/models/request/seed/resolve_seed_request_model.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/container/container_detail_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/container/container_environment_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/container/container_list_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/container/container_plants_status_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/container/container_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/device/calibration_job_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/device/calibration_status_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/device/device_claim_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/device/device_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/device/device_status_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/garden_home/garden_home_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/plant/plant_create_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/plant/plant_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/seed/seed_resolve_response.dart';
import 'package:seedly_app/features/garden/infrastructure/models/response/species/species_list_response.dart';
import 'package:seedly_app/features/garden/infrastructure/services/dio/garden_ret_network_client.dart';

part 'garden_remote_service.g.dart';

/// App-facing Garden endpoints only (api_contracts_backend.md §2). Endpoints
/// authenticated with a device token / `X-Signature` (device handshake,
/// calibration-sample ingestion, telemetry ingestion) are ESP32 firmware
/// surfaces and are intentionally not declared here.
@RestApi()
abstract class GardenRemoteService {
  @factoryMethod
  factory GardenRemoteService(GardenRetApiDio dio, {String baseUrl}) =
      _GardenRemoteService;

  // --- Device provisioning, pairing & calibration ---------------------------

  @POST(BaseApis.gardenDeviceClaim)
  Future<BaseSuccessResponse<DeviceClaimResponse>> claimDevice(
    @Body() ClaimDeviceRequestModel body,
  );

  @GET(BaseApis.gardenDeviceStatusBySerial)
  Future<BaseSuccessResponse<DeviceStatusResponse>> checkDeviceStatus(
    @Path('serial') String serial,
  );

  @GET(BaseApis.gardenDeviceDetail)
  Future<BaseSuccessResponse<DeviceResponse>> getDeviceDetail(
    @Path('id') String deviceId,
  );

  @POST(BaseApis.gardenDeviceCalibrationStart)
  Future<BaseSuccessResponse<CalibrationJobResponse>> startDeviceCalibration(
    @Path('id') String deviceId, {
    @Header('Idempotency-Key') String? idempotencyKey,
  });

  @GET(BaseApis.gardenDeviceCalibrationStatus)
  Future<BaseSuccessResponse<CalibrationStatusResponse>> pollDeviceCalibration(
    @Path('id') String deviceId,
  );

  // --- Containers & garden ---------------------------------------------------

  @GET(BaseApis.gardenContainers)
  Future<BaseSuccessResponse<ContainerListResponse>> listContainers();

  @POST(BaseApis.gardenContainers)
  Future<BaseSuccessResponse<ContainerResponse>> createContainer(
    @Body() CreateContainerRequestModel body,
  );

  @GET(BaseApis.gardenContainerDetail)
  Future<BaseSuccessResponse<ContainerDetailResponse>> getContainerDetail(
    @Path('id') String containerId,
  );

  @PATCH(BaseApis.gardenContainerDetail)
  Future<BaseSuccessResponse<ContainerResponse>> updateContainerCapacity(
    @Path('id') String containerId,
    @Body() UpdateContainerCapacityRequestModel body,
  );

  @DELETE(BaseApis.gardenContainerDetail)
  Future<void> deleteContainer(@Path('id') String containerId);

  @GET(BaseApis.gardenContainerEnvironment)
  Future<BaseSuccessResponse<ContainerEnvironmentResponse>>
  getContainerEnvironment(@Path('id') String containerId);

  @GET(BaseApis.gardenContainerPlantsStatus)
  Future<BaseSuccessResponse<ContainerPlantsStatusResponse>>
  getContainerPlantsStatus(@Path('id') String containerId);

  @GET(BaseApis.gardenHome)
  Future<BaseSuccessResponse<GardenHomeResponse>> getGardenHome();

  // --- Seeds & plants ----------------------------------------------------

  @GET(BaseApis.gardenSpecies)
  Future<BaseSuccessResponse<SpeciesListResponse>> listSpecies();

  @POST(BaseApis.gardenSeedsResolve)
  Future<BaseSuccessResponse<SeedResolveResponse>> resolveSeedCode(
    @Body() ResolveSeedRequestModel body,
  );

  @POST(BaseApis.gardenPlants)
  Future<BaseSuccessResponse<PlantCreateResponse>> createPlant(
    @Body() CreatePlantRequestModel body, {
    @Header('Idempotency-Key') String? idempotencyKey,
  });

  @GET(BaseApis.gardenPlantDetail)
  Future<BaseSuccessResponse<PlantResponse>> getPlantDetail(
    @Path('id') String plantId,
  );

  @DELETE(BaseApis.gardenPlantDetail)
  Future<void> deletePlant(@Path('id') String plantId);
}
