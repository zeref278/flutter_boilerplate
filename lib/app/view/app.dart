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
            builder: (context, child) => _ToastLayer(
              child: BlocListener<AppBloc, AppState>(
                listenWhen: (previous, next) =>
                    previous.notification != next.notification,
                listener: (context, state) {
                  final AppNotification? notification = state.notification;
                  if (notification == null) return;
                  switch (notification) {
                    case AppNotificationFailed(:final failure):
                      AppToast.show(context, failure.displayMessage(context));
                  }
                },
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Mounts the app's single [Overlay] above the router.
///
/// Toasts go here rather than into the `Navigator`'s own overlay, so a message
/// outlives the route that raised it and a route change never cancels one
/// mid-flight. It also gives the app-level listener an `Overlay` to find:
/// `MaterialApp.builder` runs *above* the `Navigator`, so without this there
/// is none in scope and an app-level failure would be shown nowhere — shown
/// nowhere silently, because `AppToast.show` no-ops when it finds no overlay.
///
/// The entry is built once and held, not rebuilt inside `builder`.
/// `Overlay.initialEntries` is read exactly once, in `OverlayState.initState`:
/// an entry constructed in `builder` is allocated on every rebuild, never
/// inserted, never disposed, and the one entry that *did* get inserted keeps
/// serving the [child] its closure captured the first time. Anyone adding a
/// reactive wrapper in `builder` would find it silently frozen.
///
/// Note for anyone extending this: an `Overlay` above the `Navigator` is what
/// `Overlay.of(context, rootOverlay: true)` now resolves to app-wide, which
/// is the lookup Flutter uses for text-selection handles and toolbars, the
/// magnifier, and context menus. Nothing in `lib/` has a text field today, so
/// nothing is affected yet.
class _ToastLayer extends StatefulWidget {
  const _ToastLayer({required this.child});

  final Widget child;

  @override
  State<_ToastLayer> createState() => _ToastLayerState();
}

class _ToastLayerState extends State<_ToastLayer> {
  /// The live child, pushed through a notifier so the held entry re-reads it
  /// rather than pinning whatever it closed over.
  late final ValueNotifier<Widget> _child = ValueNotifier<Widget>(widget.child);

  late final OverlayEntry _entry = OverlayEntry(
    builder: (_) => ValueListenableBuilder<Widget>(
      valueListenable: _child,
      builder: (_, Widget child, _) => child,
    ),
  );

  @override
  void didUpdateWidget(covariant _ToastLayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _child.value = widget.child;
  }

  @override
  void dispose() {
    // Any toast still showing belongs to an Overlay that is going away with
    // this widget; clearing it keeps the static from pointing at a corpse.
    AppToast.dismiss();
    _entry
      ..remove()
      ..dispose();
    _child.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Overlay(initialEntries: <OverlayEntry>[_entry]);
}
