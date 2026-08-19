import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_random_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/save_dog_image_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  const DogImageEntity image = DogImageEntity(
    id: 7,
    imageUrl: 'https://dog/a.jpg',
  );
  late _RecordingRepository repository;

  setUp(() => repository = _RecordingRepository());

  test('get-random delegates and preserves the repository result', () async {
    repository.randomResult = const Right<Failure, DogImageEntity>(image);

    final result = await GetRandomDogImageUseCase(repository)();

    expect(result, repository.randomResult);
    expect(repository.randomCalls, 1);
  });

  test('get-saved delegates and preserves the repository result', () async {
    repository.savedResult = const Left<Failure, List<DogImageEntity>>(
      CacheFailure(message: 'unavailable'),
    );

    final result = await GetSavedDogImagesUseCase(repository)();

    expect(result, repository.savedResult);
    expect(repository.savedCalls, 1);
  });

  test('save passes the exact entity and preserves the result', () async {
    repository.saveResult = const Right<Failure, Unit>(unit);

    final result = await SaveDogImageUseCase(repository)(image);

    expect(result, repository.saveResult);
    expect(repository.savedImage, same(image));
  });

  test('delete passes the exact entity and preserves the result', () async {
    repository.deleteResult = const Left<Failure, Unit>(
      CacheFailure(message: 'unavailable'),
    );

    final result = await DeleteSavedDogImageUseCase(repository)(image);

    expect(result, repository.deleteResult);
    expect(repository.deletedImage, same(image));
  });
}

class _RecordingRepository implements DogImageRepository {
  Either<Failure, DogImageEntity> randomResult =
      const Left<Failure, DogImageEntity>(
        UnknownFailure(message: 'not configured'),
      );
  Either<Failure, List<DogImageEntity>> savedResult =
      const Right<Failure, List<DogImageEntity>>(<DogImageEntity>[]);
  Either<Failure, Unit> saveResult = const Right<Failure, Unit>(unit);
  Either<Failure, Unit> deleteResult = const Right<Failure, Unit>(unit);
  int randomCalls = 0;
  int savedCalls = 0;
  DogImageEntity? savedImage;
  DogImageEntity? deletedImage;

  @override
  Future<Either<Failure, DogImageEntity>> getRandom() async {
    randomCalls++;
    return randomResult;
  }

  @override
  Future<Either<Failure, List<DogImageEntity>>> getSaved() async {
    savedCalls++;
    return savedResult;
  }

  @override
  Future<Either<Failure, Unit>> save(DogImageEntity image) async {
    savedImage = image;
    return saveResult;
  }

  @override
  Future<Either<Failure, Unit>> delete(DogImageEntity image) async {
    deletedImage = image;
    return deleteResult;
  }
}
