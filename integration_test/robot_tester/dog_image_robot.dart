import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'robot_tester_base.dart';

class DogImageRobot extends RobotTesterBase {
  const DogImageRobot(super.tester);

  Future<void> loadImage() async {
    await tapKey(WidgetKeys.dogImageLoadButtonKey, settle: false);
    await waitForKey(WidgetKeys.dogImageResultKey);
  }

  Future<void> loadAndSaveImage() async {
    await tapKey(WidgetKeys.dogImageSaveButtonKey, settle: false);
    await waitForKey(WidgetKeys.dogImageResultKey);
  }

  Future<void> verifyImageShown() async {
    expect(find.byKey(const Key(WidgetKeys.dogImageResultKey)), findsOneWidget);
  }

  Future<void> verifySavedCount(int expected) async {
    await tester.pumpAndSettle();
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key is ValueKey<String> &&
            (widget.key! as ValueKey<String>).value.startsWith(
              WidgetKeys.savedImageTileKey,
            ),
      ),
      findsNWidgets(expected),
    );
  }
}
