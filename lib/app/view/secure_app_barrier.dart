import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// The screen shown instead of the app when the integrity checks fail.
///
/// It is a dead end on purpose. There is no retry, because nothing the user
/// can do from inside a compromised runtime would change the answer, and no
/// exit button, because Apple's guidelines treat an app that terminates
/// itself as a crash. The user closes it the way they close anything else.
///
/// Self-contained rather than a layer over the router: a blocked app must not
/// build its navigation stack at all, so this replaces the shell instead of
/// covering it.
class SecureAppBarrier extends StatelessWidget {
  const SecureAppBarrier({
    required this.threat,
    required this.locale,
    required this.isDarkMode,
    super.key,
  });

  final SecureAppThreat threat;
  final String locale;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(locale),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.gpp_maybe_outlined,
                      size: AppSpacing.space48,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    AppSpacing.verticalSpacing16,
                    Text(
                      context.l10n.securityBlockedTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    AppSpacing.verticalSpacing8,
                    Text(
                      threat.displayMessage(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
