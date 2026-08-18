import 'package:boilerplate/core/errors/failure_mapper.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final RequestOptions options = RequestOptions(path: '/x');

  test('maps connection timeout to TimeoutFailure', () {
    final Failure result = failureFromDioException(
      DioException(
        requestOptions: options,
        type: DioExceptionType.connectionTimeout,
      ),
    );

    expect(result, isA<TimeoutFailure>());
  });

  test('maps connection error to NetworkFailure', () {
    final Failure result = failureFromDioException(
      DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
      ),
    );

    expect(result, isA<NetworkFailure>());
  });

  test('maps 401 to UnauthorizedFailure', () {
    final Failure result = failureFromDioException(
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(requestOptions: options, statusCode: 401),
      ),
    );

    expect(result, isA<UnauthorizedFailure>());
  });

  test('maps 404 to NotFoundFailure', () {
    final Failure result = failureFromDioException(
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(requestOptions: options, statusCode: 404),
      ),
    );

    expect(result, isA<NotFoundFailure>());
  });

  test('carries the server message from the response body', () {
    final Failure result = failureFromDioException(
      DioException(
        requestOptions: options,
        type: DioExceptionType.badResponse,
        response: Response<dynamic>(
          requestOptions: options,
          statusCode: 500,
          data: <String, dynamic>{'message': 'boom'},
        ),
      ),
    );

    expect(result, isA<ServerFailure>());
    expect((result as ServerFailure).message, 'boom');
    expect(result.statusCode, 500);
  });
}
