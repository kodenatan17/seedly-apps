import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedly_app/atomic/atomic.dart';
import 'package:seedly_app/features/auth/presentation/pages/account_detail_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/help_support_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/notification_settings_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/profile_screen.dart';
import 'package:seedly_app/l10n/l10n.dart';

Widget _wrap(Widget page, {Locale locale = const Locale('en')}) => MaterialApp(
  theme: AppTheme.light,
  locale: locale,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: page,
);

/// Scrolls the target into view, then taps it.
Future<void> _tap(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

void main() {
  Future<void> setPhoneSize(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  group('NotificationSettingsScreen', () {
    testWidgets('toggles a preference switch', (tester) async {
      await setPhoneSize(tester);
      await tester.pumpWidget(
        _wrap(const NotificationSettingsScreen()),
      );

      final first = find.byType(Switch).first;
      final before = tester.widget<Switch>(first).value;
      await _tap(tester, first);
      expect(tester.widget<Switch>(first).value, !before);
    });

    testWidgets('renders Indonesian copy', (tester) async {
      await setPhoneSize(tester);
      await tester.pumpWidget(
        _wrap(
          const NotificationSettingsScreen(),
          locale: const Locale('id'),
        ),
      );

      expect(find.text('Notifikasi'), findsOneWidget);
    });
  });

  group('HelpSupportScreen', () {
    testWidgets('expands an FAQ answer on tap', (tester) async {
      await setPhoneSize(tester);
      await tester.pumpWidget(_wrap(const HelpSupportScreen()));

      const answer =
          'Open the Seedly app, tap Add Smart Pot, and hold the pairing button for 3 seconds until the LED blinks blue.';
      expect(find.text(answer), findsNothing);

      await _tap(tester, find.text('How to pair smart pot?'));
      expect(find.text(answer), findsOneWidget);
    });
  });

  group('ProfileScreen', () {
    testWidgets('reports bottom nav taps', (tester) async {
      await setPhoneSize(tester);
      final taps = <int>[];
      await tester.pumpWidget(_wrap(ProfileScreen(onNavTap: taps.add)));

      await _tap(
        tester,
        find.descendant(
          of: find.byType(BaseBottomNavBar),
          matching: find.text('Home'),
        ),
      );
      expect(taps, [0]);
    });

    testWidgets('reports settings tile targets', (tester) async {
      await setPhoneSize(tester);
      final opened = <String>[];
      await tester.pumpWidget(
        _wrap(ProfileScreen(onOpenSettings: opened.add)),
      );

      await _tap(tester, find.text('Account'));
      expect(opened, ['account']);
    });
  });

  group('AccountDetailScreen', () {
    testWidgets('reports pot card taps', (tester) async {
      await setPhoneSize(tester);
      var tapped = 0;
      await tester.pumpWidget(
        _wrap(AccountDetailScreen(onPotTap: () => tapped++)),
      );

      await _tap(tester, find.text('Smart Pot A'));
      expect(tapped, 1);
    });
  });
}
