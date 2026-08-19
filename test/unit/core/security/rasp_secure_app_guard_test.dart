import 'package:boilerplate/core/security/rasp_secure_app_guard.dart';
import 'package:boilerplate/core/security/secure_app_threat.dart';
import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:flutter_secure_app/flutter_secure_app.dart';
import 'package:flutter_test/flutter_test.dart';

class _RecordingCrashlyticsService implements CrashlyticsService {
  final List<Object> exceptions = <Object>[];

  @override
  Future<void> recordException(Object exception, StackTrace? stackTrace) async {
    exceptions.add(exception);
  }
}

void main() {
  late _RecordingCrashlyticsService crashlytics;
  late FlutterSecureApp engine;

  // `isEnabled: false` stops the engine before it reaches a platform channel,
  // but it still installs the callbacks first. That is what lets these tests
  // drive the threat handler directly, with no device and no method channel.
  Future<RaspSecureAppGuard> armedGuard({
    List<String> signatures = const <String>[],
  }) async {
    final RaspSecureAppGuard guard = RaspSecureAppGuard(
      crashlytics: crashlytics,
      isEnabled: false,
      validAndroidSignatures: signatures,
      engine: engine,
    );
    await guard.arm();
    return guard;
  }

  setUp(() {
    crashlytics = _RecordingCrashlyticsService();
    engine = FlutterSecureApp();
  });

  test('reports no threat until the engine detects one', () async {
    final RaspSecureAppGuard guard = await armedGuard();

    expect(guard.threat.value, isNull);
  });

  test('maps every blocking engine threat to an app threat', () async {
    const Map<SecureAppThreatType, SecureAppThreat>
    expected = <SecureAppThreatType, SecureAppThreat>{
      SecureAppThreatType.privilegedAccess: SecureAppThreat.privilegedAccess,
      SecureAppThreatType.simulator: SecureAppThreat.emulator,
      SecureAppThreatType.debug: SecureAppThreat.debugger,
      SecureAppThreatType.appSignature: SecureAppThreat.appSignature,
      SecureAppThreatType.unofficialStore: SecureAppThreat.unofficialStore,
      SecureAppThreatType.deviceBinding: SecureAppThreat.deviceBinding,
      SecureAppThreatType.deviceIdSpoofing: SecureAppThreat.deviceIdSpoofing,
      SecureAppThreatType.sslPinningError: SecureAppThreat.networkInterception,
    };

    for (final MapEntry<SecureAppThreatType, SecureAppThreat> entry
        in expected.entries) {
      final RaspSecureAppGuard guard = await armedGuard();
      engine.onThreatDetected!(entry.key);

      expect(guard.threat.value, entry.value, reason: entry.key.name);
    }
  });

  test('records an internal engine error without blocking the app', () async {
    final RaspSecureAppGuard guard = await armedGuard();

    engine.onThreatDetected!(SecureAppThreatType.codeError);

    expect(guard.threat.value, isNull);
    expect(crashlytics.exceptions, hasLength(1));
    expect(crashlytics.exceptions.single, isA<StateError>());
  });

  test('keeps the first threat when a second one follows', () async {
    final RaspSecureAppGuard guard = await armedGuard();

    engine.onThreatDetected!(SecureAppThreatType.debug);
    engine.onThreatDetected!(SecureAppThreatType.privilegedAccess);

    expect(guard.threat.value, SecureAppThreat.debugger);
  });

  test('arming twice does not reinstall the engine callbacks', () async {
    final RaspSecureAppGuard guard = await armedGuard();
    engine.onThreatDetected = null;

    await guard.arm();

    expect(engine.onThreatDetected, isNull);
  });
}
