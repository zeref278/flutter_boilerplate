import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/widgets.dart';

extension FailureX on Failure {
  /// Localized, user-facing text. Never surfaces `toString()` of an exception.
  String message(BuildContext context) {
    final S s = S.of(context);
    return switch (this) {
      NetworkFailure() => s.load_failed,
      TimeoutFailure() => s.load_failed,
      NotFoundFailure() => s.load_failed,
      UnauthorizedFailure() => s.load_failed,
      CacheFailure() => s.didnt_supported,
      ServerFailure(:final message) => message,
      UnknownFailure(:final message) => message,
    };
  }

  /// Whether offering the user a retry makes sense.
  bool get isRetryable => this is NetworkFailure || this is TimeoutFailure;
}
