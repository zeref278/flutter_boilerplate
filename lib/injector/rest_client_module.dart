import 'package:boilerplate/configs/app_config.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_client/rest_client.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;
    const String dioInstance = 'dioInstance';

    /// Dio
    injector.registerLazySingleton<Dio>(
      () {
        final Dio dio = Dio(
          BaseOptions(
            baseUrl:
                'https://dd47327b-1823-4d83-b642-c64124bc5bd0.mock.pstmn.io/dev',
          ),
        );
        if (!kReleaseMode) {
          dio.interceptors.add(
            LogInterceptor(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
              responseBody: true,
              request: false,
            ),
          );
        }
        return dio;
      },
      instanceName: dioInstance,
    );

    injector.registerFactory<FlavorApiClient>(
      () => FlavorApiClient(
        injector(instanceName: dioInstance),
      ),
    );
  }
}
