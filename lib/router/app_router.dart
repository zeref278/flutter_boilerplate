import 'package:boilerplate/features/application/config_page.dart';
import 'package:boilerplate/features/home/ui/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';
  static const String config = '/config';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
