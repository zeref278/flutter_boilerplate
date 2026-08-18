import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/config/routes/app_router.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/ui/app_themes.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppBloc _appBloc = Injector.instance<AppBloc>()
    ..add(const AppEvent.loaded());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>.value(
      value: _appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (prev, next) =>
            prev.status != next.status ||
            prev.locale != next.locale ||
            prev.isDarkMode != next.isDarkMode,
        builder: (context, state) {
          if (state.status is UIInitial || state.status is UILoading) {
            return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          }
          return MaterialApp.router(
            title: 'Boilerplate',
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(state.locale),
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
