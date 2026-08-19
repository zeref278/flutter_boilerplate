import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:fpdart/fpdart.dart';

/// One interface over both the remote API and the local cache. Callers do not
/// know which one answers.
abstract class DogImageRepository {
  Future<Either<Failure, DogImageEntity>> getRandom();

  Future<Either<Failure, Unit>> save(DogImageEntity image);

  Future<Either<Failure, List<DogImageEntity>>> getSaved();

  Future<Either<Failure, Unit>> delete(DogImageEntity image);
}
