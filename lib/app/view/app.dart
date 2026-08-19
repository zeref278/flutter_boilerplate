import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/view/secure_app_barrier.dart';
import 'package:boilerplate/config/routes/app_router.dart';
import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppBloc _appBloc = Injector.instance<AppBloc>()
    ..add(const AppEvent.loaded());

  late final SecureAppGuard _secureAppGuard =
      Injector.instance<SecureAppGuard>();

  @override
  Widget build(BuildContext context) {
    // Outside the BlocProvider on purpose: a blocked app builds no router, no
    // feature bloc, and no route that could keep running behind the notice.
    return ValueListenableBuilder<SecureAppThreat?>(
      valueListenable: _secureAppGuard.threat,
      builder: (context, threat, child) {
        if (threat == null) return child!;
        // Locale and theme come from the last loaded state so the notice
        // does not arrive in the wrong language. Reading state here is safe
        // even mid-load: both fields carry defaults from the first frame.
        return SecureAppBarrier(
          threat: threat,
          locale: _appBloc.state.locale,
          isDarkMode: _appBloc.state.isDarkMode,
        );
      },
      child: _buildApp(),
    );
  }

  Widget _buildApp() {
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
          if (state.status case UILoadFailed(:final failure)) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(state.locale),
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              home: Builder(
                builder: (context) => Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(failure.displayMessage(context)),
                        TextButton(
                          onPressed: () => context.read<AppBloc>().add(
                            const AppEvent.loaded(),
                          ),
                          child: Text(context.l10n.actionRetry),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return MaterialApp.router(
            // onGenerateTitle rather than title: the string is localized,
            // and title is read from outside any localized context. This is
            // the label Android shows in the task switcher.
            onGenerateTitle: (context) => context.l10n.appTitle,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.locale),
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRouter.router,
            builder: (context, child) => BlocListener<AppBloc, AppState>(
              listenWhen: (previous, next) =>
                  previous.notification != next.notification,
              listener: (context, state) {
                final AppNotification? notification = state.notification;
                if (notification == null) return;
                switch (notification) {
                  case AppNotificationFailed(:final failure):
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(failure.displayMessage(context)),
                        ),
                      );
                }
              },
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
