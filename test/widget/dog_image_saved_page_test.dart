import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_saved_bloc.dart';
import 'package:boilerplate/features/dog_image/presentation/view/dog_image_saved_page.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  setUp(Injector.reset);
  tearDown(Injector.reset);

  testWidgets('shows each delete failure once with localized text', (
    tester,
  ) async {
    const DogImageEntity image = DogImageEntity(
      id: 1,
      imageUrl: 'https://dog/a.jpg',
    );
    final _FakeDogImageRepository repository = _FakeDogImageRepository()
      ..deleteResult = const Left<Failure, Unit>(
        CacheFailure(message: 'database unavailable'),
      );
    final DogImageSavedBloc bloc = DogImageSavedBloc(
      GetSavedDogImagesUseCase(repository),
      DeleteSavedDogImageUseCase(repository),
    );
    Injector.instance.registerFactory<DogImageSavedBloc>(() => bloc);

    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: <Locale>[Locale('en'), Locale('vi')],
        home: DogImageSavedPage(),
      ),
    );
    await tester.pumpAndSettle();

    bloc.add(const DogImageSavedEvent.deleteRequested(image));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Could not access local storage.'), findsOneWidget);
    expect(find.textContaining('database unavailable'), findsNothing);

    final BuildContext context = tester.element(find.byType(DogImageSavedPage));
    ScaffoldMessenger.of(context).clearSnackBars();
    await tester.pumpAndSettle();

    bloc.add(const DogImageSavedEvent.loadRequested());
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Could not access local storage.'), findsNothing);
  });
}

class _FakeDogImageRepository implements DogImageRepository {
  Either<Failure, Unit> deleteResult = const Right<Failure, Unit>(unit);

  @override
  Future<Either<Failure, Unit>> delete(DogImageEntity image) async =>
      deleteResult;

  @override
  Future<Either<Failure, List<DogImageEntity>>> getSaved() async =>
      const Right<Failure, List<DogImageEntity>>(<DogImageEntity>[]);

  @override
  Future<Either<Failure, DogImageEntity>> getRandom() async =>
      const Right<Failure, DogImageEntity>(
        DogImageEntity(imageUrl: 'https://dog/unused.jpg'),
      );

  @override
  Future<Either<Failure, Unit>> save(DogImageEntity image) async =>
      const Right<Failure, Unit>(unit);
}
