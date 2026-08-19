import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension BuildContextEx on BuildContext {
  /// Localized strings for this context.
  ///
  /// `context.l10n.homeTitle` rather than
  /// `AppLocalizations.of(context).homeTitle`, so a widget reads as one
  /// expression and no screen imports the generated class directly.
  ///
  /// Throws if no [AppLocalizations] delegate sits above this context. That is
  /// a wiring bug rather than a runtime condition: the app installs
  /// `AppLocalizations.localizationsDelegates` at its root, and a widget test
  /// that renders localized text must do the same.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
