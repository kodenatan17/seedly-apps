import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedly_app/atomic/atomic.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(body: child),
);

void main() {
  testWidgets('taps on the label toggle the value once', (tester) async {
    var latest = false;
    await tester.pumpWidget(
      _wrap(
        BaseCheckboxRow(
          label: 'Remember me',
          value: false,
          onChanged: (value) => latest = value,
        ),
      ),
    );

    await tester.tap(find.text('Remember me'));
    await tester.pump();
    expect(latest, isTrue);
  });

  testWidgets('renders the trailing widget when checked', (tester) async {
    await tester.pumpWidget(
      _wrap(
        BaseCheckboxRow(
          label: 'Remember me',
          value: true,
          onChanged: (_) {},
          trailing: const BaseTextLink('Forgot password?'),
        ),
      ),
    );

    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
  });

  testWidgets('is inert without onChanged', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const BaseCheckboxRow(label: 'Locked', value: false),
      ),
    );

    await tester.tap(find.text('Locked'));
    await tester.pump();
    expect(find.byIcon(Icons.check), findsNothing);
  });
}
