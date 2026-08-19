import 'package:boilerplate/core/errors/failure_mapper.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sqlite3/common.dart';

/// The single boundary where exceptions become typed failures.
///
/// Repositories wrap every call in this, so nothing above them ever sees a
/// raw exception. Known transport, database, and storage exceptions are
/// matched before the terminal `on Object catch`. That terminal catch is the
/// repository boundary's permitted broad fallback: its purpose is ensuring
/// that no unexpected datasource error escapes into a feature bloc.
Future<Either<Failure, T>> guard<T>(Future<T> Function() body) async {
  try {
    return Right<Failure, T>(await body());
  } on DioException catch (e) {
    return Left<Failure, T>(failureFromDioException(e));
  } on SqliteException catch (e) {
    return Left<Failure, T>(CacheFailure(message: e.message));
  } on StorageException catch (e) {
    return Left<Failure, T>(CacheFailure(message: e.message));
  } on Object catch (e) {
    return Left<Failure, T>(UnknownFailure(message: e.toString()));
  }
}
