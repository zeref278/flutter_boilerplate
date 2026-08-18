import 'package:boilerplate/core/errors/failure_mapper.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

/// The single boundary where exceptions become typed failures.
///
/// Repositories wrap every call in this, so nothing above them ever sees a
/// raw exception. The terminal `on Object catch` is the one sanctioned
/// exception to the project's no-bare-catch rule: its whole purpose is that
/// no error can escape into a bloc.
Future<Either<Failure, T>> guard<T>(Future<T> Function() body) async {
  try {
    return Right<Failure, T>(await body());
  } on DioException catch (e) {
    return Left<Failure, T>(failureFromDioException(e));
  } on Object catch (e) {
    return Left<Failure, T>(UnknownFailure(message: e.toString()));
  }
}
