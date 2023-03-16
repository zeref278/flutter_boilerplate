import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rest_client/src/exceptions/custom_exception.dart';

/// Handle exception from dio
class ExceptionHandler {
  ExceptionHandler._();

  static handleException(Object obj) {
    if (obj is DioError) {
      throw _getException(obj);
    }
  }

  static CustomException _getException(DioError error) {
    if (error.type == DioErrorType.unknown) {
      if (error.error is SocketException) {
        return CustomException(

            /// TODO: message
            );
      } else {
        return CustomException();
      }
    } else if (error.type == DioErrorType.badResponse) {
      try {
        if (error.response!.statusCode == 401) {
          return CustomException();
        } else {
          return CustomException.fromJson(error.response!.data);
        }
      } catch (e) {
        return CustomException();
      }
    } else if (error.type == DioErrorType.sendTimeout) {
      return CustomException();
    } else {
      return CustomException();
    }
  }
}
