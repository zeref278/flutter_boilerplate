import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/use_cases/base_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveDogImageUseCase extends BaseUseCase<DogImageEntity, Unit> {
  const SaveDogImageUseCase(this._repository);

  final DogImageRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(DogImageEntity params) =>
      _repository.save(params);
}
