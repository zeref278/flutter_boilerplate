import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/extensions/build_context_ex.dart';
import 'package:boilerplate/core/extensions/failure_ex.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UnknownFailure.message never leaks internal exception text', (
    WidgetTester tester,
  ) async {
    late BuildContext capturedContext;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (BuildContext context) {
            capturedContext = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    const Failure failure = UnknownFailure(
      message: 'Bad state: internal detail',
    );
    final String displayed = failure.displayMessage(capturedContext);

    expect(displayed, isNot(contains('internal detail')));
    expect(displayed, capturedContext.l10n.errorUnexpected);
  });
}
