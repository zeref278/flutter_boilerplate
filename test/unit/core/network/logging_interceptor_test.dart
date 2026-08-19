import 'dart:typed_data';

import 'package:boilerplate/core/network/interceptors/logging_interceptor.dart';
import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

/// Answers every request with a fixed status and an empty body.
class _StatusAdapter implements HttpClientAdapter {
  _StatusAdapter(this.statusCode);

  final int statusCode;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => ResponseBody.fromString('', statusCode);

  @override
  void close({bool force = false}) {}
}

class _RecordingLogService implements LogService {
  final List<String> lines = <String>[];

  @override
  void i(String message) => lines.add(message);

  @override
  void w(String message, [Object? error, StackTrace? stackTrace]) =>
      lines.add(message);

  @override
  void e(String message, Object error, [StackTrace? stackTrace]) =>
      lines.add(message);

  String get combined => lines.join('\n');
}

void main() {
  late _RecordingLogService log;

  RequestOptions request({Map<String, dynamic>? headers, Object? body}) =>
      RequestOptions(
        path: '/things',
        method: 'GET',
        headers: headers ?? <String, dynamic>{},
        data: body,
      );

  setUp(() => log = _RecordingLogService());

  test('never writes a bearer token to the log', () {
    // The whole reason this replaced pretty_dio_logger: a token in scrollback
    // outlives the request by weeks.
    LoggingInterceptor(logService: log).onRequest(
      request(headers: <String, dynamic>{'Authorization': 'Bearer sk-secret'}),
      RequestInterceptorHandler(),
    );

    expect(log.combined, isNot(contains('sk-secret')));
    expect(log.combined, contains('<redacted>'));
  });

  test('redacts every credential header it knows, case-insensitively', () {
    LoggingInterceptor(logService: log).onRequest(
      request(
        headers: <String, dynamic>{
          'authorization': 'a',
          'Cookie': 'b',
          'X-API-KEY': 'c',
          'x-refresh-token': 'd',
        },
      ),
      RequestInterceptorHandler(),
    );

    for (final String secret in <String>['a', 'b', 'c', 'd']) {
      expect(log.combined, isNot(contains(': $secret')), reason: secret);
    }
  });

  test('redacts additional headers the caller names', () {
    LoggingInterceptor(
      logService: log,
      redactedHeaders: <String>{'X-Tenant-Secret'},
    ).onRequest(
      request(headers: <String, dynamic>{'x-tenant-secret': 'leaky'}),
      RequestInterceptorHandler(),
    );

    expect(log.combined, isNot(contains('leaky')));
  });

  test('keeps ordinary headers readable', () {
    LoggingInterceptor(logService: log).onRequest(
      request(headers: <String, dynamic>{'Accept': 'application/json'}),
      RequestInterceptorHandler(),
    );

    expect(log.combined, contains('application/json'));
  });

  test('truncates a body that would bury the rest of the console', () {
    LoggingInterceptor(
      logService: log,
      maxBodyLength: 10,
    ).onRequest(request(body: 'x' * 500), RequestInterceptorHandler());

    expect(log.combined, contains('more characters'));
    expect(log.combined.length, lessThan(200));
  });

  test('logs the status line of a failed request', () async {
    // Driven through a real client rather than a bare handler: calling
    // ErrorInterceptorHandler.next by hand rejects a future nobody awaits,
    // and the test fails on that instead of on the assertion.
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = _StatusAdapter(503)
      ..interceptors.add(LoggingInterceptor(logService: log));

    await expectLater(
      dio.get<dynamic>('/things'),
      throwsA(isA<DioException>()),
    );

    expect(log.combined, contains('503'));
  });
}
