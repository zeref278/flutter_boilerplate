/// Base class for storage failures. Thrown by backends, converted to a
/// `Failure` by `guard` at the repository boundary.
abstract class StorageException implements Exception {
  const StorageException(this.message, {this.code, this.originalError});

  final String message;
  final String? code;
  final Object? originalError;

  @override
  String toString() => '$runtimeType: $message';
}

class StorageInitException extends StorageException {
  const StorageInitException(super.message, {super.originalError})
    : super(code: 'STORAGE_INIT_FAILED');
}

class StorageWriteException extends StorageException {
  const StorageWriteException(super.message, this.key, {super.originalError})
    : super(code: 'STORAGE_WRITE_FAILED');

  final String key;
}

class StorageReadException extends StorageException {
  const StorageReadException(super.message, this.key, {super.originalError})
    : super(code: 'STORAGE_READ_FAILED');

  final String key;
}

class StorageDeleteException extends StorageException {
  const StorageDeleteException(super.message, this.key, {super.originalError})
    : super(code: 'STORAGE_DELETE_FAILED');

  final String key;
}

class StorageClearException extends StorageException {
  const StorageClearException(super.message, {super.originalError})
    : super(code: 'STORAGE_CLEAR_FAILED');
}

class StorageNotReadyException extends StorageException {
  const StorageNotReadyException()
    : super(
        'Storage was used before init() completed.',
        code: 'STORAGE_NOT_READY',
      );
}
