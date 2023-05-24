import 'package:boilerplate/bootstrap.dart';
import 'package:boilerplate/configs/app_config.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {},
    flavorConfiguration: () async {
      AppConfig.configDev();
    },
  );
}
