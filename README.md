# Flutter Clean Architecture Boilerplate

A feature-first Flutter starter demonstrating BLoC, typed failures, dependency
injection, Retrofit, Drift, encrypted key-value storage, platform keychain
storage, localization, unit/widget tests, and device integration tests.

## Requirements

- [FVM](https://fvm.app/) installed and available on `PATH`
- Android Studio or Xcode for platform builds and device tests

FVM pins Flutter `3.44.9` through `.fvmrc`, so every project command uses the
same Flutter and Dart toolchains.

## Setup

From a clean checkout, one command installs dependencies and generates every
required source file:

```sh
make setup
```

Generated localization, Freezed, JSON, Retrofit, Drift, asset, and Mockito
files are intentionally gitignored. Run `make setup` after cloning, or
`make generate` after changing a generator input. Generated files must not be
committed.

Useful commands:

```sh
make analyze
make test
fvm flutter test --coverage
fvm flutter test integration_test/cases/app_flow_test.dart -d <device-id>
fvm flutter build apk --release
```

The integration suite uses the robot pattern and deliberately exercises the
live dog API. Use `fvm flutter devices` to find a simulator or emulator id.

## Architecture

Dependencies point inward within a feature:

```text
presentation -> domain <- data
```

`core` contains reusable infrastructure and never imports feature
implementations. `Injector` is the explicit composition-root exception: it
imports core, feature, and app modules to assemble the dependency graph.

```text
lib/
├── app/
│   ├── bloc/                 application state
│   ├── di/                   app registrations
│   ├── preferences/          AppPreferences boundary and stored adapter
│   └── view/                 app shell and first-screen director
├── config/
│   ├── env/                  runtime configuration
│   └── routes/               GoRouter routes
├── core/
│   ├── bloc/                 shared BLoC state and observer
│   ├── di/                   module contract and composition root
│   ├── errors/               typed failures and exception mapping
│   ├── network/              Dio configuration
│   ├── services/             logging and crash-reporting boundaries
│   ├── storage/
│   │   ├── database/         Drift database and table declarations
│   │   ├── app_storage.dart  app-facing key-value contract
│   │   ├── encrypted_store.dart
│   │   └── keychain.dart
│   ├── ui/                   themes, dimensions, spacing, and widget keys
│   └── use_cases/            shared use-case contracts
├── features/
│   ├── dog_image/
│   │   ├── data/             data sources, DTO, mapper, repository
│   │   ├── di/               feature registrations
│   │   ├── domain/           entity, repository contract, use cases
│   │   └── presentation/     BLoCs, views, widgets
│   ├── home/presentation/view/
│   ├── intro/presentation/view/
│   └── setting/presentation/view/
├── l10n/                     localization inputs
└── main.dart

integration_test/
├── cases/                    end-to-end flows
└── robot_tester/             reusable screen robots

test/
├── unit/                     logic and persistence tests
└── widget/                   UI behavior tests
```

The dog-image domain uses `DogImageEntity extends Equatable`. Drift keeps its
generated database row type separate, and the data mapper owns all conversion
between transport, database, and domain types.

## Storage roles

Use the narrowest role that matches the data:

| Role | API / engine | Use for |
|---|---|---|
| Relational | `AppDatabase` / Drift | Queryable rows, relationships, sorting, and row-identity operations such as saved dog images. |
| Encrypted key-value | `AppStorage` -> `EncryptedStore` / Hive AES-256 | Preferences, flags, and small cached values that do not need relational queries. Application code injects only `AppStorage`. |
| Credentials | `AppStorage` -> `Keychain` / platform secure storage | Tokens, passwords, and other secrets protected by Android Keystore or iOS Keychain. Add their keys to `StorageKeys.secretKeys`; callers still use `AppStorage`. |

`AppStorageImpl` chooses the backend from the key, so callers never select or
import `EncryptedStore` or `Keychain` directly. App-specific settings sit behind
`AppPreferences`, keeping storage keys out of `AppBloc`.

## Error handling

Data sources may throw. Repositories are the boundary that converts exceptions
to `Either<Failure, T>` through `guard`; use cases pass the result through; BLoCs
render typed failures through localized UI messages. Internal exception text is
not shown to users.

## Tests

- Unit tests cover storage routing and recovery, error mapping, repositories,
  mappers, preferences, and BLoCs.
- Widget tests cover screen selection and interactive UI behavior.
- Integration tests cover first launch, live image loading, persistence, and
  saved-image listing on a real simulator or emulator.

Coverage is measured across authored `lib/` sources; generated `*.g.dart`,
`*.freezed.dart`, Mockito mocks, and `lib/generated/` are excluded from the
authored-code total.
