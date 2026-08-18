import 'dart:async';

import 'package:get_it/get_it.dart';

/// One registration unit. Core modules register before feature modules.
abstract class DiModule {
  const DiModule();

  FutureOr<void> register(GetIt gi);
}
