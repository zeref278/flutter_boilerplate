part of 'dog_image_saved_bloc.dart';

/// One-shot UI outcomes for the saved surface.
///
/// Declared as a `part` of the bloc alongside its event and state, because a
/// notification is bloc-scoped: only [DogImageSavedBloc] emits these. Keeping
/// the union per bloc is what lets the page switch exhaustively without dead
/// arms for outcomes the random surface owns.
///
/// `equal: false` gives identity equality, so two consecutive identical
/// outcomes are distinct objects and a `listenWhen` comparison fires for both.
/// With value equality the second would be silently swallowed.
///
/// [DogImageSavedNotificationConfirmDelete] is why this is a union rather than
/// a lone failure type: the two outcomes need different widgets, and an
/// exhaustive switch is what forces the page to decide for each.
@Freezed(equal: false)
sealed class DogImageSavedNotification with _$DogImageSavedNotification {
  factory DogImageSavedNotification.failed({required Failure failure}) =
      DogImageSavedNotificationFailed;

  /// Asks the UI to confirm a destructive delete. The answer comes back as
  /// [DogImageSavedDeleteConfirmed]; the bloc never awaits the dialog itself.
  factory DogImageSavedNotification.confirmDelete({
    required DogImageEntity image,
  }) = DogImageSavedNotificationConfirmDelete;
}
