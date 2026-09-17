/// Auth feature module — public surface.
///
/// This is the **only** file other features and the app shell may import
/// from `features/auth/`, mirroring `features/experience/public_api.dart`.
/// Data sources, DTO mappers, and repository implementations stay private to
/// the module.
library;

// --- route entry points ---------------------------------------------------
export 'presentation/pages/login_screen.dart' show LoginScreen;
export 'presentation/pages/onboarding_screen.dart' show OnboardingScreen;
export 'presentation/pages/otp_screen.dart' show OtpScreen;

// --- module composition ---------------------------------------------------
export 'di/auth_module.dart' show AuthModule;

// --- route definitions (composed into the global router by the app) ------
export 'presentation/routes/auth_routes.dart' show authRoutes, AuthRoutePaths;

// --- public contracts (host UI reads these) -------------------------------
export 'applications/entities/auth_session_entities.dart'
    show AuthSessionEntity;
export 'presentation/bloc/auth_bloc.dart' show AuthBloc;
export 'presentation/bloc/auth_event.dart'
    show AuthEvent, GoogleSignInRequested;
export 'presentation/bloc/auth_state.dart'
    show AuthState, AuthInitial, AuthLoading, AuthSuccess, AuthFailure;
