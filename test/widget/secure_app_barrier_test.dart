import 'package:boilerplate/app/view/secure_app_barrier.dart';
import 'package:boilerplate/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpBarrier(
    WidgetTester tester,
    SecureAppThreat threat, {
    String locale = 'en',
  }) => tester.pumpWidget(
    SecureAppBarrier(threat: threat, locale: locale, isDarkMode: false),
  );

  testWidgets('offers no way back into the app', (tester) async {
    await pumpBarrier(tester, SecureAppThreat.privilegedAccess);

    expect(find.text("Can't run here"), findsOneWidget);
    expect(find.byType(ButtonStyleButton), findsNothing);
    expect(find.byType(TextButton), findsNothing);
  });

  testWidgets('describes the environment without naming the check', (
    tester,
  ) async {
    for (final SecureAppThreat threat in <SecureAppThreat>[
      SecureAppThreat.privilegedAccess,
      SecureAppThreat.emulator,
      SecureAppThreat.debugger,
      SecureAppThreat.deviceIdSpoofing,
    ]) {
      await pumpBarrier(tester, threat);

      expect(
        find.text("This device isn't a supported environment for the app."),
        findsOneWidget,
        reason: threat.name,
      );
    }
  });

  testWidgets('points a tampered install back at the store', (tester) async {
    for (final SecureAppThreat threat in <SecureAppThreat>[
      SecureAppThreat.appSignature,
      SecureAppThreat.unofficialStore,
      SecureAppThreat.deviceBinding,
    ]) {
      await pumpBarrier(tester, threat);

      expect(
        find.textContaining('Reinstall it from the official store.'),
        findsOneWidget,
        reason: threat.name,
      );
    }
  });

  testWidgets('blames the network when the connection was intercepted', (
    tester,
  ) async {
    await pumpBarrier(tester, SecureAppThreat.networkInterception);

    expect(find.textContaining("connection isn't private"), findsOneWidget);
  });

  testWidgets('renders in the locale the app was already using', (
    tester,
  ) async {
    await pumpBarrier(tester, SecureAppThreat.emulator, locale: 'vi');

    expect(find.text('Không thể chạy tại đây'), findsOneWidget);
  });
}
