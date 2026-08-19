import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:dio/dio.dart';

/// Logs requests and responses through [LogService], with credentials
/// redacted.
///
/// Replaces `pretty_dio_logger`, which prints `options.headers` verbatim when
/// header logging is on — and the app's own `Authorization` header is in
/// there. A bearer token in a log line survives in terminal scrollback, CI
/// artifacts, and screen shares long after the request is gone, so this
/// redacts by name before anything is written.
///
/// Only installed when the flavor enables logging, which production does not.
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    required this.logService,
    Set<String>? redactedHeaders,
    this.maxBodyLength = 2000,
  }) : _redacted = <String>{
         ...?redactedHeaders?.map((header) => header.toLowerCase()),
         ...defaultRedactedHeaders,
       };

  /// Headers never written to a log, matched case-insensitively.
  ///
  /// Redaction is a deny-list because a header carrying a credential is the
  /// exception; an allow-list would silence the ordinary headers that make a
  /// log worth reading.
  static const Set<String> defaultRedactedHeaders = <String>{
    'authorization',
    'proxy-authorization',
    'cookie',
    'set-cookie',
    'x-api-key',
    'x-auth-token',
    'x-refresh-token',
  };

  final LogService logService;
  final Set<String> _redacted;

  /// Bodies longer than this are truncated. A large response otherwise buries
  /// every other line in the console.
  final int maxBodyLength;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logService
      ..i('--> ${options.method} ${options.uri}')
      ..i('    headers: ${_redactHeaders(options.headers)}');
    if (options.data != null) {
      logService.i('    body: ${_truncate(options.data)}');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logService
      ..i(
        '<-- ${response.statusCode} '
        '${response.requestOptions.method} ${response.requestOptions.uri}',
      )
      ..i('    body: ${_truncate(response.data)}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logService.w(
      '<-- ${err.response?.statusCode ?? 'no response'} '
      '${err.requestOptions.method} ${err.requestOptions.uri}',
      err.error,
    );
    handler.next(err);
  }

  Map<String, dynamic> _redactHeaders(Map<String, dynamic> headers) {
    return <String, dynamic>{
      for (final MapEntry<String, dynamic> entry in headers.entries)
        entry.key: _redacted.contains(entry.key.toLowerCase())
            ? '<redacted>'
            : entry.value,
    };
  }

  String _truncate(Object? body) {
    final String text = body.toString();
    if (text.length <= maxBodyLength) return text;
    return '${text.substring(0, maxBodyLength)}… '
        '(${text.length - maxBodyLength} more characters)';
  }
}
