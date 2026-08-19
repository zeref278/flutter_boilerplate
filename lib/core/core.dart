/// The public surface of `core`, for features and the app shell.
///
/// A feature imports this one file instead of a dozen paths, so moving a file
/// inside `core` never edits a feature.
///
/// This is a curated export list, not `export everything`. Anything absent is
/// absent on purpose:
///
/// - `EncryptedStore`, `Keychain`, `AppStorageImpl`, `HiveEncryptedStore` —
///   application code injects only `AppStorage`, which picks the backend from
///   the key. Exporting the backends would make that boundary a convention
///   rather than something the imports enforce.
/// - `CoreModule`, `createDio`, `AppBlocObserver`, `LogService`,
///   `CrashlyticsService` — composition-root wiring, reached by `bootstrap`
///   and the DI modules directly.
/// - `RaspSecureAppGuard`, `RaspNetworkSecurity` — the only two files that
///   name the security vendor. Callers are handed a `SecureAppGuard` and a
///   `NetworkSecurity`, so swapping the vendor does not reach them.
///
/// Nothing inside `core` may import this file: `core` parts import each other
/// by path, so no cycle can form. Tests also import by path, because they
/// deliberately reach the internals this list omits.
///
/// `AppDatabase` is absent because it does not live in `core` at all: a Drift
/// schema must name every feature table it holds, so it sits in
/// `lib/database/` beside the module list. Import it directly, as `db`.
library;

export 'bloc/ui_status.dart';
export 'di/di_module.dart';
export 'di/injector.dart';
export 'errors/failures.dart';
export 'errors/guard.dart';
export 'extensions/build_context_ex.dart';
export 'extensions/failure_ex.dart';
export 'extensions/secure_app_threat_ex.dart';
export 'network/auth_tokens.dart';
export 'security/network_security.dart';
export 'security/secure_app_guard.dart';
export 'security/secure_app_threat.dart';
export 'storage/app_storage.dart';
export 'storage/storage_exception.dart';
export 'storage/storage_keys.dart';
export 'ui/app_spacing.dart';
export 'ui/app_themes.dart';
export 'use_cases/base_use_case.dart';
