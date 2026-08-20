import 'dart:async';

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
/// It is also not a `SnackBar`: `ScaffoldMessenger` is per-`Scaffold`, so the
/// same failure looks different depending on which screen raised it, and a
/// screen without a `Scaffold` cannot show one at all.
///
/// The overlay entry is inserted once, removed on dismiss, and replaced rather
/// than stacked — a burst of failures shows the latest instead of a queue the
/// user has to sit through.
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

    final ThemeData theme = Theme.of(context);
    final OverlayEntry entry = OverlayEntry(
      builder: (_) => _ToastView(
        message: message,
        duration: duration,
        background: _backgroundFor(kind, theme.colorScheme),
        foreground: _foregroundFor(kind, theme.colorScheme),
        onDismissed: dismiss,
      ),
    );

    _entry = entry;
    overlay.insert(entry);
  }

  /// Removes the current toast, if any. Safe to call when none is showing.
  static void dismiss() {
    _entry?.remove();
    _entry = null;
  }

  static Color _backgroundFor(ToastKind kind, ColorScheme scheme) =>
      switch (kind) {
        ToastKind.failure => scheme.errorContainer,
        ToastKind.success => scheme.primaryContainer,
        ToastKind.info => scheme.secondaryContainer,
      };

  static Color _foregroundFor(ToastKind kind, ColorScheme scheme) =>
      switch (kind) {
        ToastKind.failure => scheme.onErrorContainer,
        ToastKind.success => scheme.onPrimaryContainer,
        ToastKind.info => scheme.onSecondaryContainer,
      };
}

/// The toast itself: fades and lifts in, and can be swiped away.
class _ToastView extends StatefulWidget {
  const _ToastView({
    required this.message,
    required this.duration,
    required this.background,
    required this.foreground,
    required this.onDismissed,
  });

  final String message;
  final Duration duration;
  final Color background;
  final Color foreground;
  final VoidCallback onDismissed;

  @override
  State<_ToastView> createState() => _ToastViewState();
}

class _ToastViewState extends State<_ToastView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 220),
    vsync: this,
  )..forward();

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
  }

  @override
  void dispose() {
    _dismissTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    return Positioned(
      left: AppSpacing.space16,
      right: AppSpacing.space16,
      bottom: media.padding.bottom + AppSpacing.space24,
      // Insets come from MediaQuery rather than a nested SafeArea: this is
      // already positioned against the overlay's edge, where a SafeArea has
      // no unconsumed padding left to apply.
      child: FadeTransition(
        opacity: _curve,
        // Transform and opacity only: both composite, so the toast never
        // triggers layout on the screen underneath it.
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.35),
            end: Offset.zero,
          ).animate(_curve),
          child: Dismissible(
            key: const ValueKey<String>('app-toast'),
            onDismissed: (_) => widget.onDismissed(),
            child: Material(
              color: widget.background,
              borderRadius: BorderRadius.circular(AppSpacing.space12),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                  vertical: AppSpacing.space12,
                ),
                child: Text(
                  widget.message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: widget.foreground),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
