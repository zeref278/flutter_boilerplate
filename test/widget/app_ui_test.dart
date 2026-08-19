import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/app/view/app.dart';
import 'package:boilerplate/app/view/app_director.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/config/routes/app_router.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/extensions/build_context_ex.dart';
import 'package:boilerplate/core/security/secure_app_guard.dart';
import 'package:boilerplate/core/security/secure_app_threat.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/widgets/dog_image_tile.dart';
import 'package:boilerplate/features/home/presentation/home_keys.dart';
import 'package:boilerplate/features/intro/presentation/intro_keys.dart';
import 'package:boilerplate/features/setting/presentation/view/setting_page.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// A guard whose verdict the test decides, so the shell can be driven into
/// the blocked state without a device or a platform channel.
class _ControllableSecureAppGuard implements SecureAppGuard {
  /// Narrowed to the notifier so the test can write the verdict the shell
  /// only reads.
  @override
  final ValueNotifier<SecureAppThreat?> threat =
      ValueNotifier<SecureAppThreat?>(null);

  @override
  Future<void> arm() async {}
}

void main() {
  Widget wrap({required AppBloc bloc, required Widget child}) =>
      BlocProvider<AppBloc>.value(
        value: bloc,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        ),
      );

  setUp(() async {
    await Injector.reset();
    // App resolves the guard before it builds anything else. The permissive
    // one keeps these tests about the shell rather than about RASP, which has
    // no platform channel to answer them here anyway.
    Injector.instance.registerSingleton<SecureAppGuard>(
      PermissiveSecureAppGuard(),
    );
    AppRouter.router.go(AppRouter.homePath);
  });

  tearDown(() async {
    await Injector.reset();
    AppRouter.router.go(AppRouter.homePath);
  });

  testWidgets('director replaces intro with home after first use completes', (
    tester,
  ) async {
    final _MemoryAppPreferences preferences = _MemoryAppPreferences();
    final AppBloc bloc = AppBloc(preferences);
    addTearDown(bloc.close);

    await tester.pumpWidget(wrap(bloc: bloc, child: const AppDirector()));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(IntroKeys.startedButton)), findsOneWidget);

    await tester.tap(find.byKey(const Key(IntroKeys.startedButton)));
    await tester.pumpAndSettle();

    expect(preferences.firstUseValue, isFalse);
    expect(find.byKey(const Key(HomeKeys.scaffold)), findsOneWidget);
  });

  testWidgets('settings persist dark mode and locale selections', (
    tester,
  ) async {
    final _MemoryAppPreferences preferences = _MemoryAppPreferences();
    final AppBloc bloc = AppBloc(preferences);
    addTearDown(bloc.close);

    await tester.pumpWidget(wrap(bloc: bloc, child: const SettingPage()));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle();

    expect(preferences.darkModeValue, isTrue);
    expect(bloc.state.isDarkMode, isTrue);

    final BuildContext context = tester.element(find.byType(SettingPage));
    await tester.tap(find.text(context.l10n.settingVietnamese));
    await tester.pumpAndSettle();

    expect(preferences.localeValue, 'vi');
    expect(bloc.state.locale, 'vi');
  });

  testWidgets('initial preference failure shows localized retry UI', (
    tester,
  ) async {
    final _ThrowingAppPreferences preferences = _ThrowingAppPreferences(
      failReads: true,
    );
    final AppBloc bloc = AppBloc(preferences);
    Injector.instance.registerSingleton<AppBloc>(
      bloc,
      dispose: (value) => value.close(),
    );

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.text('Could not access local storage.'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    preferences.failReads = false;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(IntroKeys.startedButton)), findsOneWidget);
  });

  testWidgets('preference write failure is localized and rolls back UI', (
    tester,
  ) async {
    final _ThrowingAppPreferences preferences = _ThrowingAppPreferences(
      failDarkModeWrites: true,
    )..firstUseValue = false;
    final AppBloc bloc = AppBloc(preferences);
    Injector.instance.registerSingleton<AppBloc>(
      bloc,
      dispose: (value) => value.close(),
    );

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key(HomeKeys.settingButton)));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SwitchListTile));
    await tester.pump();

    expect(find.text('Could not access local storage.'), findsOneWidget);
    expect(bloc.state.isDarkMode, isFalse);
    expect(preferences.darkModeValue, isFalse);
  });

  testWidgets('a detected threat replaces the app rather than covering it', (
    tester,
  ) async {
    final _ControllableSecureAppGuard guard = _ControllableSecureAppGuard();
    await Injector.reset();
    Injector.instance.registerSingleton<SecureAppGuard>(guard);
    final _MemoryAppPreferences preferences = _MemoryAppPreferences()
      ..firstUseValue = false;
    Injector.instance.registerSingleton<AppBloc>(
      AppBloc(preferences),
      dispose: (value) => value.close(),
    );

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    expect(find.byKey(const Key(HomeKeys.scaffold)), findsOneWidget);

    guard.threat.value = SecureAppThreat.privilegedAccess;
    await tester.pumpAndSettle();

    expect(find.text("Can't run here"), findsOneWidget);
    // The shell is gone, not merely obscured: nothing behind the notice is
    // still mounted and reachable.
    expect(find.byKey(const Key(HomeKeys.scaffold)), findsNothing);
  });

  testWidgets('unknown routes show a localized message without error details', (
    tester,
  ) async {
    final AppBloc bloc = AppBloc(_MemoryAppPreferences());
    addTearDown(bloc.close);

    await tester.pumpWidget(
      BlocProvider<AppBloc>.value(
        value: bloc,
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    AppRouter.router.go('/missing');
    await tester.pumpAndSettle();

    expect(find.text('Page not found.'), findsOneWidget);
    expect(find.textContaining('no routes for location'), findsNothing);
  });

  test('saved-image tile renders its URL and invokes deletion', () {
    bool deleted = false;
    const DogImageEntity image = DogImageEntity(
      id: 7,
      imageUrl: 'https://images.example/dog.jpg',
    );
    final DogImageTile widget = DogImageTile(
      image: image,
      onDelete: () => deleted = true,
    );

    final ListTile tile = widget.build(_UnusedBuildContext()) as ListTile;
    final Image leading = tile.leading! as Image;
    final Text title = tile.title! as Text;
    final IconButton trailing = tile.trailing! as IconButton;

    expect((leading.image as NetworkImage).url, image.imageUrl);
    expect(title.data, image.imageUrl);
    expect(title.maxLines, 1);
    trailing.onPressed!();
    expect(deleted, isTrue);
  });
}

class _MemoryAppPreferences implements AppPreferences {
  bool darkModeValue = false;
  String localeValue = AppConfig.defaultLocale;
  bool firstUseValue = true;

  @override
  Future<bool> get isDarkMode async => darkModeValue;

  @override
  Future<String> get locale async => localeValue;

  @override
  Future<bool> get isFirstUse async => firstUseValue;

  @override
  Future<void> setIsDarkMode({required bool darkMode}) async {
    darkModeValue = darkMode;
  }

  @override
  Future<void> setLocale({required String locale}) async {
    localeValue = locale;
  }

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    firstUseValue = isFirstUse;
  }
}

class _ThrowingAppPreferences extends _MemoryAppPreferences {
  _ThrowingAppPreferences({
    this.failReads = false,
    this.failDarkModeWrites = false,
  });

  bool failReads;
  final bool failDarkModeWrites;

  @override
  Future<bool> get isDarkMode async {
    if (failReads) {
      throw const StorageReadException('preferences unavailable', 'dark_mode');
    }
    return super.isDarkMode;
  }

  @override
  Future<void> setIsDarkMode({required bool darkMode}) async {
    if (failDarkModeWrites) {
      throw const StorageWriteException('preferences unavailable', 'dark_mode');
    }
    await super.setIsDarkMode(darkMode: darkMode);
  }
}

class _UnusedBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
