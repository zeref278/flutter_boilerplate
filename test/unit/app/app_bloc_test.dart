import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_bloc_test.mocks.dart';

@GenerateMocks(<Type>[AppPreferences])
void main() {
  late MockAppPreferences preferences;
  late _ControlledAppPreferences controlledPreferences;

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
    seed: () => const AppState(),
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
    seed: () => const AppState(),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.localeChanged('en')),
    expect: () => <Matcher>[],
    verify: (_) =>
        verifyNever(preferences.setLocale(locale: anyNamed('locale'))),
  );

  blocTest<AppBloc, AppState>(
    'surfaces an initial preference read failure as CacheFailure',
    setUp: () => when(preferences.isDarkMode).thenThrow(
      const StorageReadException('preferences unavailable', 'dark_mode'),
    ),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.loaded()),
    expect: () => <Matcher>[
      isA<AppState>().having((s) => s.status, 'status', isA<UILoading>()),
      isA<AppState>().having(
        (s) => (s.status as UILoadFailed).failure,
        'failure',
        isA<CacheFailure>(),
      ),
    ],
  );

  blocTest<AppBloc, AppState>(
    'keeps dark mode unchanged and notifies when persistence fails',
    seed: () => const AppState(status: UIStatus.loadSuccess()),
    setUp: () => when(preferences.setIsDarkMode(darkMode: anyNamed('darkMode')))
        .thenThrow(
          const StorageWriteException('preferences unavailable', 'dark_mode'),
        ),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.darkModeToggled()),
    expect: () => <Matcher>[
      isA<AppState>()
          .having((s) => s.isDarkMode, 'isDarkMode', isFalse)
          .having(
            (s) => s.notification,
            'notification',
            isA<AppNotificationFailed>().having(
              (notification) => notification.failure,
              'failure',
              isA<CacheFailure>(),
            ),
          ),
    ],
  );

  blocTest<AppBloc, AppState>(
    'keeps locale unchanged and notifies when persistence fails',
    seed: () => const AppState(status: UIStatus.loadSuccess()),
    setUp: () =>
        when(preferences.setLocale(locale: anyNamed('locale'))).thenThrow(
          const StorageWriteException('preferences unavailable', 'locale'),
        ),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.localeChanged('vi')),
    expect: () => <Matcher>[
      isA<AppState>()
          .having((s) => s.locale, 'locale', 'en')
          .having(
            (s) => s.notification?.failure,
            'failure',
            isA<CacheFailure>(),
          ),
    ],
  );

  blocTest<AppBloc, AppState>(
    'keeps first-use state and notifies when persistence fails',
    seed: () => const AppState(status: UIStatus.loadSuccess()),
    setUp: () =>
        when(
          preferences.setIsFirstUse(isFirstUse: anyNamed('isFirstUse')),
        ).thenThrow(
          const StorageWriteException(
            'preferences unavailable',
            'is_first_use',
          ),
        ),
    build: () => AppBloc(preferences),
    act: (bloc) => bloc.add(const AppEvent.firstUseCompleted()),
    expect: () => <Matcher>[
      isA<AppState>()
          .having((s) => s.isFirstUse, 'isFirstUse', isTrue)
          .having(
            (s) => s.notification?.failure,
            'failure',
            isA<CacheFailure>(),
          ),
    ],
  );

  blocTest<AppBloc, AppState>(
    'serializes rapid dark-mode toggles so state and storage agree',
    seed: () => const AppState(status: UIStatus.loadSuccess()),
    build: () {
      controlledPreferences = _ControlledAppPreferences();
      return AppBloc(controlledPreferences);
    },
    act: (bloc) async {
      bloc.add(const AppEvent.darkModeToggled());
      await controlledPreferences.firstDarkWriteStarted.future;
      bloc.add(const AppEvent.darkModeToggled());
      await Future<void>.delayed(Duration.zero);

      expect(controlledPreferences.darkWrites, <bool>[true]);
      controlledPreferences.releaseFirstDarkWrite.complete();
      await controlledPreferences.secondDarkWriteStarted.future;
    },
    expect: () => <Matcher>[
      isA<AppState>().having((s) => s.isDarkMode, 'isDarkMode', isTrue),
      isA<AppState>().having((s) => s.isDarkMode, 'isDarkMode', isFalse),
    ],
    verify: (bloc) {
      expect(controlledPreferences.darkWrites, <bool>[true, false]);
      expect(controlledPreferences.darkModeValue, isFalse);
      expect(bloc.state.isDarkMode, isFalse);
    },
  );

  blocTest<AppBloc, AppState>(
    'serializes locale changes so the last user choice is persisted',
    seed: () => const AppState(status: UIStatus.loadSuccess()),
    build: () {
      controlledPreferences = _ControlledAppPreferences();
      return AppBloc(controlledPreferences);
    },
    act: (bloc) async {
      bloc.add(const AppEvent.localeChanged('vi'));
      await controlledPreferences.firstLocaleWriteStarted.future;
      bloc.add(const AppEvent.localeChanged('en'));
      await Future<void>.delayed(Duration.zero);

      expect(controlledPreferences.localeWrites, <String>['vi']);
      controlledPreferences.releaseFirstLocaleWrite.complete();
      await controlledPreferences.secondLocaleWriteStarted.future;
    },
    expect: () => <Matcher>[
      isA<AppState>().having((s) => s.locale, 'locale', 'vi'),
      isA<AppState>().having((s) => s.locale, 'locale', 'en'),
    ],
    verify: (bloc) {
      expect(controlledPreferences.localeWrites, <String>['vi', 'en']);
      expect(controlledPreferences.localeValue, 'en');
      expect(bloc.state.locale, 'en');
    },
  );
}

class _ControlledAppPreferences implements AppPreferences {
  bool darkModeValue = false;
  String localeValue = 'en';
  bool firstUseValue = true;

  final List<bool> darkWrites = <bool>[];
  final List<String> localeWrites = <String>[];
  final Completer<void> firstDarkWriteStarted = Completer<void>();
  final Completer<void> secondDarkWriteStarted = Completer<void>();
  final Completer<void> releaseFirstDarkWrite = Completer<void>();
  final Completer<void> firstLocaleWriteStarted = Completer<void>();
  final Completer<void> secondLocaleWriteStarted = Completer<void>();
  final Completer<void> releaseFirstLocaleWrite = Completer<void>();

  @override
  Future<bool> get isDarkMode async => darkModeValue;

  @override
  Future<String> get locale async => localeValue;

  @override
  Future<bool> get isFirstUse async => firstUseValue;

  @override
  Future<void> setIsDarkMode({required bool darkMode}) async {
    darkWrites.add(darkMode);
    if (darkWrites.length == 1) {
      firstDarkWriteStarted.complete();
      await releaseFirstDarkWrite.future;
    } else {
      secondDarkWriteStarted.complete();
    }
    darkModeValue = darkMode;
  }

  @override
  Future<void> setLocale({required String locale}) async {
    localeWrites.add(locale);
    if (localeWrites.length == 1) {
      firstLocaleWriteStarted.complete();
      await releaseFirstLocaleWrite.future;
    } else {
      secondLocaleWriteStarted.complete();
    }
    localeValue = locale;
  }

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    firstUseValue = isFirstUse;
  }
}
