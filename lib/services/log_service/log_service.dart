import 'package:logger/logger.dart';

abstract class LogService {
  void e(String message, dynamic e, StackTrace? stack);
}