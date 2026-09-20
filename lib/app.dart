import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'atomic/atomic.dart';
import 'cores/router/app_router.dart';
import 'features/auth/public_api.dart';
import 'features/experience/public_api.dart';
import 'l10n/l10n.dart';

/// App composition root.
///
/// This is the one place allowed to import multiple features' `public_api.dart`
/// at once — it folds each feature's routes into the single global
/// [GoRouter] that Core owns (`cores/router/app_router.dart`). Individual
/// features only ever see Core, never each other.
class SeedlyApp extends StatelessWidget {
  SeedlyApp({super.key});

  final GoRouter _router = buildAppRouter(
    initialLocation: MissionRoutePaths.list,
    routes: [...authRoutes(), ...missionRoutes(), ...achievementRoutes()],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seedly',
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}
