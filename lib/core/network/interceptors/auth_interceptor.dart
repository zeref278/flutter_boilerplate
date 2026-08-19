import 'dart:async';

import 'package:boilerplate/core/network/auth_tokens.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:dio/dio.dart';

/// Attaches the stored access token, and renews it once when the server says
/// it has expired.
///
/// Tokens are read through `AppStorage`, which routes them to the platform
/// keychain because their keys are in `StorageKeys.secretKeys`. This class
/// never chooses a backend and never sees one.
///
/// The refresh is **single-flight**. Ten requests failing with 401 at the same
/// moment produce one refresh call, not ten: the first starts it, the rest
/// await the same future. Without that, a backend that rotates refresh tokens
/// would invalidate its own new token nine times over and log the user out
/// during an ordinary burst of traffic.
///
/// Each request is retried at most once. A second 401 after a successful
/// refresh means the token is not the problem, and retrying again is how a
/// client ends up in a loop against its own auth server.
///
/// Deliberately a plain [Interceptor], not a `QueuedInterceptor`. A queued one
/// holds the chain while it handles an error, and the retry below replays
/// through that same chain — the request would wait for a queue that is
/// waiting for it. The single-flight future is what provides the
/// serialization a queue would have, without the deadlock.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.storage,
    required this.refresher,
    required this.clientProvider,
    required this.onSessionExpired,
  });

  /// Marks a request that must not carry a token or trigger a refresh — the
  /// login and refresh calls themselves.
  static const String skipAuthExtra = 'skipAuth';

  /// Set on a retried request so a second failure ends the session.
  static const String _retriedExtra = 'authRetried';

  final AppStorage storage;
  final TokenRefresher refresher;

  /// Supplies the client used to replay a request. A function rather than a
  /// `Dio`, because the client owns this interceptor — taking the instance
  /// here would be a cycle at construction time.
  final Dio Function() clientProvider;

  /// Called after the credentials are cleared, so the shell can route to
  /// login. Kept as a callback: `core` must not know what a login screen is.
  final Future<void> Function() onSessionExpired;

  /// The refresh currently in flight, shared by every waiter.
  Future<AuthTokens?>? _inFlightRefresh;

  /// The session teardown currently in flight, shared by every waiter.
  Future<void>? _inFlightSessionEnd;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[skipAuthExtra] == true) return handler.next(options);

    final String? token = await storage.read<String>(StorageKeys.accessToken);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final RequestOptions request = err.requestOptions;
    final bool isRenewable =
        err.response?.statusCode == 401 &&
        request.extra[skipAuthExtra] != true &&
        request.extra[_retriedExtra] != true;
    if (!isRenewable) return handler.next(err);

    final AuthTokens? tokens = await _refreshOnce();
    if (tokens == null) {
      await _endSessionOnce();
      return handler.next(err);
    }

    try {
      handler.resolve(await _retry(request, tokens.accessToken));
    } on DioException catch (error) {
      handler.next(error);
    }
  }

  /// Runs at most one refresh at a time, handing every caller the same result.
  Future<AuthTokens?> _refreshOnce() {
    return _inFlightRefresh ??= _refresh().whenComplete(() {
      _inFlightRefresh = null;
    });
  }

  Future<AuthTokens?> _refresh() async {
    final String? refreshToken = await storage.read<String>(
      StorageKeys.refreshToken,
    );
    if (refreshToken == null || refreshToken.isEmpty) return null;

    // A refresher that throws is a failed refresh, not a crash inside an
    // interceptor: the session ends and the original 401 surfaces. The
    // storage writes are inside the same guard because a keychain that
    // refuses to write leaves the new token unpersisted — the next request
    // would send the stale one and 401 again. Failing the refresh here ends
    // the session cleanly instead of throwing out of onError, where nothing
    // is waiting to catch it.
    final AuthTokens? tokens;
    try {
      tokens = await refresher.refresh(refreshToken);
      if (tokens == null) return null;

      await storage.write<String>(StorageKeys.accessToken, tokens.accessToken);
      if (tokens.canRefresh) {
        await storage.write<String>(
          StorageKeys.refreshToken,
          tokens.refreshToken,
        );
      }
    } on Object {
      return null;
    }
    return tokens;
  }

  Future<Response<dynamic>> _retry(RequestOptions request, String token) {
    return clientProvider().fetch<dynamic>(
      request.copyWith(
        headers: <String, dynamic>{
          ...request.headers,
          'Authorization': 'Bearer $token',
        },
        extra: <String, dynamic>{...request.extra, _retriedExtra: true},
      ),
    );
  }

  /// Ends the session at most once per burst.
  ///
  /// Every waiter on a failed [_refreshOnce] arrives here together, so
  /// without this they would each clear the credentials and each call
  /// [onSessionExpired] — pushing the login screen once per in-flight
  /// request. Same reasoning as the single-flight refresh above.
  Future<void> _endSessionOnce() {
    return _inFlightSessionEnd ??= _endSession().whenComplete(() {
      _inFlightSessionEnd = null;
    });
  }

  Future<void> _endSession() async {
    for (final String key in StorageKeys.clearOnLogout) {
      await storage.delete(key);
    }
    await onSessionExpired();
  }
}
