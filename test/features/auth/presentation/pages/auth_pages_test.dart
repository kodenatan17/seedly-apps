import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedly_app/atomic/atomic.dart';
import 'package:seedly_app/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/otp_screen.dart';
import 'package:seedly_app/features/auth/presentation/pages/register_screen.dart';
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

const _termsLabel =
    'I agree to Seedly Family Terms and Child Safety Privacy Policy';

void main() {
  Future<void> setPhoneSize(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  group('RegisterScreen', () {
    testWidgets('gates submit on the terms box, then on field validation', (
      tester,
    ) async {
      await setPhoneSize(tester);
      final submitted = <String>[];
      await tester.pumpWidget(
        _wrap(
          RegisterScreen(
            onCreateAccount: (email, password) => submitted.add(email),
          ),
        ),
      );

      // Inert until the terms box is ticked.
      await _tap(tester, find.text('Create Account'));
      expect(submitted, isEmpty);
      expect(find.text('Use at least 8 characters'), findsNothing);

      await tester.enterText(
        find.byType(TextField).at(0),
        'nurul.gardener@gmail.com',
      );
      await _tap(tester, find.text(_termsLabel));
      await _tap(tester, find.text('Create Account'));

      expect(submitted, isEmpty);
      expect(find.text('Use at least 8 characters'), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(1), 'Sprouting99!');
      await tester.enterText(find.byType(TextField).at(2), 'Sprouting99!');
      await _tap(tester, find.text('Create Account'));
      expect(submitted, ['nurul.gardener@gmail.com']);
    });

    testWidgets('shows strength tiers and reports mismatched passwords', (
      tester,
    ) async {
      await setPhoneSize(tester);
      await tester.pumpWidget(_wrap(const RegisterScreen()));

      await tester.enterText(find.byType(TextField).at(1), 'Sprout');
      await tester.pumpAndSettle();
      expect(find.text('Lvl. 1 Seed'), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(2), 'Sprout');
      await tester.pumpAndSettle();
      await _tap(tester, find.text(_termsLabel));
      await _tap(tester, find.text('Create Account'));
      expect(find.text('Email is required'), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), 'nurul@seedly.app');
      await tester.enterText(find.byType(TextField).at(1), 'Sprouting99!');
      await tester.pumpAndSettle();
      expect(find.text('Lvl. 3 Bloom'), findsOneWidget);

      await _tap(tester, find.text('Create Account'));
      expect(find.text("Passwords don't match"), findsOneWidget);
    });
  });

  group('OtpScreen', () {
    testWidgets('counts the resend cooldown down, then re-enables', (
      tester,
    ) async {
      await setPhoneSize(tester);
      var resends = 0;
      await tester.pumpWidget(
        _wrap(
          OtpScreen(
            email: 'nurul.gardener@gmail.com',
            resendCooldownSeconds: 2,
            onResendLink: () => resends++,
          ),
        ),
      );

      expect(find.text('Resend link (2s)'), findsOneWidget);
      expect(find.text('Quick 3-step sprout'), findsOneWidget);
      expect(find.text('nurul.gardener@gmail.com'), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
      expect(find.text('Resend link (1s)'), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
      expect(find.text('Resend link'), findsOneWidget);

      await _tap(tester, find.text('Resend link'));
      expect(resends, 1);
      expect(find.text('Resend link (2s)'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));
      expect(find.text('Resend link'), findsOneWidget);
    });

    testWidgets('renders Indonesian copy', (tester) async {
      await setPhoneSize(tester);
      await tester.pumpWidget(
        _wrap(
          const OtpScreen(resendCooldownSeconds: 0),
          locale: const Locale('id'),
        ),
      );

      expect(find.text('Periksa emailmu 📩'), findsOneWidget);
      expect(find.text('3 langkah cepat bertunas'), findsOneWidget);
    });
  });

  group('ForgotPasswordScreen', () {
    testWidgets('requires an email, then reports the trimmed address', (
      tester,
    ) async {
      await setPhoneSize(tester);
      final requested = <String>[];
      await tester.pumpWidget(
        _wrap(ForgotPasswordScreen(onSendResetLink: requested.add)),
      );

      expect(find.text('Reset Your Password 🔑'), findsOneWidget);
      await _tap(tester, find.text('Send Reset Link'));
      expect(find.text('Email is required'), findsOneWidget);
      expect(requested, isEmpty);

      await tester.enterText(
        find.byType(TextField).first,
        ' hello@familygarden.com ',
      );
      await tester.pumpAndSettle();
      await _tap(tester, find.text('Send Reset Link'));
      expect(requested, ['hello@familygarden.com']);
    });
  });

  group('OnboardingScreen', () {
    testWidgets('renders the final step and wires both CTAs', (tester) async {
      await setPhoneSize(tester);
      var started = 0;
      var loggedIn = 0;
      await tester.pumpWidget(
        _wrap(
          OnboardingScreen(
            onGetStarted: () => started++,
            onLogIn: () => loggedIn++,
          ),
        ),
      );

      expect(find.text('Step 4 of 4'), findsOneWidget);
      expect(find.text('Learn, Earn & Flourish 🌿'), findsOneWidget);
      expect(find.text('Garden Master'), findsOneWidget);
      expect(find.text('1 / 10'), findsOneWidget);

      await _tap(tester, find.text('Get Started'));
      await _tap(tester, find.text('Log In'));
      expect(started, 1);
      expect(loggedIn, 1);
    });
  });
}
