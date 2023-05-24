import 'package:dio/dio.dart';

/// Custom exception from dio error
class ApiException implements Exception {
  ApiException({
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });

  factory ApiException.fromDioError(DioError error) {
    return ApiException(
      statusCode: error.response?.statusCode,
      message: error.error?.toString(),
    );
  }

  ApiException.fromJson(Map<String, dynamic> json) {
    if (json['error'] != null) {
      final Map<String, dynamic> jsons = json['error'] as Map<String, dynamic>;
      code = jsons['code'] as String?;
      message = jsons['message'] as String?;
      if (jsons['data'] != null) {
        data = jsons['data'] as Map<String, dynamic>?;
      }
    }
  }

  int? statusCode;
  String? message;
  String? code;
  Map<String, dynamic>? data;

  @override
  String toString() {
    return message ?? 'Exception';
  }
}

extension HandleExceptionExtensions<T> on Future<T> {
  Future<T> get onApiError {
    return onError<Exception>(
      (exception, stackTrace) {
        throw ApiException.fromDioError(exception as DioError);
      },
      test: (exception) => exception is DioError,
    );
  }
}
