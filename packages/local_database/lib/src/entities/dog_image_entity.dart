import 'package:floor/floor.dart';

@entity
class DogImageEntity {
  @primaryKey
  final String message;

  final String status;

  DogImageEntity(this.message, this.status);
}
