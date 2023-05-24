import 'package:bloc_test/bloc_test.dart';
import 'package:boilerplate/core/bloc_core/ui_status.dart';
import 'package:boilerplate/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:boilerplate/features/dog_image_random/bloc/dog_image_random_bloc.dart';
import 'package:boilerplate/services/log_service/log_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rest_client/rest_client.dart';
import '../dependencies/mock_dependencies.mocks.dart';

void main() {
  const DogImage image = DogImage(message: 'demo', status: 'success');
  final DogImageRandomRepository repository = MockDogImageRandomRepository();
  final LogService logService = MockLogService();

  late DogImageRandomBloc bloc;

  setUp(() {
    bloc = DogImageRandomBloc(
      dogImageRandomRepository: repository,
      logService: logService,
    );
  });

  group('test add event [DogImageRandomRandomRequested]', () {
    blocTest(
      'emit state when success',
      setUp: () {
        when(repository.getDogImageRandom()).thenAnswer(
          (_) => Future<DogImage>.value(
            image,
          ),
        );
      },
      build: () => bloc,
      act: (_) => bloc.add(
        const DogImageRandomEvent.randomRequested(),
      ),
      expect: () => [
        isA<DogImageRandomState>().having(
          (state) => state.isBusy,
          'isBusy',
          true,
        ),
        isA<DogImageRandomState>()
            .having(
              (state) => state.isBusy,
              'isBusy',
              false,
            )
            .having(
              (state) => state.status,
              'status',
              isA<UILoadSuccess>(),
            )
            .having(
              (state) => state.dogImage,
              'image',
              image,
            ),
      ],
    );

    blocTest(
      'emit state when failed',
      setUp: () {
        when(repository.getDogImageRandom()).thenThrow(
          Exception(
            'error',
          ),
        );
      },
      build: () => bloc,
      seed: () => const DogImageRandomState(dogImage: image),
      act: (_) => bloc.add(
        const DogImageRandomEvent.randomRequested(),
      ),
      expect: () => [
        isA<DogImageRandomState>().having(
          (state) => state.isBusy,
          'isBusy',
          true,
        ),
        isA<DogImageRandomState>()
            .having(
              (state) => state.notification,
              'status',
              isNotNull,
            )
            .having(
              (state) => state.dogImage,
              'image',
              image,
            )
            .having(
              (state) => state.isBusy,
              'isBusy',
              false,
            ),
      ],
    );
  });
}
