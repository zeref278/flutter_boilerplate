import 'package:boilerplate/app/bloc/app_bloc.dart';
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
    final AppDatabase? database = Injector.instance.isRegistered<AppDatabase>()
        ? Injector.instance<AppDatabase>()
        : null;
    final AppBloc? appBloc = Injector.instance.isRegistered<AppBloc>()
        ? Injector.instance<AppBloc>()
        : null;

    await appBloc?.close();
    await database?.close();
    await Injector.reset();
    AppRouter.router.go(AppRouter.homePath);
  });

  testWidgets('intro leads to home on first launch', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    final AppStorage storage = Injector.instance<AppStorage>();
    final AppDatabase database = Injector.instance<AppDatabase>();
    await storage.clear();
    await database.delete(database.dogImages).go();
    Injector.instance<AppBloc>().add(const AppEvent.loaded());
    await tester.pumpAndSettle();

    await IntroRobot(tester).pressStarted();

    await HomeRobot(tester).verifyVisible();
  });

  testWidgets('loads a random dog image', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    final HomeRobot home = HomeRobot(tester);
    final DogImageRobot dogImage = DogImageRobot(tester);

    await home.openDogImage();
    await dogImage.loadImage();

    await dogImage.verifyImageShown();
  });

  testWidgets('saves an image and lists it', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    final HomeRobot home = HomeRobot(tester);
    final DogImageRobot dogImage = DogImageRobot(tester);

    await home.openDogImage();
    await dogImage.loadAndSaveImage();
    await dogImage.verifyImageShown();

    await tester.pageBack();
    await tester.pumpAndSettle();
    await home.openSavedImages();

    await dogImage.verifySavedCount(1);
  });
}
