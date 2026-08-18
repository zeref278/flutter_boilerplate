import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/use_cases/base_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetRandomDogImageUseCase extends BaseUseCaseNoParams<DogImage> {
  const GetRandomDogImageUseCase(this._repository);

  final DogImageRepository _repository;

  @override
  Future<Either<Failure, DogImage>> call() => _repository.getRandom();
}
