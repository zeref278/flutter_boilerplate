import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/app/view/app_director.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/presentation/widgets/dog_image_tile.dart';
import 'package:boilerplate/features/setting/presentation/view/setting_page.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap({required AppBloc bloc, required Widget child}) =>
      BlocProvider<AppBloc>.value(
        value: bloc,
        child: MaterialApp(
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: child,
        ),
      );

  testWidgets('director replaces intro with home after first use completes', (
    tester,
  ) async {
    final _MemoryAppPreferences preferences = _MemoryAppPreferences();
    final AppBloc bloc = AppBloc(preferences);
    addTearDown(bloc.close);

    await tester.pumpWidget(wrap(bloc: bloc, child: const AppDirector()));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key(WidgetKeys.introStartedButtonKey)),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const Key(WidgetKeys.introStartedButtonKey)));
    await tester.pumpAndSettle();

    expect(preferences.firstUseValue, isFalse);
    expect(find.byKey(const Key(WidgetKeys.homeScaffoldKey)), findsOneWidget);
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
    await tester.tap(find.text(S.of(context).vietnamese));
    await tester.pumpAndSettle();

    expect(preferences.localeValue, 'vi');
    expect(bloc.state.locale, 'vi');
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

class _UnusedBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
