import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/errors/guard.dart';
import 'package:boilerplate/core/storage/database/app_database.dart' as db;
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_cache_data_source.dart';
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_data_source.dart';
import 'package:boilerplate/features/dog_image/data/mapper/dog_image_mapper.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:fpdart/fpdart.dart';

/// The only layer that catches exceptions, and the only one importing Dio or
/// drift error types.
class DogImageRepositoryImpl implements DogImageRepository {
  const DogImageRepositoryImpl(this._remote, this._cache);

  final DogImageDataSource _remote;
  final DogImageCacheDataSource _cache;

  @override
  Future<Either<Failure, DogImageEntity>> getRandom() =>
      guard(() async => (await _remote.getRandom()).toEntity());

  @override
  Future<Either<Failure, Unit>> save(DogImageEntity image) => guard(() async {
    await _cache.save(image.toCompanion());
    return unit;
  });

  @override
  Future<Either<Failure, List<DogImageEntity>>> getSaved() => guard(() async {
    final List<db.DogImage> rows = await _cache.getSaved();
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
      await _cache.delete(id);
      return unit;
    });
  }
}
