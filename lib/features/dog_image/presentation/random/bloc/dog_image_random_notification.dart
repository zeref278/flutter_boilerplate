part of 'dog_image_random_bloc.dart';

/// One-shot UI outcomes for the random surface.
///
/// Declared as a `part` of the bloc alongside its event and state, because a
/// notification is bloc-scoped: only [DogImageRandomBloc] emits these. Keeping
/// the union per bloc is what lets the page switch exhaustively without dead
/// arms for outcomes the saved surface owns.
///
/// `equal: false` gives identity equality, so two consecutive identical
/// outcomes are distinct objects and a `listenWhen` comparison fires for both.
/// With value equality the second would be silently swallowed.
@Freezed(equal: false)
sealed class DogImageRandomNotification with _$DogImageRandomNotification {
  factory DogImageRandomNotification.failed({required Failure failure}) =
      DogImageRandomNotificationFailed;
}
