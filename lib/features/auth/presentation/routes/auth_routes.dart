import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:growpico_app/cores/dependency/injection.dart';
import 'package:growpico_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:growpico_app/features/auth/presentation/pages/account_detail_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/help_support_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/login_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/notification_settings_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/otp_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/profile_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/register_screen.dart';
import 'package:growpico_app/features/auth/presentation/pages/subscription_screen.dart';
import 'package:growpico_app/features/garden/public_api.dart' show GardenRoutePaths;

/// Route paths owned by the Auth feature.
///
/// The app composition root reads these when it needs to navigate into Auth
/// from outside the feature; nothing outside this file should hardcode an
/// `/auth/...` string.
abstract final class AuthRoutePaths {
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String otp = '/auth/otp';
  static const String onboarding = '/auth/onboarding';
  static const String accountDetail = '/auth/account-detail';
  static const String helpSupport = '/auth/help-support';
  static const String notificationSettings = '/auth/notification-settings';
  static const String profile = '/auth/profile';
  static const String subscription = '/auth/subscription';
}

/// Pops when possible, otherwise falls back to the login screen so previewing
/// any of these routes as `initialLocation` never asserts on an empty stack.
void _popOrLogin(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(AuthRoutePaths.login);
  }
}

void _handleNavTap(BuildContext context, int index) {
  switch (index) {
    case 0:
    case 1:
      context.go(GardenRoutePaths.root);
    case 3:
      context.go(AuthRoutePaths.profile);
    default:
      // TODO: wire Chat/Missions once those routes exist.
      break;
  }
}

void _handleOpenSettings(BuildContext context, String target) {
  switch (target) {
    case 'account':
      context.push(AuthRoutePaths.accountDetail);
    case 'notifications':
      context.push(AuthRoutePaths.notificationSettings);
    case 'help':
      context.push(AuthRoutePaths.helpSupport);
  }
}

/// Auth's route definitions.
///
/// Auth owns these routes but never constructs its own [GoRouter] — Core owns
/// the single global router (`cores/router/app_router.dart`); the app
/// composition root spreads [authRoutes] into that router's top-level
/// `routes` list, the same way it already does for `missionRoutes()`.
///
/// "Onboarding done" lands on the Garden home because that is the first
/// destination behind the auth wall; the cross-feature hop goes through
/// Garden's `public_api.dart` rather than a hardcoded path.
List<RouteBase> authRoutes() => [
  GoRoute(
    path: AuthRoutePaths.login,
    builder: (context, state) => BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>(),
      child: LoginScreen(
        onSignInSuccess: () => context.go(AuthRoutePaths.onboarding),
        onCreateAccount: () => context.push(AuthRoutePaths.register),
        onForgotPassword: () => context.push(AuthRoutePaths.forgotPassword),
      ),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.register,
    builder: (context, state) => RegisterScreen(
      // TODO: replace with the real registration call once that use case
      // lands; OTP verification stays the step after account creation.
      onCreateAccount: (email, password) =>
          context.go(AuthRoutePaths.otp, extra: email),
      onSignInWithGoogle: () => context.go(AuthRoutePaths.login),
      onLogIn: () => context.go(AuthRoutePaths.login),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.forgotPassword,
    builder: (context, state) => ForgotPasswordScreen(
      onBack: () => _popOrLogin(context),
      // TODO: call the forgot-password use case; the mail it sends is the
      // same "check your email" screen.
      onSendResetLink: (email) => context.go(AuthRoutePaths.otp, extra: email),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.otp,
    builder: (context, state) {
      final email = state.extra as String? ?? '';
      return OtpScreen(
        email: email,
        onBack: () => _popOrLogin(context),
        onChangeEmail: () => _popOrLogin(context),
        // TODO: wire resend and open-mail to their use cases / `url_launcher`;
        // the screen still runs its cooldown countdown meanwhile.
      );
    },
  ),
  GoRoute(
    path: AuthRoutePaths.onboarding,
    builder: (context, state) => OnboardingScreen(
      onGetStarted: () => context.go(GardenRoutePaths.root),
      onLogIn: () => context.go(AuthRoutePaths.login),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.accountDetail,
    builder: (context, state) => AccountDetailScreen(
      onBack: () => _popOrLogin(context),
      onNavTap: (i) => _handleNavTap(context, i),
      onAddPot: () => context.push(GardenRoutePaths.addSeeds),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.helpSupport,
    builder: (context, state) => HelpSupportScreen(
      onBack: () => _popOrLogin(context),
      onNavTap: (i) => _handleNavTap(context, i),
      // TODO: wire onChat to the support chat destination once it exists.
      // TODO: wire onViewAllFaq to the full FAQ list once it exists.
      // TODO: wire onGuideTap to the guide PDF viewer once it exists.
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.notificationSettings,
    builder: (context, state) => NotificationSettingsScreen(
      onBack: () => _popOrLogin(context),
      onNavTap: (i) => _handleNavTap(context, i),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.profile,
    builder: (context, state) => ProfileScreen(
      onNavTap: (i) => _handleNavTap(context, i),
      onOpenSettings: (t) => _handleOpenSettings(context, t),
      onUpgrade: () => context.push(AuthRoutePaths.subscription),
    ),
  ),
  GoRoute(
    path: AuthRoutePaths.subscription,
    builder: (context, state) => SubscriptionScreen(
      onBack: () => _popOrLogin(context),
      onNavTap: (i) => _handleNavTap(context, i),
      // TODO: wire onCheckPaymentStatus to the Midtrans status check usecase.
      // TODO: wire onSimulateSuccess / onSelectMethod to payment usecases.
    ),
  ),
];
