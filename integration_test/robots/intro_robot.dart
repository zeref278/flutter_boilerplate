import 'package:boilerplate/features/intro/presentation/intro_keys.dart';

import 'robot_base.dart';

class IntroRobot extends RobotBase {
  const IntroRobot(super.tester);

  Future<void> pressStarted() => tapKey(IntroKeys.startedButton);
}
