import 'package:boilerplate/app/view/app_director.dart';
import 'package:boilerplate/features/dog_image/presentation/view/dog_image_random_page.dart';
import 'package:boilerplate/features/dog_image/presentation/view/dog_image_saved_page.dart';
import 'package:boilerplate/features/setting/presentation/view/setting_page.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String homeName = 'home';
  static const String homePath = '/';

  static const String settingName = 'setting';
  static const String settingPath = '/setting';

  static const String dogImageRandomName = 'dogImageRandom';
  static const String dogImageRandomPath = '/dog-image';

  static const String savedImagesName = 'savedImages';
  static const String savedImagesPath = '/saved-images';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: homeName,
        path: homePath,
        builder: (context, state) => const AppDirector(),
      ),
      GoRoute(
        name: settingName,
        path: settingPath,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        name: dogImageRandomName,
        path: dogImageRandomPath,
        builder: (context, state) => const DogImageRandomPage(),
      ),
      GoRoute(
        name: savedImagesName,
        path: savedImagesPath,
        builder: (context, state) => const DogImageSavedPage(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(S.of(context).route_not_found))),
  );
}
