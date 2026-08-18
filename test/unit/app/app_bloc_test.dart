import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/services/app_service/app_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_bloc_test.mocks.dart';

@GenerateMocks(<Type>[AppService])
void main() {
  late MockAppService appService;

  setUp(() {
    appService = MockAppService();
    when(appService.isDarkMode).thenAnswer((_) async => false);
    when(appService.locale).thenAnswer((_) async => 'en');
    when(appService.isFirstUse).thenAnswer((_) async => true);
  });

  blocTest<AppBloc, AppState>(
    'loads preferences into state',
    build: () => AppBloc(appService),
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
      appService.setIsDarkMode(darkMode: anyNamed('darkMode')),
    ).thenAnswer((_) async {}),
    build: () => AppBloc(appService),
    act: (bloc) => bloc.add(const AppEvent.darkModeToggled()),
    expect: () => <Matcher>[
      isA<AppState>().having((s) => s.isDarkMode, 'isDarkMode', true),
    ],
    verify: (_) => verify(appService.setIsDarkMode(darkMode: true)).called(1),
  );

  blocTest<AppBloc, AppState>(
    'ignores a locale change to the current locale',
    seed: () => const AppState(locale: 'en'),
    build: () => AppBloc(appService),
    act: (bloc) => bloc.add(const AppEvent.localeChanged('en')),
    expect: () => <Matcher>[],
    verify: (_) =>
        verifyNever(appService.setLocale(locale: anyNamed('locale'))),
  );
}
