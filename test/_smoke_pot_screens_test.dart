import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growpico_app/atomic/atomic.dart';
import 'package:growpico_app/features/garden/public_api.dart';
import 'package:growpico_app/l10n/l10n.dart';

Widget _wrap(Widget page) => MaterialApp(
  theme: AppTheme.light,
  locale: const Locale('en'),
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: page,
);

void main() {
  for (final width in <double>[320, 390]) {
    testWidgets('pot screens render @$width', (tester) async {
      tester.view.physicalSize = Size(width * 3, 844 * 3);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      for (final page in <Widget>[
        GardenAddPotScreen(onScanQr: () {}, onEnterCode: () {}),
        GardenPotAddDetailScreen(onConfirm: () {}),
        GardenAddPotSuccessScreen(),
      ]) {
        await tester.pumpWidget(_wrap(page));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: '${page.runtimeType}');
      }
    });
  }
}
