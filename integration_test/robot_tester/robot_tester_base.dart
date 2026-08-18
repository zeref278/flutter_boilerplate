import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class RobotTesterBase {
  const RobotTesterBase(this.tester);

  final WidgetTester tester;

  Future<void> tapKey(String key, {bool settle = true}) async {
    final Finder finder = find.byKey(Key(key));
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    if (settle) {
      await tester.pumpAndSettle();
    } else {
      await tester.pump();
    }
  }

  Future<void> waitForKey(
    String key, {
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final Finder finder = find.byKey(Key(key));
    final Stopwatch stopwatch = Stopwatch()..start();

    while (finder.evaluate().isEmpty && stopwatch.elapsed < timeout) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 100)),
      );
      await tester.pump();
    }

    expect(
      finder,
      findsOneWidget,
      reason: 'Expected widget with key "$key" within $timeout.',
    );
  }
}
