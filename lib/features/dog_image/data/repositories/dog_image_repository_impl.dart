import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/database/app_database.dart' as db;
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_local_data_source.dart';
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_remote_data_source.dart';
import 'package:boilerplate/features/dog_image/data/mappers/dog_image_mapper.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:fpdart/fpdart.dart';

/// The repository boundary delegates every datasource operation to [guard],
/// where transport and database exceptions become typed failures.
class DogImageRepositoryImpl implements DogImageRepository {
  const DogImageRepositoryImpl(this._remote, this._local);

  final DogImageRemoteDataSource _remote;
  final DogImageLocalDataSource _local;

  @override
  Future<Either<Failure, DogImageEntity>> getRandom() =>
      guard(() async => (await _remote.getRandom()).toEntity());

  @override
  Future<Either<Failure, Unit>> save(DogImageEntity image) => guard(() async {
    await _local.save(image.toCompanion());
    return unit;
  });

  @override
  Future<Either<Failure, List<DogImageEntity>>> getSaved() => guard(() async {
    final List<db.DogImage> rows = await _local.getSaved();
    return rows.map((row) => row.toEntity()).toList();
  });

  @override
  Future<Either<Failure, Unit>> delete(DogImageEntity image) {
    final int? id = image.id;
    if (id == null) {
      return Future<Either<Failure, Unit>>.value(
        const Left<Failure, Unit>(
          UnknownFailure(message: 'Cannot delete an unsaved image'),
        ),
      );
    }
    return guard(() async {
      await _local.delete(id);
      return unit;
    });
  }
}
