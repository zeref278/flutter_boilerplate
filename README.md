<div align="center">
<a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"/></a>

<a href="https://github.com/zeref278"><img alt="GitHub: zeref278" src="https://img.shields.io/github/followers/zeref278?label=Follow&style=social" /></a>
<a href="https://github.com/zeref278/flutter_boilerplate"><img src="https://img.shields.io/github/stars/zeref278/flutter_boilerplate?style=social" /></a>

<a href="https://www.buymeacoffee.com/zeref278" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>


</div>

# Flutter Boilerplate Project

A boilerplate project created in flutter using Bloc, Retrofit. Depend on code generation.
## Features

* State management and examples
* Api integration and examples
* Local database and examples
* Code generation
* Local storage
* Logging
* Routing
* Dependency Injection
* Crashlytics template
* DarkTheme
* Multi languages
* Unit tests
* Integration test
* Clean architecture
* Flutter CI

Some packages: 
  - [Freezed](https://pub.dev/packages/freezed)
  - [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
  - [Flutter gen](https://pub.dev/packages/flutter_gen)
  - [Retrofit](https://pub.dev/packages/retrofit)
  - [Dio](https://pub.dev/packages/retrofit)
  - [Bloc test](https://pub.dev/packages/bloc_test) 
  - [Mockito](https://pub.dev/packages/mockito)
  - [Go router](https://pub.dev/packages/go_router)
  - [Dependency Injection](https://github.com/fluttercommunity/get_it)
  - [Logger](https://pub.dev/packages/logger)
  - [Floor](https://pub.dev/packages/floor)
  - [SharedPreferences](https://pub.dev/packages/shared_preferences)


## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

### Up-Coming Features:

* Handle multi bloc event in the same time by bloc concurrency example
* Load more infinite list using bloc example
* Authentication template

## Architecture
<img src="https://raw.githubusercontent.com/zeref278/flutter_boilerplate/main/readme_attach/architecture.png" width="700"/>

## How to Use 
**Step 1:**

Fork, download or clone this repo by using the link below:

```
https://github.com/zeref278/flutter_boilerplate.git
```

**Step 2:**
Go to project root and execute the following command in terminal to get the required dependencies and generate languages, freezed, flutter gen: 

```cmd
flutter pub get
flutter pub run intl_utils:generate
flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 3:**
Go to `/packages/rest_client` and execute the following command in terminal to generate model and api client: 

```cmd
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

**Whenever change freezed file, assets, api**

Run command
```cmd
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

## Folder structure
```
flutter_boilerplate/
|- assets/                    (assets)
|- lib/
  |- configs/                 (flavor config)
  |- core/                    (bloc observer, theme,...)
  |- data/                    (repository)
  |- features/                (features page)
  |- generated/               (code generation includes localization and assets generation)
  |- injector/                (dependencies injector)
  |- l10n/                    (localization resources
  |- router/                  (routing)
  |- services/                (app services)
  |- utils/                   (app utils)
|- packages/
  |- rest_client/             (api client)
  |- local_database/          (local database)
|- integration_test
|- test/
  |- dependencies/                (mock dependencies)
  |- features/                (bloc test features)

```

## [Freezed](https://pub.dev/packages/freezed): 
### Create a immutable Model with any features available
- Define a `constructor` + the `properties`
- Override `toString`, operator `==`, hashCode
- Implement a `copyWith` method to clone the object
- Handling `de/serialization`
### Example
```dart
part 'dog_image.freezed.dart';
part 'dog_image.g.dart';

@Freezed(fromJson: true)
class DogImage with _$DogImage {
  const factory DogImage({
    required String message,
    required String status,
  }) = _DogImage;

  factory DogImage.fromJson(Map<String, dynamic> json) =>
      _$DogImageFromJson(json);
}
```
### Implement
```dart
final DogImage dogImage = DogImage.fromJson(json);
///
final DogImage dogImage = dogImage.copyWith(status: 'failed');
/// Deep copy, equal operator ...
...
```

## [Retrofit]((https://pub.dev/packages/retrofit)):
### Create a api client by code generation, you do not need to implement each request manually
### Example
```dart
part 'dog_api.g.dart';

@RestApi()
abstract class DogApiClient {
  factory DogApiClient(Dio dio, {String baseUrl}) = _DogApiClient;

  @GET('/breeds/image/random')
  Future<DogImage> getDogImageRandom();
}
```
Generate to
```dart
  ///
  @override
  Future<DogImage> getDogImageRandom() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<DogImage>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/breeds/image/random',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DogImage.fromJson(_result.data!);
    return value;
  }
```
And this api client will use the `baseUrl` from a Dio injector
```dart
injector.registerLazySingleton<Dio>(
  () {
  /// TODO: custom DIO here
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
      ),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          request: false,
        ),
      );
    }
    return dio;
  },
  instanceName: dioInstance,
);

injector.registerFactory<DogApiClient>(
  () => DogApiClient(
    injector(instanceName: dioInstance),
  ),
);
```

## Mockito and Bloc tests:
If a bloc that you want to test have a required dependencies, you must add it into annotations `@GenerateMocks` in `/test/app_test/app_test.dart`:
```dart
@GenerateMocks([
  DogImageRandomRepository,
  LogService,

  /// TODO
])
void main() {}
```
Run the following command to generate a mock dependency
```cmd
flutter pub run build_runner build --delete-conflicting-outputs
```

Write a test file:
```dart
setUp(() {
    bloc = DogImageRandomBloc(
      dogImageRandomRepository: repository,
      logService: logService,
    );
  });

  group('test add event [DogImageRandomRandomRequested]', () {
    blocTest(
      'emit state when success',
      setUp: () {
        when(repository.getDogImageRandom())
            .thenAnswer((_) => Future<DogImage>.value(image));
      },
      build: () => bloc,
      act: (_) => bloc.add(
        const DogImageRandomRandomRequested(),
      ),
      expect: () => [
        isA<DogImageRandomState>().having(
          (state) => state.status,
          'status',
          UIStatus.loading,
        ),
        isA<DogImageRandomState>()
            .having(
              (state) => state.status,
              'status',
              UIStatus.loadSuccess,
            )
            .having(
              (state) => state.dogImage,
              'image',
              image,
            ),
      ],
    );

    blocTest(
      'emit state when failed',
      setUp: () {
        when(repository.getDogImageRandom()).thenThrow(Exception('error'));
      },
      build: () => bloc,
      seed: () => const DogImageRandomState(dogImage: image),
      act: (_) => bloc.add(
        const DogImageRandomRandomRequested(),
      ),
      expect: () => [
        isA<DogImageRandomState>().having(
          (state) => state.status,
          'status',
          UIStatus.loading,
        ),
        isA<DogImageRandomState>()
            .having(
              (state) => state.status,
              'status',
              UIStatus.actionFailed,
            )
            .having(
              (state) => state.dogImage,
              'image',
              image,
            ),
      ],
    );
  });
```

## If you want to understand architecture or any packages used in this project, you can create a discussion on github repo.
## And feel free to create a pull request !





