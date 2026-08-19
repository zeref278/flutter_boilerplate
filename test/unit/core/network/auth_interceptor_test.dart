import 'dart:async';
import 'dart:typed_data';

import 'package:boilerplate/core/network/auth_tokens.dart';
import 'package:boilerplate/core/network/interceptors/auth_interceptor.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

/// Answers 401 until [unauthorizedResponses] have been sent, then 200.
class _SequencedAdapter implements HttpClientAdapter {
  _SequencedAdapter({this.unauthorizedResponses = 1});

  int unauthorizedResponses;
  final List<String?> seenAuthorizationHeaders = <String?>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    seenAuthorizationHeaders.add(options.headers['Authorization'] as String?);
    if (unauthorizedResponses > 0) {
      unauthorizedResponses--;
      return ResponseBody.fromString('', 401);
    }
    return ResponseBody.fromString('{}', 200);
  }

  @override
  void close({bool force = false}) {}
}

class _MemoryAppStorage implements AppStorage {
  final Map<String, Object?> values = <String, Object?>{};

  @override
  Future<void> init({required String boxName, String? path}) async {}

  @override
  Future<void> write<T>(String key, T value) async => values[key] = value;

  @override
  Future<T?> read<T>(String key, {T? defaultValue}) async =>
      (values[key] ?? defaultValue) as T?;

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<void> clear() async => values.clear();

  @override
  Future<bool> containsKey(String key) async => values.containsKey(key);

  @override
  Future<Set<String>> keys() async => values.keys.toSet();
}

class _CountingRefresher implements TokenRefresher {
  _CountingRefresher({this.result, this.throws = false});

  final AuthTokens? result;
  final bool throws;
  int calls = 0;

  @override
  Future<AuthTokens?> refresh(String refreshToken) async {
    calls++;
    // A real refresh is a round trip; the delay is what lets concurrent
    // callers overlap, which is the whole point of the single-flight test.
    await Future<void>.delayed(const Duration(milliseconds: 20));
    if (throws) throw StateError('refresh endpoint exploded');
    return result;
  }
}

void main() {
  late _MemoryAppStorage storage;
  late _SequencedAdapter adapter;
  late int sessionExpiredCalls;

  Dio buildClient(TokenRefresher refresher) {
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      AuthInterceptor(
        storage: storage,
        refresher: refresher,
        clientProvider: () => dio,
        onSessionExpired: () async => sessionExpiredCalls++,
      ),
    );
    return dio;
  }

  setUp(() {
    storage = _MemoryAppStorage();
    adapter = _SequencedAdapter(unauthorizedResponses: 0);
    sessionExpiredCalls = 0;
  });

  test('attaches the stored access token', () async {
    storage.values[StorageKeys.accessToken] = 'live-token';

    await buildClient(const UnsupportedTokenRefresher()).get<dynamic>('/x');

    expect(adapter.seenAuthorizationHeaders.single, 'Bearer live-token');
  });

  test('sends no Authorization header when nothing is stored', () async {
    await buildClient(const UnsupportedTokenRefresher()).get<dynamic>('/x');

    expect(adapter.seenAuthorizationHeaders.single, isNull);
  });

  test('leaves an opted-out request unauthenticated', () async {
    // The login and refresh calls themselves must not carry a stale token,
    // nor trigger a refresh when they fail.
    storage.values[StorageKeys.accessToken] = 'live-token';

    await buildClient(const UnsupportedTokenRefresher()).get<dynamic>(
      '/login',
      options: Options(
        extra: <String, dynamic>{AuthInterceptor.skipAuthExtra: true},
      ),
    );

    expect(adapter.seenAuthorizationHeaders.single, isNull);
  });

  test('refreshes once on 401 and replays with the new token', () async {
    storage.values
      ..[StorageKeys.accessToken] = 'stale'
      ..[StorageKeys.refreshToken] = 'renewable';
    adapter.unauthorizedResponses = 1;
    final _CountingRefresher refresher = _CountingRefresher(
      result: const AuthTokens(accessToken: 'fresh', refreshToken: 'rotated'),
    );

    await buildClient(refresher).get<dynamic>('/x');

    expect(refresher.calls, 1);
    expect(adapter.seenAuthorizationHeaders, <String>[
      'Bearer stale',
      'Bearer fresh',
    ]);
    expect(storage.values[StorageKeys.accessToken], 'fresh');
    expect(storage.values[StorageKeys.refreshToken], 'rotated');
    expect(sessionExpiredCalls, 0);
  });

  test('refreshes once for a burst of concurrent 401s', () async {
    // Without single-flight, a backend that rotates refresh tokens would
    // invalidate its own new token on every extra call and log the user out
    // during ordinary traffic.
    storage.values
      ..[StorageKeys.accessToken] = 'stale'
      ..[StorageKeys.refreshToken] = 'renewable';
    adapter.unauthorizedResponses = 5;
    final _CountingRefresher refresher = _CountingRefresher(
      result: const AuthTokens(accessToken: 'fresh', refreshToken: 'rotated'),
    );
    final Dio dio = buildClient(refresher);

    await Future.wait<void>(<Future<void>>[
      for (int i = 0; i < 5; i++) dio.get<dynamic>('/x$i'),
    ]);

    expect(refresher.calls, 1);
    expect(sessionExpiredCalls, 0);
  });

  test('ends the session when no refresh token is stored', () async {
    storage.values[StorageKeys.accessToken] = 'stale';
    adapter.unauthorizedResponses = 1;
    final _CountingRefresher refresher = _CountingRefresher();

    await expectLater(
      buildClient(refresher).get<dynamic>('/x'),
      throwsA(isA<DioException>()),
    );

    expect(refresher.calls, 0);
    expect(sessionExpiredCalls, 1);
    expect(storage.values.containsKey(StorageKeys.accessToken), isFalse);
  });

  test('ends the session when the refresher declines', () async {
    storage.values
      ..[StorageKeys.accessToken] = 'stale'
      ..[StorageKeys.refreshToken] = 'renewable';
    adapter.unauthorizedResponses = 1;

    await expectLater(
      buildClient(_CountingRefresher()).get<dynamic>('/x'),
      throwsA(isA<DioException>()),
    );

    expect(sessionExpiredCalls, 1);
    expect(storage.values.containsKey(StorageKeys.refreshToken), isFalse);
  });

  test(
    'treats a throwing refresher as a failed refresh, not a crash',
    () async {
      storage.values
        ..[StorageKeys.accessToken] = 'stale'
        ..[StorageKeys.refreshToken] = 'renewable';
      adapter.unauthorizedResponses = 1;

      await expectLater(
        buildClient(_CountingRefresher(throws: true)).get<dynamic>('/x'),
        throwsA(isA<DioException>()),
      );

      expect(sessionExpiredCalls, 1);
    },
  );

  test('gives up after one retry rather than looping', () async {
    // A second 401 after a successful refresh means the token was never the
    // problem. Retrying again is how a client DoSes its own auth server.
    storage.values
      ..[StorageKeys.accessToken] = 'stale'
      ..[StorageKeys.refreshToken] = 'renewable';
    adapter.unauthorizedResponses = 99;
    final _CountingRefresher refresher = _CountingRefresher(
      result: const AuthTokens(accessToken: 'fresh', refreshToken: 'rotated'),
    );

    await expectLater(
      buildClient(refresher).get<dynamic>('/x'),
      throwsA(isA<DioException>()),
    );

    expect(refresher.calls, 1);
    expect(adapter.seenAuthorizationHeaders, hasLength(2));
  });

  test('ends the session once for a burst of concurrent 401s', () async {
    // The refresh is single-flight, so the session-end that follows a failed
    // refresh must be too. A callback that routes to login would otherwise
    // push the login screen once per in-flight request.
    storage.values
      ..[StorageKeys.accessToken] = 'stale'
      ..[StorageKeys.refreshToken] = 'renewable';
    adapter.unauthorizedResponses = 5;
    final _CountingRefresher refresher = _CountingRefresher();
    final Dio dio = buildClient(refresher);

    await Future.wait<void>(<Future<void>>[
      for (int i = 0; i < 5; i++)
        dio
            .get<dynamic>('/x$i')
            .catchError(
              (Object _) => Response<dynamic>(
                requestOptions: RequestOptions(path: '/x$i'),
              ),
            ),
    ]);

    expect(refresher.calls, 1);
    expect(sessionExpiredCalls, 1);
  });

  test('the default refresher renews nothing', () async {
    expect(await const UnsupportedTokenRefresher().refresh('any'), isNull);
  });
}
