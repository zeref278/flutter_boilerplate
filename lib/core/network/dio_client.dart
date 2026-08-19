import 'package:boilerplate/core/security/network_security.dart';
import 'package:dio/dio.dart';

/// Builds the app's HTTP client.
///
/// Timeouts are explicit: the Dio defaults are unbounded, which turns a dead
/// network into a hung UI rather than a TimeoutFailure. The values come from
/// the flavor's configuration rather than this file, so a slow staging
/// backend does not need a code change.
///
/// [security] supplies proxy and pinning hardening. It is a required argument
/// rather than an optional one so that adding a caller is a decision about
/// transport security rather than an omission.
///
/// [interceptors] are appended last, after the security ones. Order is the
/// contract: pinning rejects before anything else observes the request, and
/// the logger runs last so it never prints a body that was refused.
Dio createDio({
  required String baseUrl,
  required Duration connectTimeout,
  required Duration receiveTimeout,
  required Duration sendTimeout,
  required NetworkSecurity security,
  List<Interceptor> interceptors = const <Interceptor>[],
  String apiKey = '',
}) {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      headers: <String, String>{
        // Omitted entirely when unset, rather than sent as `Bearer `, which
        // some gateways treat as a malformed credential instead of none.
        if (apiKey.isNotEmpty) 'Authorization': 'Bearer $apiKey',
      },
    ),
  );

  final HttpClientAdapter? adapter = security.httpClientAdapter;
  if (adapter != null) dio.httpClientAdapter = adapter;

  // Security first: a rejected request must not reach an interceptor that
  // would log it, retry it, or attach a credential to it.
  dio.interceptors
    ..addAll(security.interceptors)
    ..addAll(interceptors);

  return dio;
}
