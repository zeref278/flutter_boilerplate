import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  if (arguments.length != 1 || arguments.single.isEmpty) {
    stderr.writeln('Expected one explicit iOS device id.');
    exitCode = 2;
    return;
  }

  final Object? decoded = jsonDecode(
    await stdin.transform(utf8.decoder).join(),
  );
  final List<Object?> devices = decoded! as List<Object?>;
  final String requestedId = arguments.single;
  Map<String, Object?>? selected;
  for (final Object? device in devices) {
    if (device is Map<String, Object?> && device['id'] == requestedId) {
      selected = device;
      break;
    }
  }

  if (selected == null) {
    stderr.writeln('Coverage device $requestedId is not connected.');
    exitCode = 2;
    return;
  }
  if (selected['targetPlatform'] != 'ios') {
    stderr.writeln(
      'Coverage requires iOS; $requestedId is '
      '${selected['targetPlatform']}.',
    );
    exitCode = 2;
    return;
  }

  stdout.writeln('Coverage iOS device: ${selected['name']} ($requestedId)');
}
