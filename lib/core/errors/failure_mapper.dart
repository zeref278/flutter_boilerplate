import 'package:boilerplate/core/errors/failures.dart';
import 'package:dio/dio.dart';

/// Translates transport errors into domain failures.
///
/// Reads the response body as well as the status code, so a server-supplied
/// message reaches the UI instead of a generic string.
Failure failureFromDioException(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => TimeoutFailure(
      message: e.message ?? 'Request timed out',
    ),
    DioExceptionType.connectionError => NetworkFailure(
      message: e.message ?? 'No connection',
    ),
    DioExceptionType.badResponse => _fromResponse(e),
    DioExceptionType.cancel => UnknownFailure(
      message: e.message ?? 'Request cancelled',
    ),
    DioExceptionType.badCertificate => NetworkFailure(
      message: e.message ?? 'Bad certificate',
    ),
    DioExceptionType.unknown => UnknownFailure(
      message: e.message ?? 'Unexpected error',
    ),
  };
}

Failure _fromResponse(DioException e) {
  final int? statusCode = e.response?.statusCode;
  final String message =
      _messageFrom(e.response?.data) ??
      e.message ??
      'Request failed with status $statusCode';

  return switch (statusCode) {
    401 || 403 => UnauthorizedFailure(message: message),
    404 => NotFoundFailure(message: message),
    _ => ServerFailure(message: message, statusCode: statusCode),
  };
}

String? _messageFrom(dynamic data) {
  if (data is Map<String, dynamic>) {
    final Object? message = data['message'] ?? data['error'];
    if (message is String && message.isNotEmpty) return message;
  }
  if (data is String && data.isNotEmpty) return data;
  return null;
}
