import 'package:boilerplate/bootstrap.dart';

/// The single entry point.
///
/// There is no `main_dev.dart` / `main_production.dart` pair: configuration is
/// compiled in by `envied` before the build starts, so no entry point has a
/// flavor decision left to make. `--flavor` selects only the native target.
Future<void> main() => bootstrap();
