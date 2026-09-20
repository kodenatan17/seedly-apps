import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedly_app/atomic/atomic.dart';
import 'package:seedly_app/features/experience/presentation/pages/achievement_milestone_page.dart';
import 'package:seedly_app/features/experience/presentation/pages/achievement_page.dart';
import 'package:seedly_app/features/experience/presentation/pages/achievement_unlocked_page.dart';
import 'package:seedly_app/features/experience/presentation/widgets/achievement/medal_tier_timeline_item.dart';
import 'package:seedly_app/features/experience/presentation/widgets/achievement/unlocked_medal_tile.dart';
import 'package:seedly_app/l10n/l10n.dart';

Widget _wrap(Widget page, {Locale locale = const Locale('en')}) => MaterialApp(
  theme: AppTheme.light,
  locale: locale,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: page,
);

void main() {
  setUp(() {
    // Phone-sized surface so layouts match the mockup viewport.
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  Future<void> setPhoneSize(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  group('AchievementPage', () {
    testWidgets('renders header, cards and 4 unlocked medals', (tester) async {
      await setPhoneSize(tester);
      var openedMilestones = 0;
      await tester.pumpWidget(
        _wrap(AchievementPage(onOpenMilestones: () => openedMilestones++)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Achievements'), findsOneWidget);
      expect(find.text('Garden Mastery'), findsOneWidget);
      expect(find.text('Level 5'), findsOneWidget);
      expect(find.text('Master Gardener'), findsOneWidget);
      expect(find.text('28 / 35'), findsOneWidget);
      expect(find.text('7 milestones to next rank'), findsOneWidget);
      expect(find.text('80% completed'), findsOneWidget);
      expect(find.text('4 earned'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.byType(UnlockedMedalTile).last,
        200,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byType(UnlockedMedalTile), findsNWidgets(4));

      await tester.tap(find.text('Plant Keeper'));
      expect(openedMilestones, 1);
    });

    testWidgets('renders Indonesian copy', (tester) async {
      await setPhoneSize(tester);
      await tester.pumpWidget(
        _wrap(const AchievementPage(), locale: const Locale('id')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Pencapaian'), findsOneWidget);
      expect(find.text('Penguasaan Kebun'), findsOneWidget);
      expect(find.text('4 diraih'), findsOneWidget);
    });
  });

  group('AchievementMilestonePage', () {
    testWidgets('renders all 10 tiers and the CTA', (tester) async {
      await setPhoneSize(tester);
      var viewMissions = 0;
      await tester.pumpWidget(
        _wrap(AchievementMilestonePage(onViewMissions: () => viewMissions++)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Milestone Progress'), findsWidgets);
      expect(find.text('Tier 5'), findsOneWidget);
      expect(find.text('38 / 45'), findsWidgets);
      expect(find.text('5 Left'), findsOneWidget);

      final scrollable = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(
        find.text("View Today's Missions"),
        300,
        scrollable: scrollable,
      );
      expect(find.byType(MedalTierTimelineItem), findsNWidgets(10));
      expect(find.text('LEGENDARY TIER • 100 MILESTONES'), findsOneWidget);

      await tester.tap(find.text("View Today's Missions"));
      expect(viewMissions, 1);
    });
  });

  group('AchievementUnlockedPage', () {
    testWidgets('renders hero, perk and both actions', (tester) async {
      await setPhoneSize(tester);
      var claimed = 0;
      var journey = 0;
      await tester.pumpWidget(
        _wrap(
          AchievementUnlockedPage(
            onClaimReward: () => claimed++,
            onViewJourney: () => journey++,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('New Achievements'), findsOneWidget);
      expect(find.text('Plant Keeper Supreme'), findsOneWidget);
      expect(find.text('35 / 35'), findsOneWidget);
      expect(
        find.text('Special Golden Pot Skin & +100 XP Bonus!'),
        findsOneWidget,
      );

      final scrollable = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(
        find.text('View in Medal Journey'),
        200,
        scrollable: scrollable,
      );
      await tester.tap(find.text('Claim Reward & Continue'));
      await tester.tap(find.text('View in Medal Journey'));
      expect(claimed, 1);
      expect(journey, 1);
    });
  });
}
