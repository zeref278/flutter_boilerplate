import 'package:boilerplate/features/home/presentation/home_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'robot_base.dart';

class HomeRobot extends RobotBase {
  const HomeRobot(super.tester);

  Future<void> verifyVisible() async {
    await tester.pumpAndSettle();
    expect(find.byKey(const Key(HomeKeys.scaffold)), findsOneWidget);
  }

  Future<void> openDogImage() => tapKey(HomeKeys.dogImageRandomButton);

  Future<void> openSavedImages() => tapKey(HomeKeys.dogImageSavedButton);
}
