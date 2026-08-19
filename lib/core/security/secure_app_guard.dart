import 'package:boilerplate/core/security/secure_app_threat.dart';
import 'package:flutter/foundation.dart';

/// Watches the device and the app binary for tampering, and reports the first
/// violation it finds.
///
/// [threat] is a listenable rather than a callback so the shell can render the
/// block from whatever state it is already in. A threat found before
/// `runApp` is already in the notifier by the time the first frame builds,
/// which is why no navigator key or post-frame retry is needed here.
///
/// A threat is terminal: [threat] never returns to null. There is no
/// recovery path, because every case means the runtime cannot be trusted to
/// report its own recovery honestly.
abstract class SecureAppGuard {
  /// The violation that blocked the app, or null while it is trusted.
  ValueListenable<SecureAppThreat?> get threat;

  /// Starts the checks. Safe to call more than once; later calls do nothing.
  Future<void> arm();
}

/// A guard that finds nothing, for tests and for builds with RASP disabled.
class PermissiveSecureAppGuard implements SecureAppGuard {
  PermissiveSecureAppGuard();

  final ValueNotifier<SecureAppThreat?> _threat =
      ValueNotifier<SecureAppThreat?>(null);

  @override
  ValueListenable<SecureAppThreat?> get threat => _threat;

  @override
  Future<void> arm() async {}
}
