import 'package:boilerplate/features/home/presentation/home_keys.dart';
import 'package:boilerplate/features/home/presentation/view/home_page.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  );

  testWidgets('shows all three navigation actions', (tester) async {
    await tester.pumpWidget(wrap(const HomePage()));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(HomeKeys.scaffold)), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(
      find.byKey(const Key(HomeKeys.dogImageRandomButton)),
      findsOneWidget,
    );
    expect(find.byKey(const Key(HomeKeys.dogImageSavedButton)), findsOneWidget);
    expect(find.byKey(const Key(HomeKeys.settingButton)), findsOneWidget);
  });
}
