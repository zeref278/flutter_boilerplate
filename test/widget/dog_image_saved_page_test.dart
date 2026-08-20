import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/ui/app_toast.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/bloc/dog_image_saved_bloc.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/dog_image_saved_keys.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/view/dog_image_saved_page.dart';
import 'package:boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

const DogImageEntity _image = DogImageEntity(
  id: 1,
  imageUrl: 'https://dog/a.jpg',
);

void main() {
  setUp(Injector.reset);
  tearDown(Injector.reset);

  testWidgets('asks for confirmation before deleting', (tester) async {
    final _FakeDogImageRepository repository = _FakeDogImageRepository();
    await _pumpPage(tester, repository);

    await tester.tap(
      find.byKey(const Key('${DogImageSavedKeys.deleteButton}.1')),
    );
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key(DogImageSavedKeys.deleteDialog)),
      findsOneWidget,
    );
    expect(repository.deleteCallCount, 0);
  });

  testWidgets('deletes and drops the tile when the dialog is confirmed', (
    tester,
  ) async {
    final _FakeDogImageRepository repository = _FakeDogImageRepository();
    await _pumpPage(tester, repository);

    await tester.tap(
      find.byKey(const Key('${DogImageSavedKeys.deleteButton}.1')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key(DogImageSavedKeys.deleteConfirm)));
    await tester.pumpAndSettle();

    expect(repository.deleteCallCount, 1);
    expect(find.byKey(const Key('${DogImageSavedKeys.tile}.1')), findsNothing);
  });

  testWidgets('deletes nothing when the dialog is cancelled', (tester) async {
    final _FakeDogImageRepository repository = _FakeDogImageRepository();
    await _pumpPage(tester, repository);

    await tester.tap(
      find.byKey(const Key('${DogImageSavedKeys.deleteButton}.1')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key(DogImageSavedKeys.deleteCancel)));
    await tester.pumpAndSettle();

    expect(repository.deleteCallCount, 0);
    expect(
      find.byKey(const Key('${DogImageSavedKeys.tile}.1')),
      findsOneWidget,
    );
  });

  testWidgets('shows each delete failure once with localized text', (
    tester,
  ) async {
    final _FakeDogImageRepository repository = _FakeDogImageRepository()
      ..deleteResult = const Left<Failure, Unit>(
        CacheFailure(message: 'database unavailable'),
      );
    final DogImageSavedBloc bloc = await _pumpPage(tester, repository);

    bloc.add(const DogImageSavedEvent.deleteConfirmed(_image));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Could not access local storage.'), findsOneWidget);
    expect(find.textContaining('database unavailable'), findsNothing);

    AppToast.dismiss();
    await tester.pumpAndSettle();

    bloc.add(const DogImageSavedEvent.loadRequested());
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Could not access local storage.'), findsNothing);
  });
}

Future<DogImageSavedBloc> _pumpPage(
  WidgetTester tester,
  _FakeDogImageRepository repository,
) async {
  final DogImageSavedBloc bloc = DogImageSavedBloc(
    GetSavedDogImagesUseCase(repository),
    DeleteSavedDogImageUseCase(repository),
  );
  Injector.instance.registerFactory<DogImageSavedBloc>(() => bloc);

  await tester.pumpWidget(
    const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: DogImageSavedPage(),
    ),
  );
  await tester.pumpAndSettle();
  return bloc;
}

class _FakeDogImageRepository implements DogImageRepository {
  Either<Failure, Unit> deleteResult = const Right<Failure, Unit>(unit);
  int deleteCallCount = 0;

  @override
  Future<Either<Failure, Unit>> delete(DogImageEntity image) async {
    deleteCallCount++;
    return deleteResult;
  }

  @override
  Future<Either<Failure, List<DogImageEntity>>> getSaved() async =>
      const Right<Failure, List<DogImageEntity>>(<DogImageEntity>[_image]);

  @override
  Future<Either<Failure, DogImageEntity>> getRandom() async =>
      const Right<Failure, DogImageEntity>(
        DogImageEntity(imageUrl: 'https://dog/unused.jpg'),
      );

  @override
  Future<Either<Failure, Unit>> save(DogImageEntity image) async =>
      const Right<Failure, Unit>(unit);
}
