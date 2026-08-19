import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/extensions/build_context_ex.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension FailureEx on Failure {
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
    final AppLocalizations l10n = context.l10n;
    return switch (this) {
      NetworkFailure() => l10n.errorNoConnection,
      TimeoutFailure() => l10n.errorTimeout,
      NotFoundFailure() => l10n.errorLoadFailed,
      UnauthorizedFailure() => l10n.errorLoadFailed,
      CacheFailure() => l10n.errorStorage,
      ServerFailure(:final message) => message,
      UnknownFailure() => l10n.errorUnexpected,
    };
  }

  /// Whether offering the user a retry makes sense.
  bool get isRetryable => this is NetworkFailure || this is TimeoutFailure;
}
