/// Mission feature module — public surface.
///
/// This is the **only** file other features and the app shell may import from
/// `features/experience/`. Data sources, DTO mappers, repository implementations,
/// and internal widgets stay private to the module (MFE-ready boundary, per
/// app architecture decisions).
///
/// Exposed:
///  - route entry points (screens)
///  - route definitions (`missionRoutes`) for the app composition root to
///    fold into the single global `GoRouter` — Mission never builds its own
///    router
///  - public state/entities needed by host UI
///  - the DI composition root
///
/// Deliberately NOT exposed: `MissionRemoteDataSource`, `MissionDtoMapper`,
/// `MissionRepositoryImpl`, internal widgets, use-case internals.
library;

// --- route entry points ---------------------------------------------------
export 'presentation/pages/mission_list_screen.dart' show MissionListScreen;
export 'presentation/pages/mission_detail_screen.dart' show MissionDetailScreen;
export 'presentation/pages/mission_history_screen.dart'
    show MissionHistoryScreen;

// --- module composition ---------------------------------------------------
export 'di/experience_module.dart' show ExperienceModule, MissionUseCases;

// --- route definitions (composed into the global router by the app) ------
export 'presentation/routes/mission_routes.dart'
    show missionRoutes, MissionRoutePaths;

// --- public contracts (host UI reads these) -------------------------------
export 'applications/entities/mission/mission_instance_entities.dart'
    show MissionInstance, XpGrant;
export 'presentation/bloc/mission_bloc.dart' show MissionBloc;
export 'presentation/bloc/mission_event.dart'
    show MissionRequested, MissionRefreshed, MissionDetailRequested, MissionReset;
export 'presentation/bloc/mission_state.dart'
    show
        MissionState,
        MissionLoading,
        MissionLoaded,
        MissionDetailLoaded,
        MissionError;
export 'presentation/bloc/mission_history_bloc.dart' show MissionHistoryBloc;
export 'presentation/bloc/mission_history_event.dart'
    show
        MissionHistoryRequested,
        MissionHistoryLoadMore,
        MissionHistoryRefreshed;
export 'presentation/bloc/mission_history_state.dart'
    show
        MissionHistoryState,
        MissionHistoryLoading,
        MissionHistoryLoaded,
        MissionHistoryError;

// --- shared error contract ------------------------------------------------
export '../../cores/error/mission_failure.dart'
    show MissionFailure, MissionFailureType;
