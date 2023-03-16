import 'package:boilerplate/features/application/config_page.dart';
import 'package:boilerplate/features/application/home_page.dart';
import 'package:boilerplate/features/demo/ui/assets_page.dart';
import 'package:boilerplate/features/demo/ui/images_from_db_page.dart';
import 'package:boilerplate/features/dog_image_random/ui/dog_image_random_page.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/widgets/error_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';
  static const String dogImageRandomPath = '/dogImageRandom';
  static const String config = '/config';
  static const String assets = '/assets';
  static const String imagesFromDb = '/imagesFromDb';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: dogImageRandomPath,
        builder: (context, state) => const DogImageRandomPage(),
      ),
      GoRoute(
        path: config,
        builder: (context, state) => const ConfigPage(),
      ),
      GoRoute(
        path: assets,
        builder: (context, state) => const AssetsPage(),
      ),
      GoRoute(
        path: imagesFromDb,
        builder: (context, state) {
          if (!kIsWeb) {
            return const ImagesFromDbPage();
          }

          return ErrorPage(
            content: S.current.didnt_supported,
          );
        },
      ),
    ],
  );
}
