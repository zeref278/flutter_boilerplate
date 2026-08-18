import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'robot_tester_base.dart';

class HomeRobot extends RobotTesterBase {
  const HomeRobot(super.tester);

  Future<void> verifyVisible() async {
    await tester.pumpAndSettle();
    expect(find.byKey(const Key(WidgetKeys.homeScaffoldKey)), findsOneWidget);
  }

  Future<void> openDogImage() => tapKey(WidgetKeys.homeDogImageButtonKey);

  Future<void> openSavedImages() => tapKey(WidgetKeys.homeSavedImagesButtonKey);
}
