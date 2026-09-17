/// Notification feature module — public surface.
///
/// This is the **only** file other features and the app shell (including
/// `main.dart`, before `runApp()`) may import from `features/notification/`,
/// mirroring `features/auth/public_api.dart` and
/// `features/experience/public_api.dart`.
///
/// Deliberately NOT exposed: `NotificationRepository`/`NotificationRepositoryImpl`,
/// `NotificationRemoteService`, `NotificationRetApiDio` — infra internals stay
/// private to the module.
library;

// --- module composition ---------------------------------------------------
export 'di/notification_module.dart' show NotificationModule;

// --- app bootstrap (main.dart wires this before runApp()) -----------------
export 'presentation/notification_handle_background.dart'
    show NotificationHandleBackground;

// --- public contracts (host UI reads these) -------------------------------
export 'applications/entities/notification_content_entity.dart'
    show NotificationContentEntity;
export 'applications/usecases/notification_store_token_params.dart'
    show NotificationStoreTokenParams;
export 'applications/usecases/notification_store_token_usecase.dart'
    show NotificationStoreTokenUseCase;
export 'presentation/cubit/notification_cubit.dart'
    show
        NotificationCubit,
        NotificationState,
        NotificationInitial,
        NotificationReceived,
        NotificationBackgroundOpened,
        NotificationForegroundOpened,
        NotificationDisplay,
        NotificationError,
        NotificationTerminatedOpened,
        NotificationTokenChanges;
