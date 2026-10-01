// Basic smoke test: the app boots through DI + the global router and lands
// on the Mission list route (`initialLocation`) without crashing.

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:growpico_app/main.dart';
import 'package:growpico_app/cores/dependency/injection.dart';

void main() {
  setUp(() {
    GetIt.instance.reset();
    registerCoreDependencies();
  });

  testWidgets('GrowPicoApp boots to the Missions list route',
      (WidgetTester tester) async {
    await tester.pumpWidget(GrowPicoApp());
    await tester.pumpAndSettle();

    expect(find.text('Missions'), findsOneWidget);
  });
}
