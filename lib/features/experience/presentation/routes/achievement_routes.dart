import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../pages/achievement_milestone_page.dart';
import '../pages/achievement_page.dart';
import '../pages/achievement_unlocked_page.dart';
import 'mission_routes.dart';

/// Route paths owned by the Achievement surface of the Experience feature.
///
/// Nothing outside this file should hardcode an `/achievements...` string.
abstract final class AchievementRoutePaths {
  static const String root = '/achievements';
  static const String milestones = '/achievements/milestones';
  static const String unlocked = '/achievements/unlocked';
}

/// Pops when possible, otherwise falls back to the mission list so a deep
/// link (or a temporary `initialLocation` pointing here) never asserts on an
/// empty stack.
void _popOrHome(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(MissionRoutePaths.list);
  }
}

/// Achievement route definitions — spread into the global router by the app
/// composition root, same as [missionRoutes]. Pure UI for now: no bloc, no
/// [ShellRoute].
List<RouteBase> achievementRoutes() => [
  GoRoute(
    path: AchievementRoutePaths.root,
    builder: (context, state) => AchievementPage(
      onBack: () => _popOrHome(context),
      onClose: () => _popOrHome(context),
      onOpenMilestones: () => context.push(AchievementRoutePaths.milestones),
      onCurrentMedalTap: () => context.push(AchievementRoutePaths.unlocked),
    ),
  ),
  GoRoute(
    path: AchievementRoutePaths.milestones,
    builder: (context, state) => AchievementMilestonePage(
      onBack: () => _popOrHome(context),
      onClose: () => _popOrHome(context),
      onViewMissions: () => context.go(MissionRoutePaths.list),
    ),
  ),
  GoRoute(
    path: AchievementRoutePaths.unlocked,
    builder: (context, state) => AchievementUnlockedPage(
      onClose: () => _popOrHome(context),
      onClaimReward: () => _popOrHome(context),
      onViewJourney: () =>
          context.pushReplacement(AchievementRoutePaths.milestones),
    ),
  ),
];
