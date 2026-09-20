import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedly_app/atomic/atomic.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(body: Center(child: child)),
);

void main() {
  testWidgets('tapping calls onPressed', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(BaseButton(label: 'Tap', onPressed: () => taps++)),
    );

    await tester.tap(find.text('Tap'));
    expect(taps, 1);
  });

  testWidgets('isLoading shows a spinner and disables taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(BaseButton(label: 'Tap', onPressed: () => taps++, isLoading: true)),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.tap(find.text('Tap'), warnIfMissed: false);
    expect(taps, 0);
  });

  testWidgets('isExpanded fills the available width', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const SizedBox(
          width: 300,
          child: BaseButton(label: 'Wide', onPressed: null, isExpanded: true),
        ),
      ),
    );

    final size = tester.getSize(find.byType(FilledButton));
    expect(size.width, 300);
  });

  testWidgets('leading and trailing icons render', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const BaseButton(
          label: 'Icons',
          onPressed: null,
          leadingIcon: Icons.eco,
          trailingIcon: Icons.chevron_right,
        ),
      ),
    );

    expect(find.byIcon(Icons.eco), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });
}
