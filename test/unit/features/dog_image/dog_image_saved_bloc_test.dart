import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_saved_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dog_image_saved_bloc_test.mocks.dart';

@GenerateMocks(<Type>[GetSavedDogImagesUseCase, DeleteSavedDogImageUseCase])
void main() {
  late MockGetSavedDogImagesUseCase getSaved;
  late MockDeleteSavedDogImageUseCase deleteSaved;

  const DogImageEntity a = DogImageEntity(id: 1, imageUrl: 'https://dog/a.jpg');
  const DogImageEntity b = DogImageEntity(id: 2, imageUrl: 'https://dog/b.jpg');

  provideDummy<Either<Failure, List<DogImageEntity>>>(
    const Right<Failure, List<DogImageEntity>>(<DogImageEntity>[]),
  );
  provideDummy<Either<Failure, Unit>>(const Right<Failure, Unit>(unit));

  setUp(() {
    getSaved = MockGetSavedDogImagesUseCase();
    deleteSaved = MockDeleteSavedDogImageUseCase();
  });

  blocTest<DogImageSavedBloc, DogImageSavedState>(
    'emits loading then the saved images',
    setUp: () => when(getSaved.call()).thenAnswer(
      (_) async =>
          const Right<Failure, List<DogImageEntity>>(<DogImageEntity>[a, b]),
    ),
    build: () => DogImageSavedBloc(getSaved, deleteSaved),
    act: (bloc) => bloc.add(const DogImageSavedEvent.loadRequested()),
    expect: () => <Matcher>[
      isA<DogImageSavedState>().having(
        (s) => s.status,
        'status',
        isA<UILoading>(),
      ),
      isA<DogImageSavedState>()
          .having((s) => s.status, 'status', isA<UILoadSuccess>())
          .having((s) => s.images, 'images', <DogImageEntity>[a, b]),
    ],
  );

  blocTest<DogImageSavedBloc, DogImageSavedState>(
    'emits loadFailed carrying the failure',
    setUp: () => when(getSaved.call()).thenAnswer(
      (_) async => const Left<Failure, List<DogImageEntity>>(
        CacheFailure(message: 'unreadable'),
      ),
    ),
    build: () => DogImageSavedBloc(getSaved, deleteSaved),
    act: (bloc) => bloc.add(const DogImageSavedEvent.loadRequested()),
    expect: () => <Matcher>[
      isA<DogImageSavedState>().having(
        (s) => s.status,
        'status',
        isA<UILoading>(),
      ),
      isA<DogImageSavedState>().having(
        (s) => (s.status as UILoadFailed).failure,
        'failure',
        isA<CacheFailure>(),
      ),
    ],
  );

  blocTest<DogImageSavedBloc, DogImageSavedState>(
    'removes only the deleted image by id',
    seed: () => const DogImageSavedState(images: <DogImageEntity>[a, b]),
    setUp: () => when(
      deleteSaved.call(any),
    ).thenAnswer((_) async => const Right<Failure, Unit>(unit)),
    build: () => DogImageSavedBloc(getSaved, deleteSaved),
    act: (bloc) => bloc.add(const DogImageSavedEvent.deleteRequested(a)),
    expect: () => <Matcher>[
      isA<DogImageSavedState>().having((s) => s.isBusy, 'isBusy', true),
      isA<DogImageSavedState>().having((s) => s.isBusy, 'isBusy', false).having(
        (s) => s.images,
        'images',
        <DogImageEntity>[b],
      ),
    ],
  );
}
