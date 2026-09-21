/// Garden feature module — public surface.
///
/// This is the **only** file other features and the app shell may import
/// from `features/garden/`. Data sources, DTO mappers, repository
/// implementations, and infrastructure internals stay private to the module
/// (MFE-ready boundary, per app architecture decisions).
///
/// Scope: api_contracts_backend.md §2 (Garden) — device provisioning &
/// pairing, calibration polling, containers, environment/compatibility,
/// Garden Home dashboard, species catalogue, seed/kit resolution, and plants.
/// Endpoints authenticated with a device token / `X-Signature` (device
/// handshake, calibration-sample ingestion, telemetry ingestion) are ESP32
/// firmware surfaces, not called by this app, and are intentionally not
/// modelled here.
///
/// **No presentation layer yet** — this module currently exposes entities,
/// use cases and the DI composition root only. No pages, blocs, or routes.
library;

// --- module composition ---------------------------------------------------
export 'di/garden_module.dart' show GardenModule, GardenUseCases;

// --- public entities (host code reads these) ------------------------------
export 'applications/entities/container/container_entities.dart'
    show
        ContainerEntity,
        ContainerDeviceSummaryEntity,
        ContainerPlantSummaryEntity,
        ContainerDetailEntity;
export 'applications/entities/container/container_environment_entities.dart'
    show
        EnvironmentReadingEntity,
        EnvironmentMetricStatusEntity,
        EnvironmentRecommendationEntity,
        ContainerEnvironmentEntity;
export 'applications/entities/container/container_plants_status_entities.dart'
    show
        CompatibilityEntity,
        PlantConditionMetricEntity,
        PlantConditionSummaryEntity,
        ContainerPlantsStatusEntity;
export 'applications/entities/device/calibration_entities.dart'
    show
        CalibrationJobEntity,
        CalibrationMetricBaselineEntity,
        CalibrationStatusEntity;
export 'applications/entities/device/device_entities.dart'
    show DeviceClaimEntity, DeviceStatusEntity, DeviceEntity;
export 'applications/entities/garden_home/garden_home_entities.dart'
    show
        MyLevelEntity,
        MyPlantSummaryEntity,
        TodayQuestEntity,
        GardenRewardEntity,
        GardenHomeEntity;
export 'applications/entities/plant/plant_entities.dart'
    show PlantEntity, PlantCreateResultEntity;
export 'applications/entities/seed/seed_entities.dart'
    show SeedSpeciesRefEntity, SeedResolveEntity;
export 'applications/entities/species/species_entities.dart' show SpeciesEntity;

// --- use cases --------------------------------------------------------------
export 'applications/usecases/check_device_status_usecase.dart'
    show CheckDeviceStatusUseCase;
export 'applications/usecases/claim_device_usecase.dart'
    show ClaimDeviceUseCase;
export 'applications/usecases/create_container_usecase.dart'
    show CreateContainerUseCase;
export 'applications/usecases/create_plant_usecase.dart'
    show CreatePlantUseCase;
export 'applications/usecases/delete_container_usecase.dart'
    show DeleteContainerUseCase;
export 'applications/usecases/delete_plant_usecase.dart'
    show DeletePlantUseCase;
export 'applications/usecases/get_container_detail_usecase.dart'
    show GetContainerDetailUseCase;
export 'applications/usecases/get_container_environment_usecase.dart'
    show GetContainerEnvironmentUseCase;
export 'applications/usecases/get_container_plants_status_usecase.dart'
    show GetContainerPlantsStatusUseCase;
export 'applications/usecases/get_device_detail_usecase.dart'
    show GetDeviceDetailUseCase;
export 'applications/usecases/get_garden_home_usecase.dart'
    show GetGardenHomeUseCase;
export 'applications/usecases/get_plant_detail_usecase.dart'
    show GetPlantDetailUseCase;
export 'applications/usecases/list_containers_usecase.dart'
    show ListContainersUseCase;
export 'applications/usecases/list_species_usecase.dart'
    show ListSpeciesUseCase;
export 'applications/usecases/poll_device_calibration_usecase.dart'
    show PollDeviceCalibrationUseCase;
export 'applications/usecases/resolve_seed_code_usecase.dart'
    show ResolveSeedCodeUseCase;
export 'applications/usecases/start_device_calibration_usecase.dart'
    show StartDeviceCalibrationUseCase;
export 'applications/usecases/update_container_capacity_usecase.dart'
    show UpdateContainerCapacityUseCase;
