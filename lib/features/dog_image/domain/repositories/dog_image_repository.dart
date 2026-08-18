import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image.dart';
import 'package:fpdart/fpdart.dart';

/// One interface over both the remote API and the local cache. Callers do not
/// know which one answers.
abstract class DogImageRepository {
  Future<Either<Failure, DogImage>> getRandom();

  Future<Either<Failure, Unit>> save(DogImage image);

  Future<Either<Failure, List<DogImage>>> getSaved();

  Future<Either<Failure, Unit>> delete(DogImage image);
}
