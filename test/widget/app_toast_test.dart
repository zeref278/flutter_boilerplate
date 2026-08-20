import 'package:boilerplate/core/ui/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Counts pushes and pops so a test can prove a toast is not a route.
class _CountingObserver extends NavigatorObserver {
  int pushes = 0;
  int pops = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => pushes++;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => pops++;
}

void main() {
  late _CountingObserver observer;

  /// Pumps an app whose single screen exposes a button that raises a toast.
  Future<BuildContext> pumpHost(WidgetTester tester) async {
    late BuildContext captured;
    observer = _CountingObserver();

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: <NavigatorObserver>[observer],
        home: Builder(
          builder: (context) {
            captured = context;
            return const Scaffold(body: SizedBox.expand());
          },
        ),
      ),
    );
    return captured;
  }

  tearDown(AppToast.dismiss);

  testWidgets('shows the message it was given', (tester) async {
    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'Could not reach the server.');
    await tester.pump();

    expect(find.text('Could not reach the server.'), findsOneWidget);
  });

  testWidgets('does not push a route', (tester) async {
    // The reason this exists. another_flushbar shows its bar by pushing a
    // route, so the back button dismissed it, RouteObservers saw it as a
    // navigation, and a pop during its lifetime popped the bar rather than
    // the page. An overlay entry is not a destination.
    final BuildContext context = await pumpHost(tester);
    final int pushesBefore = observer.pushes;

    AppToast.show(context, 'anything');
    await tester.pump();

    expect(observer.pushes, pushesBefore);
    expect(observer.pops, 0);
  });

  testWidgets('replaces the previous toast rather than stacking', (
    tester,
  ) async {
    // A burst of failures should leave the latest on screen, not a queue the
    // user has to sit through.
    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'first');
    await tester.pump();
    AppToast.show(context, 'second');
    await tester.pump();

    expect(find.text('first'), findsNothing);
    expect(find.text('second'), findsOneWidget);
  });

  testWidgets('dismisses itself when its time is up', (tester) async {
    final BuildContext context = await pumpHost(tester);

    AppToast.show(
      context,
      'transient',
      duration: const Duration(milliseconds: 500),
    );
    await tester.pump();
    expect(find.text('transient'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();

    expect(find.text('transient'), findsNothing);
  });

  testWidgets('leaves no timer pending when the tree is disposed', (
    tester,
  ) async {
    // The timer lives on the toast's State, so tearing down the tree cancels
    // it. Parked in a static it would outlive the widget and fail every
    // widget test that raised a toast.
    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'still visible at teardown');
    await tester.pump();

    await tester.pumpWidget(const SizedBox.shrink());
    // The test framework asserts on pending timers after this returns; the
    // absence of a failure here is the assertion.
  });

  testWidgets('stays silent when there is no overlay to show it in', (
    tester,
  ) async {
    late BuildContext bare;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) {
            bare = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    // Throwing from inside a bloc listener would be worse than showing
    // nothing, so this is a deliberate no-op rather than an error.
    expect(() => AppToast.show(bare, 'nowhere to go'), returnsNormally);
    await tester.pump();
    expect(find.text('nowhere to go'), findsNothing);
  });

  testWidgets('a dying toast does not take its successor with it', (
    tester,
  ) async {
    // The stale-timer race. Removal goes through setState, so the outgoing
    // State — and its timer — survives until the next frame. With a dismisser
    // scoped to "whatever is current", that timer removed the toast raised
    // inside the window, and the message it swallowed was the newest one.
    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'first', duration: const Duration(seconds: 1));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 990));

    AppToast.show(context, 'second');
    await tester.pump(const Duration(milliseconds: 20));

    expect(find.text('second'), findsOneWidget);
    expect(find.text('first'), findsNothing);
  });

  testWidgets('swipe dismisses it', (tester) async {
    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'swipe me');
    await tester.pumpAndSettle();

    await tester.drag(find.text('swipe me'), const Offset(500, 0));
    await tester.pumpAndSettle();

    expect(find.text('swipe me'), findsNothing);
    // The entry is gone, so a later dismiss must not touch a removed entry.
    expect(AppToast.dismiss, returnsNormally);
  });

  testWidgets('sits above the keyboard rather than behind it', (tester) async {
    // What SnackBar gets right and a naive bottom offset does not. The insets
    // go on the test view, not on a MediaQuery inside `home`: the toast is
    // inserted into the *root* overlay, which sits above anything `home`
    // wraps, so it reads the root MediaQuery either way.
    tester.view
      ..devicePixelRatio = 1
      ..physicalSize = const Size(400, 600)
      ..viewInsets = const FakeViewPadding(bottom: 300);
    addTearDown(tester.view.reset);

    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'above the keyboard');
    await tester.pumpAndSettle();

    final double toastBottom = tester
        .getRect(find.text('above the keyboard'))
        .bottom;
    expect(toastBottom, lessThan(600 - 300));
  });

  testWidgets('announces itself to a screen reader', (tester) async {
    // Without a live region the toast appears and auto-dismisses having told
    // these users nothing — a regression against both mechanisms it replaced.
    final BuildContext context = await pumpHost(tester);

    AppToast.show(context, 'announce me');
    await tester.pumpAndSettle();

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Semantics && widget.properties.liveRegion == true,
      ),
      findsOneWidget,
    );
  });

  testWidgets('dismiss is safe when nothing is showing', (tester) async {
    expect(AppToast.dismiss, returnsNormally);
  });
}
