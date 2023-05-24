import 'dart:async';

import 'package:boilerplate/core/keys/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'robot_tester_base.dart';

class IntroRobot extends RobotTesterBase {
  IntroRobot(super.tester);

  FutureOr<void> pressStarted() async {
    await tester.pumpAndSettle();
    final Finder startedButton =
        find.byKey(const Key(WidgetKeys.introStartedButtonKey));
    await tester.ensureVisible(startedButton);
    await tester.tap(startedButton);
    await tester.pumpAndSettle();
  }
}
