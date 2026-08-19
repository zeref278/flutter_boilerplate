/// Widget keys for the home surface, shared with its widget and integration
/// tests.
///
/// Values are namespaced by surface so a key read in a failing test says which
/// screen it belongs to.
class HomeKeys {
  HomeKeys._();

  static const String scaffold = 'home.scaffold';
  static const String dogImageRandomButton = 'home.dogImageRandomButton';
  static const String dogImageSavedButton = 'home.dogImageSavedButton';
  static const String settingButton = 'home.settingButton';
}
