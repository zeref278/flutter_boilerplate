import 'package:boilerplate/core/bloc_core/ui_status.dart';
import 'package:boilerplate/core/themes/app_themes.dart';
import 'package:boilerplate/features/app/bloc/app_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:boilerplate/router/app_router.dart';
import 'package:boilerplate/widgets/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = Injector.instance<AppBloc>()
      ..add(
        const AppEvent.loaded(),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>.value(
      value: _appBloc,
      child: BlocSelector<AppBloc, AppState, UIStatus>(
        bloc: _appBloc,
        selector: (state) => state.status,
        builder: (context, appStatus) {
          return appStatus.when(
            initial: () => const SplashPage(),
            loading: () => const SplashPage(),
            loadFailed: (_) => const SizedBox(),
            loadSuccess: (_) => const _App(),
          );
        },
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final String locale = context.select(
      (AppBloc value) => value.state.locale,
    );

    final bool isDarkMode = context.select(
      (AppBloc value) => value.state.isDarkMode,
    );

    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const AppLocalizationDelegate().supportedLocales,
      locale: Locale(locale),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routerConfig: AppRouter.router,
      title: 'BoilerPlate',
    );
  }
}
