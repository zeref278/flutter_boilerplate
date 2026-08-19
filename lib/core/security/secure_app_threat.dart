/// A runtime integrity violation that makes the app unsafe to keep running.
///
/// This is the app's own vocabulary, not the RASP package's. Nothing above
/// `core/security` names `flutter_secure_app`, on the same principle that
/// nothing above `core/storage` names Hive: the vendor is an implementation
/// detail of one file, and swapping it must not reach the UI.
///
/// Every value here blocks. The package also reports an internal-error case,
/// which deliberately has no member: see `SecureAppGuard`.
enum SecureAppThreat {
  /// Rooted, jailbroken, or actively hooked by an instrumentation framework.
  privilegedAccess,

  /// Running on an emulator or simulator rather than real hardware.
  emulator,

  /// A debugger is attached to the process.
  debugger,

  /// The signing certificate does not match one this build accepts —
  /// the app was repackaged and resigned.
  appSignature,

  /// Installed from somewhere other than a recognized app store.
  unofficialStore,

  /// The install was cloned, or its data was migrated onto another device.
  deviceBinding,

  /// The reported device identity has been manipulated.
  deviceIdSpoofing,

  /// Certificate pinning rejected a connection — traffic is being
  /// intercepted.
  networkInterception,
}
