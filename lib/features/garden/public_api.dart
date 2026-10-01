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
/// Presentation: the "Add a Plant" flow (empty-garden hero, method picker,
/// QR scan, manual code entry, catalogue, container selection, success) is
/// implemented with `flutter_bloc`. The Garden Home dashboard
/// (`GET /v1/garden/home`) and device pairing/calibration screens are not
/// sliced yet — only entities/use cases exist for those.
library;

// --- route entry points -----------------------------------------------
export 'presentation/pages/garden_add_pot_screen.dart'
    show GardenAddPotScreen;
export 'presentation/pages/garden_add_pot_success_screen.dart'
    show GardenAddPotSuccessScreen;
export 'presentation/pages/garden_add_seed_success.dart'
    show GardenAddSeedSuccessScreen;
export 'presentation/pages/garden_pot_add_detail_screen.dart'
    show GardenPotAddDetailScreen;
export 'presentation/pages/garden_add_seeds_screen.dart'
    show GardenAddSeedsScreen;
export 'presentation/pages/garden_browse_catalogue_screen.dart'
    show GardenBrowseCatalogueScreen;
export 'presentation/pages/garden_choose_container_screen.dart'
    show GardenChooseContainerScreen;
export 'presentation/pages/garden_code_screen.dart' show GardenCodeScreen;
export 'presentation/pages/garden_qr_scanner_screen.dart'
    show GardenQrScannerScreen;
export 'presentation/pages/garden_screen.dart' show GardenScreen;

// --- route definitions (composed into the global router by the app) ------
export 'presentation/routes/garden_routes.dart'
    show gardenRoutes, GardenRoutePaths;

// --- presentation blocs -----------------------------------------------
export 'presentation/bloc/garden/garden_bloc.dart' show GardenBloc;
export 'presentation/bloc/garden/garden_event.dart'
    show GardenEvent, GardenRequested, GardenRefreshed;
export 'presentation/bloc/garden/garden_state.dart'
    show GardenState, GardenLoading, GardenEmpty, GardenLoaded, GardenError;
export 'presentation/bloc/plant_creation/plant_creation_bloc.dart'
    show PlantCreationBloc;
export 'presentation/bloc/plant_creation/plant_creation_event.dart'
    show
        PlantCreationEvent,
        PlantCreationContainersRequested,
        PlantCreationContainerSelected,
        PlantCreationSubmitted;
export 'presentation/bloc/plant_creation/plant_creation_state.dart'
    show PlantCreationState, PlantCreationStatus;
export 'presentation/bloc/seed_resolve/seed_resolve_bloc.dart'
    show SeedResolveBloc;
export 'presentation/bloc/seed_resolve/seed_resolve_event.dart'
    show SeedResolveEvent, SeedCodeResolveRequested, SeedResolveReset;
export 'presentation/bloc/seed_resolve/seed_resolve_state.dart'
    show
        SeedResolveState,
        SeedResolveInitial,
        SeedResolveLoading,
        SeedResolveSuccess,
        SeedResolveError;
export 'presentation/bloc/species_catalogue/species_catalogue_bloc.dart'
    show SpeciesCatalogueBloc;
export 'presentation/bloc/species_catalogue/species_catalogue_event.dart'
    show SpeciesCatalogueEvent, SpeciesCatalogueRequested;
export 'presentation/bloc/species_catalogue/species_catalogue_state.dart'
    show
        SpeciesCatalogueState,
        SpeciesCatalogueLoading,
        SpeciesCatalogueLoaded,
        SpeciesCatalogueError;

// --- presentation models ------------------------------------------------
export 'presentation/models/container_slot_ui_model.dart'
    show ContainerSlotUiModel;
export 'presentation/models/garden_seed_metadata.dart'
    show GardenSeedMetadata, GardenJourneyStage;
export 'presentation/models/garden_seed_selection.dart'
    show GardenSeedSelectionUiModel;

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
