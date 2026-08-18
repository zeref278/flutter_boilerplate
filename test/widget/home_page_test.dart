import 'package:boilerplate/core/ui/app_keys.dart';
import 'package:boilerplate/features/home/presentation/view/home_page.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: child,
  );

  testWidgets('shows all three navigation actions', (tester) async {
    await tester.pumpWidget(wrap(const HomePage()));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(WidgetKeys.homeScaffoldKey)), findsOneWidget);
    expect(
      find.byKey(const Key(WidgetKeys.homeDogImageButtonKey)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetKeys.homeSavedImagesButtonKey)),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key(WidgetKeys.homeSettingButtonKey)),
      findsOneWidget,
    );
  });
}
