import 'package:get_it/get_it.dart';

import 'package:seedly_app/cores/helpers/base_dio_error_helper.dart';
import '../applications/repository/garden_repository.dart';
import '../applications/usecases/check_device_status_usecase.dart';
import '../applications/usecases/claim_device_usecase.dart';
import '../applications/usecases/create_container_usecase.dart';
import '../applications/usecases/create_plant_usecase.dart';
import '../applications/usecases/delete_container_usecase.dart';
import '../applications/usecases/delete_plant_usecase.dart';
import '../applications/usecases/get_container_detail_usecase.dart';
import '../applications/usecases/get_container_environment_usecase.dart';
import '../applications/usecases/get_container_plants_status_usecase.dart';
import '../applications/usecases/get_device_detail_usecase.dart';
import '../applications/usecases/get_garden_home_usecase.dart';
import '../applications/usecases/get_plant_detail_usecase.dart';
import '../applications/usecases/list_containers_usecase.dart';
import '../applications/usecases/list_species_usecase.dart';
import '../applications/usecases/poll_device_calibration_usecase.dart';
import '../applications/usecases/resolve_seed_code_usecase.dart';
import '../applications/usecases/start_device_calibration_usecase.dart';
import '../applications/usecases/update_container_capacity_usecase.dart';
import '../infrastructure/datasources/garden_remote_data_source.dart';
import '../infrastructure/repositories/garden_repository_impl.dart';
import '../infrastructure/services/dio/garden_ret_network_client.dart';
import '../infrastructure/services/remote/garden_remote_service.dart';

/// Module composition root.
///
/// Provides [GardenModule.register] for wiring the feature's full dependency
/// graph (network client → remote service → data source → repository → use
/// cases) into the application-level DI container
/// (`cores/dependency/injection.dart`). Nothing inside the module reaches
/// outside its own folder except `cores/`.
///
/// No presentation layer yet — no blocs/cubits are registered here.
class GardenModule {
  const GardenModule._();

  static void register({required GetIt getIt}) {
    if (!getIt.isRegistered<GardenRetApiDio>()) {
      getIt.registerLazySingleton<GardenRetApiDio>(() => GardenRetApiDio());
    }
    if (!getIt.isRegistered<GardenRemoteService>()) {
      getIt.registerLazySingleton<GardenRemoteService>(
        () => GardenRemoteService(getIt<GardenRetApiDio>()),
      );
    }
    if (!getIt.isRegistered<GardenRemoteDataSource>()) {
      getIt.registerLazySingleton<GardenRemoteDataSource>(
        () => GardenRemoteDataSourceImpl(getIt<GardenRemoteService>()),
      );
    }
    if (!getIt.isRegistered<BaseDioErrorHandler>()) {
      getIt.registerLazySingleton<BaseDioErrorHandler>(
        () => BaseDioErrorHandler(),
      );
    }
    if (!getIt.isRegistered<GardenRepository>()) {
      getIt.registerLazySingleton<GardenRepository>(
        () => GardenRepositoryImpl(
          getIt<GardenRemoteDataSource>(),
          getIt<BaseDioErrorHandler>(),
        ),
      );
    }

    // --- Device provisioning, pairing & calibration -------------------------
    if (!getIt.isRegistered<ClaimDeviceUseCase>()) {
      getIt.registerLazySingleton(
        () => ClaimDeviceUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<CheckDeviceStatusUseCase>()) {
      getIt.registerLazySingleton(
        () => CheckDeviceStatusUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<GetDeviceDetailUseCase>()) {
      getIt.registerLazySingleton(
        () => GetDeviceDetailUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<StartDeviceCalibrationUseCase>()) {
      getIt.registerLazySingleton(
        () => StartDeviceCalibrationUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<PollDeviceCalibrationUseCase>()) {
      getIt.registerLazySingleton(
        () => PollDeviceCalibrationUseCase(getIt<GardenRepository>()),
      );
    }

    // --- Containers & garden -------------------------------------------------
    if (!getIt.isRegistered<ListContainersUseCase>()) {
      getIt.registerLazySingleton(
        () => ListContainersUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<CreateContainerUseCase>()) {
      getIt.registerLazySingleton(
        () => CreateContainerUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<GetContainerDetailUseCase>()) {
      getIt.registerLazySingleton(
        () => GetContainerDetailUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<UpdateContainerCapacityUseCase>()) {
      getIt.registerLazySingleton(
        () => UpdateContainerCapacityUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<DeleteContainerUseCase>()) {
      getIt.registerLazySingleton(
        () => DeleteContainerUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<GetContainerEnvironmentUseCase>()) {
      getIt.registerLazySingleton(
        () => GetContainerEnvironmentUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<GetContainerPlantsStatusUseCase>()) {
      getIt.registerLazySingleton(
        () => GetContainerPlantsStatusUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<GetGardenHomeUseCase>()) {
      getIt.registerLazySingleton(
        () => GetGardenHomeUseCase(getIt<GardenRepository>()),
      );
    }

    // --- Seeds & plants -------------------------------------------------
    if (!getIt.isRegistered<ListSpeciesUseCase>()) {
      getIt.registerLazySingleton(
        () => ListSpeciesUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<ResolveSeedCodeUseCase>()) {
      getIt.registerLazySingleton(
        () => ResolveSeedCodeUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<CreatePlantUseCase>()) {
      getIt.registerLazySingleton(
        () => CreatePlantUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<GetPlantDetailUseCase>()) {
      getIt.registerLazySingleton(
        () => GetPlantDetailUseCase(getIt<GardenRepository>()),
      );
    }
    if (!getIt.isRegistered<DeletePlantUseCase>()) {
      getIt.registerLazySingleton(
        () => DeletePlantUseCase(getIt<GardenRepository>()),
      );
    }
  }
}

/// Convenience bundle for host screens that need several Garden use cases at
/// once, mirroring `MissionUseCases` in the Experience module.
class GardenUseCases {
  const GardenUseCases({
    required this.claimDevice,
    required this.checkDeviceStatus,
    required this.getDeviceDetail,
    required this.startDeviceCalibration,
    required this.pollDeviceCalibration,
    required this.listContainers,
    required this.createContainer,
    required this.getContainerDetail,
    required this.updateContainerCapacity,
    required this.deleteContainer,
    required this.getContainerEnvironment,
    required this.getContainerPlantsStatus,
    required this.getGardenHome,
    required this.listSpecies,
    required this.resolveSeedCode,
    required this.createPlant,
    required this.getPlantDetail,
    required this.deletePlant,
  });

  factory GardenUseCases.fromGetIt(GetIt getIt) => GardenUseCases(
    claimDevice: getIt<ClaimDeviceUseCase>(),
    checkDeviceStatus: getIt<CheckDeviceStatusUseCase>(),
    getDeviceDetail: getIt<GetDeviceDetailUseCase>(),
    startDeviceCalibration: getIt<StartDeviceCalibrationUseCase>(),
    pollDeviceCalibration: getIt<PollDeviceCalibrationUseCase>(),
    listContainers: getIt<ListContainersUseCase>(),
    createContainer: getIt<CreateContainerUseCase>(),
    getContainerDetail: getIt<GetContainerDetailUseCase>(),
    updateContainerCapacity: getIt<UpdateContainerCapacityUseCase>(),
    deleteContainer: getIt<DeleteContainerUseCase>(),
    getContainerEnvironment: getIt<GetContainerEnvironmentUseCase>(),
    getContainerPlantsStatus: getIt<GetContainerPlantsStatusUseCase>(),
    getGardenHome: getIt<GetGardenHomeUseCase>(),
    listSpecies: getIt<ListSpeciesUseCase>(),
    resolveSeedCode: getIt<ResolveSeedCodeUseCase>(),
    createPlant: getIt<CreatePlantUseCase>(),
    getPlantDetail: getIt<GetPlantDetailUseCase>(),
    deletePlant: getIt<DeletePlantUseCase>(),
  );

  final ClaimDeviceUseCase claimDevice;
  final CheckDeviceStatusUseCase checkDeviceStatus;
  final GetDeviceDetailUseCase getDeviceDetail;
  final StartDeviceCalibrationUseCase startDeviceCalibration;
  final PollDeviceCalibrationUseCase pollDeviceCalibration;
  final ListContainersUseCase listContainers;
  final CreateContainerUseCase createContainer;
  final GetContainerDetailUseCase getContainerDetail;
  final UpdateContainerCapacityUseCase updateContainerCapacity;
  final DeleteContainerUseCase deleteContainer;
  final GetContainerEnvironmentUseCase getContainerEnvironment;
  final GetContainerPlantsStatusUseCase getContainerPlantsStatus;
  final GetGardenHomeUseCase getGardenHome;
  final ListSpeciesUseCase listSpecies;
  final ResolveSeedCodeUseCase resolveSeedCode;
  final CreatePlantUseCase createPlant;
  final GetPlantDetailUseCase getPlantDetail;
  final DeletePlantUseCase deletePlant;
}
