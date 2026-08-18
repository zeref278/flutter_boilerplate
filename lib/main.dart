import 'package:boilerplate/bootstrap.dart';
import 'package:boilerplate/config/env/app_config.dart';

Future<void> main() => bootstrap(configure: AppConfig.configDev);
