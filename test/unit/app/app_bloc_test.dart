import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_bloc_test.mocks.dart';

@GenerateMocks(<Type>[AppPreferences])
void main() {
  late MockAppPreferences preferences;

  setUp(() {
    preferences = MockAppPreferences();
    when(preferences.isDarkMode).thenAnswer((_) async => false);
    when(preferences.locale).thenAnswer((_) async => 'en');
    when(preferences.isFirstUse).thenAnswer((_) async => true);
  });

  blocTest<AppBloc, AppState>(
    'loads preferences into state',
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.loaded()),
    expect: () => <Matcher>[
      isA<AppState>().having((s) => s.status, 'status', isA<UILoading>()),
      isA<AppState>()
          .having((s) => s.status, 'status', isA<UILoadSuccess>())
          .having((s) => s.locale, 'locale', 'en')
          .having((s) => s.isFirstUse, 'isFirstUse', true),
    ],
  );

  blocTest<AppBloc, AppState>(
    'toggles dark mode and persists it',
    seed: () => const AppState(isDarkMode: false),
    setUp: () => when(
      preferences.setIsDarkMode(darkMode: anyNamed('darkMode')),
    ).thenAnswer((_) async {}),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.darkModeToggled()),
    expect: () => <Matcher>[
      isA<AppState>().having((s) => s.isDarkMode, 'isDarkMode', true),
    ],
    verify: (_) => verify(preferences.setIsDarkMode(darkMode: true)).called(1),
  );

  blocTest<AppBloc, AppState>(
    'ignores a locale change to the current locale',
    seed: () => const AppState(locale: 'en'),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.localeChanged('en')),
    expect: () => <Matcher>[],
    verify: (_) =>
        verifyNever(preferences.setLocale(locale: anyNamed('locale'))),
  );
}
