import 'package:boilerplate/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

/// Base contract for use cases taking parameters.
abstract class BaseUseCase<Input, Output> {
  const BaseUseCase();

  Future<Either<Failure, Output>> call(Input params);
}

/// Base contract for use cases taking no parameters.
abstract class BaseUseCaseNoParams<Output> {
  const BaseUseCaseNoParams();

  Future<Either<Failure, Output>> call();
}
