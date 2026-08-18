import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/use_cases/base_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSavedDogImagesUseCase
    extends BaseUseCaseNoParams<List<DogImageEntity>> {
  const GetSavedDogImagesUseCase(this._repository);

  final DogImageRepository _repository;

  @override
  Future<Either<Failure, List<DogImageEntity>>> call() =>
      _repository.getSaved();
}
