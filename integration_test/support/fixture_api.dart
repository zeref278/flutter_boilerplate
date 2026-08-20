import 'dart:typed_data';

import 'package:boilerplate/core/di/injector.dart';
import 'package:dio/dio.dart';

/// Answers the app's API calls from a fixture instead of the network.
///
/// The demo backend is a free public API. Reaching it from a CI runner failed
/// often enough to turn a green pipeline into a coin flip, and a suite that
/// goes red for reasons unrelated to the change teaches everyone to ignore it.
/// Nothing about the flow under test — request, mapping, storage, rendering —
/// needs the bytes to come from a real server.
///
/// Pass `--dart-define=USE_LIVE_API=true` to keep the real network, which is
/// how to check that the contract still matches the live service. That run is
/// deliberately not what the CI gate depends on.
class FixtureApiAdapter implements HttpClientAdapter {
  /// Whether the live service is used instead of these fixtures.
  static const bool useLiveApi = bool.fromEnvironment('USE_LIVE_API');

  /// Installs the fixture adapter on the app's Dio, unless the live API was
  /// requested. Call after the app has booted and DI is populated.
  static void installUnlessLive() {
    if (useLiveApi) return;
    Injector.instance<Dio>().httpClientAdapter = FixtureApiAdapter();
  }

  /// Shaped like the real endpoint's payload, so the model and mapper are
  /// still exercised rather than bypassed.
  static const String randomImageBody =
      '{"message":"https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",'
      '"status":"success"}';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      randomImageBody,
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
