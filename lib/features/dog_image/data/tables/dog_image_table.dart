import 'package:drift/drift.dart';

/// Saved dog images.
///
/// The primary key is a synthetic auto-increment id, never the image URL —
/// the same image may be saved twice, and the delete path needs row identity.
class DogImages extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text()();

  TextColumn get status => text()();
}
