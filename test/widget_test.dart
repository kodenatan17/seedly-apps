// Basic smoke test: the app boots through DI + the global router and lands
// on the Mission list route (`initialLocation`) without crashing.

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:seedly_app/app.dart';
import 'package:seedly_app/cores/dependency/injection.dart';

void main() {
  setUp(() {
    GetIt.instance.reset();
    registerCoreDependencies();
  });

  testWidgets('SeedlyApp boots to the Missions list route',
      (WidgetTester tester) async {
    await tester.pumpWidget(SeedlyApp());
    await tester.pumpAndSettle();

    expect(find.text('Missions'), findsOneWidget);
  });
}
