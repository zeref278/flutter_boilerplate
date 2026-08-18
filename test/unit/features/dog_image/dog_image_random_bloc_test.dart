import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_random_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/save_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_random_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dog_image_random_bloc_test.mocks.dart';

@GenerateMocks(<Type>[GetRandomDogImageUseCase, SaveDogImageUseCase])
void main() {
  late MockGetRandomDogImageUseCase getRandom;
  late MockSaveDogImageUseCase save;

  const DogImageEntity image = DogImageEntity(imageUrl: 'https://dog/a.jpg');

  provideDummy<Either<Failure, DogImageEntity>>(
    const Right<Failure, DogImageEntity>(image),
  );
  provideDummy<Either<Failure, Unit>>(const Right<Failure, Unit>(unit));

  setUp(() {
    getRandom = MockGetRandomDogImageUseCase();
    save = MockSaveDogImageUseCase();
  });

  blocTest<DogImageRandomBloc, DogImageRandomState>(
    'emits busy then success with the loaded image',
    setUp: () => when(
      getRandom.call(),
    ).thenAnswer((_) async => const Right<Failure, DogImageEntity>(image)),
    build: () => DogImageRandomBloc(getRandom, save),
    act: (bloc) => bloc.add(const DogImageRandomEvent.randomRequested()),
    expect: () => <Matcher>[
      isA<DogImageRandomState>().having((s) => s.isBusy, 'isBusy', true),
      isA<DogImageRandomState>()
          .having((s) => s.isBusy, 'isBusy', false)
          .having((s) => s.status, 'status', isA<UILoadSuccess>())
          .having((s) => s.dogImage, 'dogImage', image),
    ],
  );

  blocTest<DogImageRandomBloc, DogImageRandomState>(
    'emits a failed notification and no image when loading fails',
    setUp: () => when(getRandom.call()).thenAnswer(
      (_) async => const Left<Failure, DogImageEntity>(
        NetworkFailure(message: 'offline'),
      ),
    ),
    build: () => DogImageRandomBloc(getRandom, save),
    act: (bloc) => bloc.add(const DogImageRandomEvent.randomRequested()),
    expect: () => <Matcher>[
      isA<DogImageRandomState>().having((s) => s.isBusy, 'isBusy', true),
      isA<DogImageRandomState>()
          .having((s) => s.isBusy, 'isBusy', false)
          .having((s) => s.dogImage, 'dogImage', isNull)
          .having((s) => s.notification, 'notification', isNotNull),
    ],
  );

  blocTest<DogImageRandomBloc, DogImageRandomState>(
    'saves the image when saveToDb is set',
    setUp: () {
      when(
        getRandom.call(),
      ).thenAnswer((_) async => const Right<Failure, DogImageEntity>(image));
      when(
        save.call(any),
      ).thenAnswer((_) async => const Right<Failure, Unit>(unit));
    },
    build: () => DogImageRandomBloc(getRandom, save),
    act: (bloc) =>
        bloc.add(const DogImageRandomEvent.randomRequested(saveToDb: true)),
    verify: (_) => verify(save.call(image)).called(1),
  );

  blocTest<DogImageRandomBloc, DogImageRandomState>(
    'surfaces a save failure instead of swallowing it',
    setUp: () {
      when(
        getRandom.call(),
      ).thenAnswer((_) async => const Right<Failure, DogImageEntity>(image));
      when(save.call(any)).thenAnswer(
        (_) async =>
            const Left<Failure, Unit>(CacheFailure(message: 'disk full')),
      );
    },
    build: () => DogImageRandomBloc(getRandom, save),
    act: (bloc) =>
        bloc.add(const DogImageRandomEvent.randomRequested(saveToDb: true)),
    expect: () => <Matcher>[
      isA<DogImageRandomState>().having((s) => s.isBusy, 'isBusy', true),
      isA<DogImageRandomState>().having(
        (s) => s.notification,
        'notification',
        isNotNull,
      ),
      isA<DogImageRandomState>().having(
        (s) => s.status,
        'status',
        isA<UILoadSuccess>(),
      ),
    ],
  );
}
