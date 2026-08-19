import 'package:boilerplate/core/errors/failures.dart';

/// A one-shot app-level notification.
///
/// This deliberately uses identity equality. Two separate failures with the
/// same value must still be presented as two separate notifications.
final class AppNotification {
  AppNotification({required this.failure});

  final Failure failure;
}
