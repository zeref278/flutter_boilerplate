part of 'app_bloc.dart';

/// One-shot app-level UI outcomes.
///
/// Declared as a `part` of the bloc alongside its event and state, because a
/// notification is bloc-scoped: only [AppBloc] emits these, and only the app
/// shell presents them.
///
/// `equal: false` gives identity equality, so two consecutive identical
/// outcomes are distinct objects and a `listenWhen` comparison fires for both.
/// With value equality the second would be silently swallowed.
///
/// One variant today because every [AppBloc] handler fails the same way: a
/// preference write threw. The union is the extension point — a second
/// outcome that needs a different widget is one factory here plus one arm in
/// the shell's exhaustive switch.
@Freezed(equal: false)
sealed class AppNotification with _$AppNotification {
  factory AppNotification.failed({required Failure failure}) =
      AppNotificationFailed;
}
