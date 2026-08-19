import 'package:boilerplate/core/security/secure_app_guard.dart';
import 'package:boilerplate/core/security/secure_app_threat.dart';
import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_app/flutter_secure_app.dart';

/// [SecureAppGuard] backed by `flutter_secure_app`'s RASP engine.
///
/// The individual checks are disabled in debug builds by design: a debugger is
/// attached, the simulator is the usual target, and the APK is signed with the
/// debug key — arming them would block every development launch.
///
/// [isEnabled] is what actually decides whether the engine runs, and the
/// composition root passes production-only. A boilerplate that armed RASP
/// everywhere would be turned off wholesale by the first team that hit it,
/// which is worse than arming it exactly where it earns its keep.
class RaspSecureAppGuard implements SecureAppGuard {
  RaspSecureAppGuard({
    required this.crashlytics,
    required this.isEnabled,
    required this.validAndroidSignatures,
    @visibleForTesting FlutterSecureApp? engine,
  }) : _engine = engine ?? FlutterSecureApp();

  /// Where a failed check, or a failure of the checking itself, is reported.
  final CrashlyticsService crashlytics;

  final FlutterSecureApp _engine;

  /// Whether the checks run at all.
  final bool isEnabled;

  /// SHA-256 fingerprints of the Android signing certificates this build
  /// accepts. Empty means the signature comparison cannot decide, and the
  /// check passes.
  final List<String> validAndroidSignatures;

  final ValueNotifier<SecureAppThreat?> _threat =
      ValueNotifier<SecureAppThreat?>(null);

  bool _isArmed = false;

  @override
  ValueListenable<SecureAppThreat?> get threat => _threat;

  @override
  Future<void> arm() async {
    if (_isArmed) return;
    _isArmed = true;

    await _engine.init(
      isEnabled: isEnabled,
      // Drives the store-provenance rules the engine applies, so it tracks
      // the build flavor rather than the debug/release compilation mode.
      isProdEnv: isEnabled,
      validAndroidSignatures: validAndroidSignatures,
      checkJailbreakOrHooking: !kDebugMode,
      checkEmulator: !kDebugMode,
      checkDebugger: !kDebugMode,
      // Only meaningful against a real signing certificate; without one to
      // compare to, arming it would reject every build.
      checkAppSignature: !kDebugMode && validAndroidSignatures.isNotEmpty,
      // Off by default: sideloading is how QA installs a build, and internal
      // distribution tracks would all read as unofficial.
      checkOfficialStore: false,
      checkDeviceBinding: !kDebugMode,
      checkDeviceIdSpoofing: !kDebugMode,
      onThreatDetected: _onThreatDetected,
      onException: crashlytics.recordException,
    );
  }

  void _onThreatDetected(SecureAppThreatType type) {
    final SecureAppThreat? threat = _toThreat(type);
    // `codeError` reaches here when a check itself failed rather than when it
    // found something. Blocking on it would let a bug inside the RASP engine
    // brick every install — a worse outcome than the tampering it looks for —
    // so it is recorded and the app keeps running.
    if (threat == null) {
      crashlytics.recordException(
        StateError('Secure app check failed internally: $type'),
        StackTrace.current,
      );
      return;
    }
    // First violation wins. A later one adds nothing: the app is already
    // blocked, and swapping the message would only churn the screen.
    _threat.value ??= threat;
  }

  static SecureAppThreat? _toThreat(SecureAppThreatType type) => switch (type) {
    SecureAppThreatType.privilegedAccess => SecureAppThreat.privilegedAccess,
    SecureAppThreatType.simulator => SecureAppThreat.emulator,
    SecureAppThreatType.debug => SecureAppThreat.debugger,
    SecureAppThreatType.appSignature => SecureAppThreat.appSignature,
    SecureAppThreatType.unofficialStore => SecureAppThreat.unofficialStore,
    SecureAppThreatType.deviceBinding => SecureAppThreat.deviceBinding,
    SecureAppThreatType.deviceIdSpoofing => SecureAppThreat.deviceIdSpoofing,
    SecureAppThreatType.sslPinningError => SecureAppThreat.networkInterception,
    SecureAppThreatType.codeError => null,
  };
}
