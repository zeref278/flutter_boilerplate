import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteSavedDogImageUseCase extends BaseUseCase<DogImageEntity, Unit> {
  const DeleteSavedDogImageUseCase(this._repository);

  final DogImageRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(DogImageEntity params) =>
      _repository.delete(params);
}
