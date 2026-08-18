import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/errors/guard.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  test('returns Right with the value when the body succeeds', () async {
    final Either<Failure, int> result = await guard(() async => 42);

    expect(result.isRight(), isTrue);
    expect(result.getOrElse((_) => 0), 42);
  });

  test(
    'returns Left with a mapped failure when the body throws DioException',
    () async {
      final Either<Failure, int> result = await guard(() async {
        throw DioException(
          requestOptions: RequestOptions(path: '/x'),
          type: DioExceptionType.connectionError,
        );
      });

      expect(result.isLeft(), isTrue);
      result.match(
        (failure) => expect(failure, isA<NetworkFailure>()),
        (_) => fail('expected Left'),
      );
    },
  );

  test('returns Left with UnknownFailure for an unrecognised error', () async {
    final Either<Failure, int> result = await guard(
      () async => throw StateError('boom'),
    );

    expect(result.isLeft(), isTrue);
    result.match(
      (failure) => expect(failure, isA<UnknownFailure>()),
      (_) => fail('expected Left'),
    );
  });
}
