import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/storage/database/app_database.dart' as db;
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_cache_data_source.dart';
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_data_source.dart';
import 'package:boilerplate/features/dog_image/data/models/dog_image_model.dart';
import 'package:boilerplate/features/dog_image/data/repositories/dog_image_repository_impl.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dog_image_repository_impl_test.mocks.dart';

@GenerateMocks(<Type>[DogImageDataSource, DogImageCacheDataSource])
void main() {
  late MockDogImageDataSource remote;
  late MockDogImageCacheDataSource cache;
  late DogImageRepository repository;

  setUp(() {
    remote = MockDogImageDataSource();
    cache = MockDogImageCacheDataSource();
    repository = DogImageRepositoryImpl(remote, cache);
  });

  test('returns Right with the mapped entity on success', () async {
    when(remote.getRandom()).thenAnswer(
      (_) async =>
          const DogImageModel(message: 'https://dog/a.jpg', status: 'success'),
    );

    final Either<Failure, DogImageEntity> result = await repository.getRandom();

    expect(result.isRight(), isTrue);
    result.match(
      (_) => fail('expected Right'),
      (image) => expect(image.imageUrl, 'https://dog/a.jpg'),
    );
  });

  test(
    'returns Left with NetworkFailure when the datasource cannot connect',
    () async {
      when(remote.getRandom()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/x'),
          type: DioExceptionType.connectionError,
        ),
      );

      final Either<Failure, DogImageEntity> result = await repository
          .getRandom();

      result.match(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('expected Left'),
      );
    },
  );

  test('returns Left with UnauthorizedFailure on 401', () async {
    final RequestOptions options = RequestOptions(path: '/x');
    when(remote.getRandom()).thenThrow(
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(requestOptions: options, statusCode: 401),
      ),
    );

    final Either<Failure, DogImageEntity> result = await repository.getRandom();

    result.match(
      (failure) => expect(failure, isA<UnauthorizedFailure>()),
      (_) => fail('expected Left'),
    );
  });

  test('maps saved rows to entities carrying their ids', () async {
    when(cache.getSaved()).thenAnswer(
      (_) async => <db.DogImage>[
        db.DogImage(id: 1, message: 'https://dog/a.jpg', status: 'ok'),
      ],
    );

    final Either<Failure, List<DogImageEntity>> result = await repository
        .getSaved();

    result.match((_) => fail('expected Right'), (images) {
      expect(images, hasLength(1));
      expect(images.single.id, 1);
    });
  });

  test('returns Left with CacheFailure when saving throws', () async {
    when(cache.save(any)).thenThrow(Exception('disk full'));

    final Either<Failure, Unit> result = await repository.save(
      const DogImageEntity(imageUrl: 'https://dog/a.jpg'),
    );

    result.match(
      (failure) => expect(failure, isA<UnknownFailure>()),
      (_) => fail('expected Left'),
    );
  });

  test(
    'rejects deleting an unsaved entity without touching the cache',
    () async {
      final Either<Failure, Unit> result = await repository.delete(
        const DogImageEntity(imageUrl: 'https://dog/a.jpg'),
      );

      expect(result.isLeft(), isTrue);
      verifyNever(cache.delete(any));
    },
  );
}
