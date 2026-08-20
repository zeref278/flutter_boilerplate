# Changelog

## 2.0.0

Breaking. Nothing from `1.1.0` resolves against this tree — every import path
moved. Fork it fresh rather than upgrading in place.

### Breaking

- Restructured to `lib/config`, `lib/core`, `lib/features`, `lib/database`,
  `lib/di`. The former `lib/configs`, `lib/core/bloc_core`, `lib/data`,
  `lib/injector`, and `lib/services` are gone as locations.
- Removed the `packages/rest_client` and `packages/local_database`
  sub-packages; both are inlined under `lib/`.
- Removed the `web/` target. Android and iOS only.
- Minimum toolchain is now Flutter 3.44.9 / Dart 3.12.
- Removed `another_flushbar`. Transient messages go through `AppToast`.
- Removed `pretty_dio_logger`, which printed the `Authorization` header
  verbatim. `LoggingInterceptor` replaces it.

### Added

- Compile-time configuration with `envied`: one `.env` per flavor, baked in at
  code-generation time. `AppConfig.verifyFlavor` fails at launch when the
  compiled-in environment disagrees with the `--flavor` used to build.
- `dev` and `production` flavors scaffolded natively by `flutter_flavorizr`.
- Runtime integrity checks (`flutter_secure_app`) behind `SecureAppGuard`,
  armed for the production flavor only, with a dead-end block screen.
- SPKI and certificate pinning, plus an anti-proxy HTTP adapter.
  Misconfiguration fails during startup rather than silently pinning nothing.
- `AuthInterceptor` with single-flight token refresh and single-flight session
  teardown; `LoggingInterceptor` that redacts credential headers and query
  parameters and does not log bodies unless asked.
- `AppToast`: transient messages in the `Overlay`, never on the `Navigator`.
- `make rename NAME= ORG= DISPLAY=` — one command for pubspec, Dart imports,
  Android namespace and applicationId, the Kotlin package, and `flavorizr.yaml`.
- Release signing from a gitignored `key.properties`.
- `AGENTS.md` / `CLAUDE.md` conventions, an 80% authored-coverage gate, and CI
  that enforces `dart analyze --fatal-infos`.

### Known gaps

- No crash backend is wired; `LogCrashlyticsService` forwards to a logger whose
  default filter drops everything in release.
- `VALID_ANDROID_SIGNATURES` and `SPKI_SHA256_HASHES` ship empty. Fill both
  before shipping — an empty signature list passes for a resigned APK.
- A production release with no `key.properties` falls back to the debug signing
  key with a printed warning rather than failing.

## 1.1.0 and earlier

See the release history on GitHub.
