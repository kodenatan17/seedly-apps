import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seedly_app/cores/dependency/injection.dart';
import 'package:seedly_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:seedly_app/features/auth/presentation/pages/login_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/otp_screen.dart';

/// Route paths owned by the Auth feature.
///
/// The app composition root reads these when it needs to navigate into Auth
/// from outside the feature; nothing outside this file should hardcode an
/// `/auth/...` string.
abstract final class AuthRoutePaths {
  static const String login = '/auth/login';
  static const String otp = '/auth/otp';
  static const String onboarding = '/auth/onboarding';
}

/// Auth's route definitions.
///
/// Auth owns these routes but never constructs its own [GoRouter] — Core
/// owns the single global router (`cores/router/app_router.dart`); the app
/// composition root spreads [authRoutes] into that router's top-level
/// `routes` list, the same way it already does for `missionRoutes()`.
List<RouteBase> authRoutes() => [
  GoRoute(
    path: AuthRoutePaths.login,
    builder: (context, state) => BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>(),
      child: LoginScreen(
        onSignInSuccess: () => context.go(AuthRoutePaths.onboarding),
      ),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.otp,
    builder: (context, state) => const OtpScreen(),
  ),
  GoRoute(
    path: AuthRoutePaths.onboarding,
    builder: (context, state) => const OnboardingScreen(),
  ),
];
