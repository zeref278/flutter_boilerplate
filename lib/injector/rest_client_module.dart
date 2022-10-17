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
        /// TODO: custom DIO here
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: AppConfig.baseUrl,
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

    injector.registerFactory<DogApiClient>(
      () => DogApiClient(
        injector(instanceName: dioInstance),
      ),
    );
  }
}
