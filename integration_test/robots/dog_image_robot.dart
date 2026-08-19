import 'package:boilerplate/features/dog_image/presentation/random/dog_image_random_keys.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/dog_image_saved_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'robot_base.dart';

class DogImageRobot extends RobotBase {
  const DogImageRobot(super.tester);

  Future<void> loadImage() async {
    await tapKey(DogImageRandomKeys.loadButton, settle: false);
    await waitForKey(DogImageRandomKeys.result);
  }

  Future<void> loadAndSaveImage() async {
    await tapKey(DogImageRandomKeys.saveButton, settle: false);
    await waitForKey(DogImageRandomKeys.result);
  }

  Future<void> verifyImageShown() async {
    expect(find.byKey(const Key(DogImageRandomKeys.result)), findsOneWidget);
  }

  Future<void> verifySavedCount(int expected) async {
    await tester.pumpAndSettle();
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key is ValueKey<String> &&
            (widget.key! as ValueKey<String>).value.startsWith(
              DogImageSavedKeys.tile,
            ),
      ),
      findsNWidgets(expected),
    );
  }
}
