import 'package:boilerplate/configs/app_config.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class DioModule{
  DioModule._();

  static const String dioInstanceName = 'dioInstance';
  static final GetIt _injector = Injector.instance;

  static void setup() {
    _setupDio();
  }

  static void _setupDio() {
    /// Dio
    _injector.registerLazySingleton<Dio>(
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
      instanceName: dioInstanceName,
    );
  }

}