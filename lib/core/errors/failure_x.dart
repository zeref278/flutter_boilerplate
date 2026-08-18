import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/widgets.dart';

extension FailureX on Failure {
  /// Localized, user-facing text. Only `ServerFailure` surfaces a
  /// server-supplied message; internal exception text is never shown.
  ///
  /// Named `displayMessage` rather than `message`: every `Failure` variant
  /// already exposes an instance getter `message` (freezed hoists it because
  /// it is common to all constructors — see `failures.freezed.dart`), and an
  /// extension member with the same name as an instance member is always
  /// shadowed by it. `failure.message(context)` would silently resolve to
  /// the `String` getter and then fail to invoke it as a function.
  String displayMessage(BuildContext context) {
    final S s = S.of(context);
    return switch (this) {
      NetworkFailure() => s.error_no_connection,
      TimeoutFailure() => s.error_timeout,
      NotFoundFailure() => s.load_failed,
      UnauthorizedFailure() => s.load_failed,
      CacheFailure() => s.error_storage,
      ServerFailure(:final message) => message,
      UnknownFailure() => s.error_unexpected,
    };
  }

  /// Whether offering the user a retry makes sense.
  bool get isRetryable => this is NetworkFailure || this is TimeoutFailure;
}
