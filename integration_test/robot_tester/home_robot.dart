import 'dart:async';
import 'package:boilerplate/core/keys/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'robot_tester_base.dart';

class HomeRobot extends RobotTesterBase {
  HomeRobot(super.tester);

  FutureOr<void> verifyIsHomePage() async {
    await tester.pumpAndSettle();
    expect(find.byKey(const Key(WidgetKeys.homeScaffoldKey)), findsOneWidget);
  }
}
