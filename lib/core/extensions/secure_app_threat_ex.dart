import 'package:boilerplate/core/extensions/build_context_ex.dart';
import 'package:boilerplate/core/security/secure_app_threat.dart';
import 'package:flutter/widgets.dart';

extension SecureAppThreatEx on SecureAppThreat {
  /// What to tell the user about why the app stopped.
  ///
  /// Deliberately vague about which check fired. Naming the exact control
  /// tells whoever is probing the binary precisely which one to defeat next,
  /// and the honest user cannot act on the detail either way.
  String displayMessage(BuildContext context) => switch (this) {
    SecureAppThreat.privilegedAccess ||
    SecureAppThreat.emulator ||
    SecureAppThreat.debugger ||
    SecureAppThreat.deviceIdSpoofing => context.l10n.securityBlockedEnvironment,
    SecureAppThreat.appSignature ||
    SecureAppThreat.unofficialStore ||
    SecureAppThreat.deviceBinding => context.l10n.securityBlockedInstall,
    SecureAppThreat.networkInterception =>
      context.l10n.securityBlockedConnection,
  };
}
