import 'package:flutter_test/flutter_test.dart';

abstract class RobotTesterBase {
  RobotTesterBase(this.tester);
  final WidgetTester tester;

  Future<void> wait(int milliseconds) async {
    await Future<void>.delayed(Duration(milliseconds: milliseconds));
  }
}
