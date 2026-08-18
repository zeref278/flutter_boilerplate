import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Typed failures crossing the repository boundary.
///
/// `sealed` is load-bearing, not stylistic: freezed 3 otherwise generates
/// variants that only `implements` this union, and Dart then rejects the
/// exhaustive switch in `FailureX`.
@Freezed(fromJson: false, toJson: false)
sealed class Failure with _$Failure {
  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.timeout({required String message}) = TimeoutFailure;

  const factory Failure.server({
    required String message,
    int? statusCode,
    String? errorCode,
  }) = ServerFailure;

  const factory Failure.notFound({required String message}) = NotFoundFailure;

  const factory Failure.unauthorized({required String message}) =
      UnauthorizedFailure;

  const factory Failure.cache({required String message}) = CacheFailure;

  const factory Failure.unknown({required String message}) = UnknownFailure;
}
