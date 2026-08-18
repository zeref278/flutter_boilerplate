import 'package:boilerplate/core/ui/app_keys.dart';

import 'robot_tester_base.dart';

class IntroRobot extends RobotTesterBase {
  const IntroRobot(super.tester);

  Future<void> pressStarted() => tapKey(WidgetKeys.introStartedButtonKey);
}
