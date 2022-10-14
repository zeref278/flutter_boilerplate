import 'package:floor/floor.dart';
import 'package:local_database/src/entities/dog_image_entity.dart';

@dao
abstract class DogImageDao {
  @Query('SELECT * FROM DogImageEntity')
  Future<List<DogImageEntity>> findAllPersons();

  @Query('SELECT * FROM Person WHERE message = :url')
  Stream<DogImageEntity?> findPersonById(String url);

  @insert
  Future<void> insertPerson(DogImageEntity dogImageEntity);
}