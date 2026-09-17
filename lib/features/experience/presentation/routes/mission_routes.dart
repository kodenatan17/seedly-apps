import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../cores/dependency/injection.dart';
import '../bloc/mission_bloc.dart';
import '../bloc/mission_history_bloc.dart';
import '../bloc/mission_history_event.dart';
import '../pages/mission_detail_screen.dart';
import '../pages/mission_history_screen.dart';
import '../pages/mission_list_screen.dart';

/// Route paths owned by the Mission feature.
///
/// The app composition root reads these when it needs to navigate into
/// Mission from outside the feature (e.g. a Garden Home "See all" button);
/// nothing outside this file should hardcode a `/missions...` string.
abstract final class MissionRoutePaths {
  static const String list = '/missions';
  static const String history = '/missions/history';
  static const String detail = '/missions/:missionId';

  static String detailPath(String missionId) => '/missions/$missionId';
}

/// Mission's route definitions.
///
/// Mission owns these routes but never constructs its own [GoRouter] — Core
/// owns the single global router (`cores/router/app_router.dart`); the app
/// composition root spreads [missionRoutes] into that router's top-level
/// `routes` list.
///
/// List and detail share one [MissionBloc] instance (mounted once per
/// [ShellRoute] visit) so a detail fetch and a return-to-list read the same
/// in-memory state, matching the existing bloc's transient detail-state
/// design. History gets its own [MissionHistoryBloc] since it is an
/// independent, cursor-paginated read.
///
/// Every bloc is resolved via `getIt` (registered by [MissionModule.register]
/// in `di/mission_module.dart`) — route builders never instantiate a
/// repository or use case directly.
List<RouteBase> missionRoutes() => [
      // Declared before the shell's `:missionId` route so the literal
      // `/missions/history` segment is matched before the param route.
      GoRoute(
        path: MissionRoutePaths.history,
        builder: (context, state) => BlocProvider<MissionHistoryBloc>(
          create: (_) => getIt<MissionHistoryBloc>()
            ..add(const MissionHistoryRequested()),
          child: const MissionHistoryScreen(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider<MissionBloc>(
          create: (_) => getIt<MissionBloc>(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: MissionRoutePaths.list,
            builder: (context, state) => MissionListScreen(
              onMissionSelected: (missionId) =>
                  context.push(MissionRoutePaths.detailPath(missionId)),
              onOpenHistory: () => context.push(MissionRoutePaths.history),
            ),
          ),
          GoRoute(
            path: MissionRoutePaths.detail,
            builder: (context, state) => MissionDetailScreen(
              missionId: state.pathParameters['missionId']!,
            ),
          ),
        ],
      ),
    ];
