/// Auth feature module — public surface.
///
/// This is the **only** file other features and the app shell may import
/// from `features/auth/`, mirroring `features/experience/public_api.dart`.
/// Data sources, DTO mappers, and repository implementations stay private to
/// the module.
library;

// --- route entry points ---------------------------------------------------
export 'presentation/pages/account_detail_screen.dart' show AccountDetailScreen;
export 'presentation/pages/forgot_password_screen.dart'
    show ForgotPasswordScreen;
export 'presentation/pages/help_support_screen.dart' show HelpSupportScreen;
export 'presentation/pages/login_screen.dart' show LoginScreen;
export 'presentation/pages/notification_settings_screen.dart'
    show NotificationSettingsScreen;
export 'presentation/pages/onboarding_screen.dart' show OnboardingScreen;
export 'presentation/pages/otp_screen.dart' show OtpScreen;
export 'presentation/pages/profile_screen.dart' show ProfileScreen;
export 'presentation/pages/register_screen.dart' show RegisterScreen;
export 'presentation/pages/subscription_screen.dart' show SubscriptionScreen;

// --- module composition ---------------------------------------------------
export 'di/auth_module.dart' show AuthModule;

// --- route definitions (composed into the global router by the app) ------
export 'presentation/routes/auth_routes.dart' show authRoutes, AuthRoutePaths;

// --- public contracts (host UI reads these) -------------------------------
export 'applications/entities/auth_profile_entities.dart'
    show
        ProfileEntity,
        ProfilePlantEntity,
        ProfileSeedEntity,
        UpdateProfileResultEntity;
export 'applications/entities/auth_session_entities.dart'
    show AuthSessionEntity;
export 'applications/usecases/forgot_password_usecase.dart'
    show ForgotPasswordUseCase;
export 'applications/usecases/get_profile_usecase.dart'
    show GetProfileUseCase;
export 'applications/usecases/login_usecase.dart'
    show LoginUseCase, LoginParams;
export 'applications/usecases/register_usecase.dart'
    show RegisterUseCase, RegisterParams;
export 'applications/usecases/update_profile_usecase.dart'
    show UpdateProfileUseCase;
export 'presentation/bloc/auth_bloc.dart' show AuthBloc;
export 'presentation/bloc/auth_event.dart'
    show AuthEvent, GoogleSignInRequested;
export 'presentation/bloc/auth_state.dart'
    show AuthState, AuthInitial, AuthLoading, AuthSuccess, AuthFailure;
