import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/config/routes/app_router.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/database/app_database.dart';
import 'package:boilerplate/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robot_tester/dog_image_robot.dart';
import '../robot_tester/home_robot.dart';
import '../robot_tester/intro_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    final AppStorage? storage = Injector.instance.isRegistered<AppStorage>()
        ? Injector.instance<AppStorage>()
        : null;
    final AppPreferences? preferences =
        Injector.instance.isRegistered<AppPreferences>()
        ? Injector.instance<AppPreferences>()
        : null;
    final AppDatabase? database = Injector.instance.isRegistered<AppDatabase>()
        ? Injector.instance<AppDatabase>()
        : null;
    await storage?.clear();
    await preferences?.setIsFirstUse(isFirstUse: true);
    if (database != null) {
      await database.delete(database.dogImages).go();
    }
    // GetIt owns and disposes the app bloc and Drift database.
    await Injector.reset();
    AppRouter.router.go(AppRouter.homePath);
  });

  testWidgets('intro leads to home on first launch', (tester) async {
    await _launchApp(tester, isFirstUse: true);

    await IntroRobot(tester).pressStarted();

    await HomeRobot(tester).verifyVisible();
  });

  testWidgets('loads a random dog image', (tester) async {
    await _launchApp(tester, isFirstUse: false);

    final HomeRobot home = HomeRobot(tester);
    final DogImageRobot dogImage = DogImageRobot(tester);

    await home.verifyVisible();
    await home.openDogImage();
    await dogImage.loadImage();

    await dogImage.verifyImageShown();
  });

  testWidgets('saves an image and lists it', (tester) async {
    await _launchApp(tester, isFirstUse: false);

    final HomeRobot home = HomeRobot(tester);
    final DogImageRobot dogImage = DogImageRobot(tester);

    await home.verifyVisible();
    await home.openDogImage();
    await dogImage.loadAndSaveImage();
    await dogImage.verifyImageShown();

    await tester.pageBack();
    await tester.pumpAndSettle();
    await home.openSavedImages();

    await dogImage.verifySavedCount(1);
  });
}

Future<void> _launchApp(WidgetTester tester, {required bool isFirstUse}) async {
  await app.main();
  await tester.pumpAndSettle();

  final AppStorage storage = Injector.instance<AppStorage>();
  final AppPreferences preferences = Injector.instance<AppPreferences>();
  final AppDatabase database = Injector.instance<AppDatabase>();

  await storage.clear();
  await preferences.setIsFirstUse(isFirstUse: isFirstUse);
  await database.delete(database.dogImages).go();
  AppRouter.router.go(AppRouter.homePath);
  Injector.instance<AppBloc>().add(const AppEvent.loaded());
  await tester.pumpAndSettle();
}
