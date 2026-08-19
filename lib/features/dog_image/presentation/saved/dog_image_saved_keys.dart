/// Widget keys for the saved dog-image surface, shared with its widget and
/// integration tests.
///
/// [tile] and [deleteButton] are prefixes: each row appends its image id, so a
/// test can address one row rather than the list.
class DogImageSavedKeys {
  DogImageSavedKeys._();

  static const String scaffold = 'dogImageSaved.scaffold';
  static const String tile = 'dogImageSaved.tile';
  static const String deleteButton = 'dogImageSaved.deleteButton';
  static const String deleteDialog = 'dogImageSaved.deleteDialog';
  static const String deleteCancel = 'dogImageSaved.deleteCancel';
  static const String deleteConfirm = 'dogImageSaved.deleteConfirm';
}
