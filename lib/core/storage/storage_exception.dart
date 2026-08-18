/// Base class for storage failures.
abstract class StorageException implements Exception {
  const StorageException(this.message, {this.code, this.originalError});

  final String message;
  final String? code;
  final Object? originalError;

  @override
  String toString() => 'StorageException: $message';
}

class StorageInitializationException extends StorageException {
  const StorageInitializationException(super.message, {super.originalError})
    : super(code: 'STORAGE_INIT_FAILED');
}

class StorageSaveException extends StorageException {
  const StorageSaveException(super.message, this.key, {super.originalError})
    : super(code: 'STORAGE_SAVE_FAILED');

  final String key;
}

class StorageRetrievalException extends StorageException {
  const StorageRetrievalException(
    super.message,
    this.key, {
    super.originalError,
  }) : super(code: 'STORAGE_RETRIEVAL_FAILED');

  final String key;
}

class StorageDeletionException extends StorageException {
  const StorageDeletionException(super.message, this.key, {super.originalError})
    : super(code: 'STORAGE_DELETION_FAILED');

  final String key;
}

class StorageClearException extends StorageException {
  const StorageClearException(super.message, {super.originalError})
    : super(code: 'STORAGE_CLEAR_FAILED');
}

class StorageNotInitializedException extends StorageException {
  const StorageNotInitializedException()
    : super(
        'Storage is not initialized. Call init() first.',
        code: 'STORAGE_NOT_INITIALIZED',
      );
}
