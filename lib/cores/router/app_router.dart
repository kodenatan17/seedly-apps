import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Core owns the single global [GoRouter] shell.
///
/// Core never references a feature's routes directly — the app composition
/// root (`lib/app.dart`) collects each feature's `*Routes()` list (exposed
/// through that feature's `public_api.dart`) and passes the combined list in
/// here. Features must never construct their own [GoRouter].
GoRouter buildAppRouter({
  required List<RouteBase> routes,
  required String initialLocation,
}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: routes,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
}
