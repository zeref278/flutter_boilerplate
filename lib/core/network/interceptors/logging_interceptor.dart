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
/// Three places carry a credential, and all three are handled:
///
/// - **Headers** — redacted by name against [defaultRedactedHeaders].
/// - **Query strings** — redacted by name against [defaultRedactedParams],
///   because `?api_key=` is as readable in a log as any header.
/// - **Bodies** — not logged at all unless [logBodies] is set. A login
///   request body holds a password and a token endpoint's response holds both
///   tokens, and neither has a name this class could match on: the key could
///   be anything, and the payload could be a nested object, a form, or a
///   stream. Rather than pretend a deny-list covers that, the default is to
///   write nothing and let someone debugging opt in deliberately.
///
/// Only installed when the flavor enables logging, which production does not.
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    required this.logService,
    Set<String>? redactedHeaders,
    Set<String>? redactedParams,
    this.logBodies = false,
    this.maxBodyLength = 2000,
  }) : _redactedHeaders = <String>{
         ...?redactedHeaders?.map((header) => header.toLowerCase()),
         ...defaultRedactedHeaders,
       },
       _redactedParams = <String>{
         ...?redactedParams?.map((param) => param.toLowerCase()),
         ...defaultRedactedParams,
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

  /// Query parameters never written to a log, matched case-insensitively.
  static const Set<String> defaultRedactedParams = <String>{
    'access_token',
    'api_key',
    'apikey',
    'auth',
    'code',
    'id_token',
    'key',
    'password',
    'refresh_token',
    'secret',
    'signature',
    'token',
  };

  /// Stands in for a redacted query value. Percent-encoding-safe.
  static const String redactedParamMarker = 'REDACTED';

  final LogService logService;
  final Set<String> _redactedHeaders;
  final Set<String> _redactedParams;

  /// Whether request and response bodies are written to the log.
  ///
  /// Off by default. Turning it on will print credentials whenever the
  /// endpoint carries them in the payload — which is exactly what a login or
  /// token-refresh call does.
  final bool logBodies;

  /// Bodies longer than this are truncated. A large response otherwise buries
  /// every other line in the console.
  final int maxBodyLength;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logService
      ..i('--> ${options.method} ${_redactUri(options.uri)}')
      ..i('    headers: ${_redactHeaders(options.headers)}');
    if (logBodies && options.data != null) {
      logService.i('    body: ${_truncate(options.data)}');
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logService.i(
      '<-- ${response.statusCode} ${response.requestOptions.method} '
      '${_redactUri(response.requestOptions.uri)}',
    );
    if (logBodies) {
      logService.i('    body: ${_truncate(response.data)}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logService.w(
      '<-- ${err.response?.statusCode ?? 'no response'} '
      '${err.requestOptions.method} ${_redactUri(err.requestOptions.uri)}',
      err.error,
    );
    handler.next(err);
  }

  Map<String, dynamic> _redactHeaders(Map<String, dynamic> headers) {
    return <String, dynamic>{
      for (final MapEntry<String, dynamic> entry in headers.entries)
        entry.key: _redactedHeaders.contains(entry.key.toLowerCase())
            ? '<redacted>'
            : entry.value,
    };
  }

  /// Rebuilds [uri] with credential-bearing query values replaced.
  ///
  /// Uses `queryParametersAll` so a parameter repeated in the query string
  /// keeps every one of its values rather than collapsing to the last. The
  /// marker is bare letters rather than the `<redacted>` used for headers,
  /// because a query value is percent-encoded on the way out and the angle
  /// brackets would reach the log as `%3C...%3E`.
  Uri _redactUri(Uri uri) {
    if (!uri.hasQuery) return uri;
    return uri.replace(
      queryParameters: <String, List<String>>{
        for (final MapEntry<String, List<String>> entry
            in uri.queryParametersAll.entries)
          entry.key: _redactedParams.contains(entry.key.toLowerCase())
              ? <String>[redactedParamMarker]
              : entry.value,
      },
    );
  }

  String _truncate(Object? body) {
    final String text = body.toString();
    if (text.length <= maxBodyLength) return text;
    return '${text.substring(0, maxBodyLength)}… '
        '(${text.length - maxBodyLength} more characters)';
  }
}
