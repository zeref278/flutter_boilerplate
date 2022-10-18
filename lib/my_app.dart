import 'package:boilerplate/common/app_themes.dart';
import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ApplicationBloc _bloc;
  late String _locale;
  late bool _isDarkMode;

  @override
  void initState() {
    _locale = 'en';
    _bloc = Injector.instance<ApplicationBloc>();
    _bloc.add(const ApplicationLoaded());
    _isDarkMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>.value(
          value: _bloc,
        ),
      ],
      child: BlocListener<ApplicationBloc, ApplicationState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.status == UIStatus.loadSuccess) {
            if (_locale != state.locale) {
              setState(() {
                _locale = state.locale;
              });
            }

            if (_isDarkMode != state.isDarkMode) {
              setState(() {
                _isDarkMode = state.isDarkMode;
              });
            }
          }
        },
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          locale: Locale(_locale),
          themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          title: 'BoilerPlate',
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
