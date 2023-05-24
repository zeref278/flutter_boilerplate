import 'package:boilerplate/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../robot_tester/app_robot.dart';
import '../robot_tester/home_robot.dart';
import '../robot_tester/intro_robot.dart';

void main() {
  IntroRobot introTester;
  HomeRobot homeTester;
  AppRobot appRobot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('app', () {
    /// Case: show intro page first use app
    testWidgets('Show intro page first use app', (tester) async {
      await app.main();
      appRobot = AppRobot(tester);
      introTester = IntroRobot(tester);
      homeTester = HomeRobot(tester);
      await introTester.pressStarted();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await homeTester.verifyIsHomePage();
    });

    /// Case: show intro page did not first use app
    testWidgets('Show home page did not first use app', (tester) async {
      appRobot = AppRobot(tester);
      introTester = IntroRobot(tester);
      homeTester = HomeRobot(tester);

      appRobot.restartApp();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await homeTester.verifyIsHomePage();
    });
  });
}
