import 'dart:async';
import 'dart:math' as math;

import 'package:boilerplate/core/ui/app_spacing.dart';
import 'package:flutter/material.dart';

/// What a toast is telling the user, which decides how it is coloured.
enum ToastKind { failure, success, info }

/// A transient message shown in the [Overlay], never on the [Navigator].
///
/// This replaces `another_flushbar`, which shows its bar by pushing a route.
/// A message that occupies a route is a message the back button can dismiss,
/// that `RouteObserver`s see as a navigation, and that a `pop` during its
/// lifetime can pop instead of the page underneath. A notification is not a
/// destination, so it does not belong in the navigation stack.
///
/// It is also not a `SnackBar`. `MaterialApp` does install one root
/// `ScaffoldMessenger`, so snackbars do survive route changes — but showing
/// one still requires a `Scaffold` beneath the messenger, and the app-level
/// listener in `MaterialApp.builder` has none.
///
/// The overlay entry is replaced rather than stacked, so a burst of failures
/// shows the latest instead of a queue the user has to sit through.
abstract final class AppToast {
  static OverlayEntry? _entry;

  /// How long a toast stays before dismissing itself.
  static const Duration visibleDuration = Duration(seconds: 3);

  /// Shows [message], replacing whatever is on screen.
  ///
  /// Uses the root overlay so the toast survives a nested `Navigator` and is
  /// not clipped by the screen that raised it. Does nothing when [context] has
  /// no overlay above it, which is the case in a bare `pumpWidget` — silence
  /// beats throwing from inside a bloc listener.
  static void show(
    BuildContext context,
    String message, {
    ToastKind kind = ToastKind.failure,
    Duration duration = visibleDuration,
  }) {
    final OverlayState? overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    dismiss();

    // The dismisser is scoped to this entry, not to whatever is current.
    // Passing the bare `dismiss` let a dying toast's timer remove its
    // successor: removal goes through setState, so the outgoing State — and
    // its timer — survives until the next frame, and a toast raised inside
    // that window was torn down before it ever appeared. The message it
    // swallowed was always the newest one.
    late final OverlayEntry entry;
    void dismissThisEntry() {
      if (identical(_entry, entry)) dismiss();
    }

    entry = OverlayEntry(
      builder: (_) => _ToastView(
        message: message,
        kind: kind,
        duration: duration,
        onDismissed: dismissThisEntry,
      ),
    );

    _entry = entry;
    overlay.insert(entry);
  }

  /// Removes the current toast, if any. Safe to call when none is showing.
  static void dismiss() {
    final OverlayEntry? entry = _entry;
    _entry = null;
    // remove() before dispose() is the framework's own order. Without the
    // dispose(), every toast leaks the ValueNotifier an OverlayEntry
    // allocates eagerly in its field initializer.
    entry
      ?..remove()
      ..dispose();
  }
}

/// The toast itself: fades and lifts in, and can be swiped away.
class _ToastView extends StatefulWidget {
  const _ToastView({
    required this.message,
    required this.kind,
    required this.duration,
    required this.onDismissed,
  });

  final String message;
  final ToastKind kind;
  final Duration duration;
  final VoidCallback onDismissed;

  @override
  State<_ToastView> createState() => _ToastViewState();
}

class _ToastViewState extends State<_ToastView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 220),
    vsync: this,
  );

  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );

  /// Owned here rather than by [AppToast] so that disposing the tree cancels
  /// it. A timer parked in a static outlives the widget, and every widget
  /// test that raised a toast would then fail teardown with "A Timer is still
  /// pending even after the widget tree was disposed" — inherited by everyone
  /// who builds on this.
  late final Timer _dismissTimer;

  @override
  void initState() {
    super.initState();
    _dismissTimer = Timer(widget.duration, widget.onDismissed);
    _controller.forward();
  }

  @override
  void dispose() {
    _dismissTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final (
      Color background,
      Color foreground,
      IconData icon,
    ) = switch (widget.kind) {
      ToastKind.failure => (
        scheme.errorContainer,
        scheme.onErrorContainer,
        Icons.error_outline,
      ),
      ToastKind.success => (
        scheme.primaryContainer,
        scheme.onPrimaryContainer,
        Icons.check_circle_outline,
      ),
      ToastKind.info => (
        scheme.secondaryContainer,
        scheme.onSecondaryContainer,
        Icons.info_outline,
      ),
    };

    return Positioned(
      left: AppSpacing.space16,
      right: AppSpacing.space16,
      // viewInsets, not just padding: a toast raised while the keyboard is up
      // would otherwise render behind it, which is what SnackBar gets right.
      bottom:
          math.max(
            MediaQuery.viewInsetsOf(context).bottom,
            MediaQuery.paddingOf(context).bottom,
          ) +
          AppSpacing.space24,
      child: _maybeAnimate(
        // liveRegion so a screen reader announces the message. Without it the
        // toast appears and auto-dismisses having told those users nothing —
        // a regression against both SnackBar, which sets it, and a Flushbar
        // route, which took focus. The icon carries the same meaning as the
        // colour for anyone who cannot distinguish the two.
        child: Semantics(
          container: true,
          liveRegion: true,
          onDismiss: widget.onDismissed,
          child: Dismissible(
            key: const ValueKey<String>('app-toast'),
            // Removed by the callback rather than by a parent list rebuilding,
            // so there is nothing to resize away first.
            resizeDuration: null,
            onDismissed: (_) => widget.onDismissed(),
            child: Material(
              color: background,
              borderRadius: BorderRadius.circular(AppSpacing.space12),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                  vertical: AppSpacing.space12,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(icon, color: foreground, size: AppSpacing.space20),
                    AppSpacing.horizontalSpacing12,
                    Expanded(
                      child: Text(
                        widget.message,
                        // Bounded: at a large text scale an unbounded message
                        // grew taller than the screen and was clipped from the
                        // top, hiding the very text it came to show.
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: foreground),
                      ),
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

  /// Skips the entrance animation when the platform asks for reduced motion.
  Widget _maybeAnimate({required Widget child}) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return FadeTransition(
      opacity: _curve,
      // Transform and opacity only: both composite, so the toast never
      // triggers layout on the screen underneath it.
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.35),
          end: Offset.zero,
        ).animate(_curve),
        child: child,
      ),
    );
  }
}
