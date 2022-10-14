# Flutter Boilerplate Project

A boilerplate project created in flutter using Bloc, Retrofit. Depend on generate code packages to save many times in duplicated code.
Some packages: 
  - [Freezed](https://pub.dev/packages/freezed): generate model, json serialization and gen bloc event, state
  - [Flutter Bloc](https://pub.dev/packages/flutter_bloc): state management
  - [Flutter gen](https://pub.dev/packages/flutter_gen): manage assets without hardcode asset path
  - [Retrofit](https://pub.dev/packages/retrofit) and [Dio](https://pub.dev/packages/retrofit): intergrate api
  - [Bloc test](https://pub.dev/packages/bloc_test) and [Mockito](https://pub.dev/packages/mockito): bloc testing
  - [Go router](https://pub.dev/packages/go_router): app navigation
  - [Dependency Injection](https://github.com/fluttercommunity/get_it)
  - [Logger](https://pub.dev/packages/logger)
  - [Crashlytics template]
  - [DarkTheme]
  - [Multi languages]

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

### Up-Coming Features:

* Flavor config
* Local database support
* Handle multi bloc event in the same time by bloc concurrency
* Load more infinite list using bloc

## How to Use 
**Step 1:**

Fork, download or clone this repo by using the link below:

```
https://github.com/zeref278/flutter_boilerplate.git
```

**Step 2:**
Go to project root and execute the following command in terminal to get the required dependencies and generate languages, freezed, flutter gen: 

```
flutter pub get
flutter pub run intl_utils:generate
flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 3:**
Go to /packages/rest_client and execute the following command in terminal to generate model and api client: 

```
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 3:**
Go to /packages/rest_client and execute the following command in terminal to generate model and api client: 

**Whenever change freezed file, assets, api**
Run command
```
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```


