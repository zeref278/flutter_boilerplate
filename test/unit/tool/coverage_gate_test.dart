import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory temporaryDirectory;
  late File unitTrace;
  late File integrationTrace;
  late File mergedTrace;

  setUp(() async {
    temporaryDirectory = await Directory.systemTemp.createTemp(
      'coverage_gate_test',
    );
    unitTrace = File('${temporaryDirectory.path}/unit.lcov');
    integrationTrace = File('${temporaryDirectory.path}/integration.lcov');
    mergedTrace = File('${temporaryDirectory.path}/merged.lcov');

    await unitTrace.writeAsString('''
SF:lib/a.dart
DA:1,1
DA:2,0
end_of_record
SF:lib/a.g.dart
DA:1,1
end_of_record
SF:lib/generated/l10n.dart
DA:1,1
end_of_record
''');
    await integrationTrace.writeAsString('''
SF:${Directory.current.path}/lib/a.dart
DA:2,1
DA:3,0
end_of_record
SF:lib/b.dart
DA:1,1
end_of_record
''');
  });

  tearDown(() => temporaryDirectory.delete(recursive: true));

  Future<ProcessResult> runGate({required int minimum}) =>
      Process.run(_dartExecutable(), <String>[
        'run',
        'tool/coverage_gate.dart',
        '--root=${Directory.current.path}',
        '--minimum=$minimum',
        '--output=${mergedTrace.path}',
        unitTrace.path,
        integrationTrace.path,
      ], workingDirectory: Directory.current.path);

  test(
    'merges unique authored-lib lines and excludes generated sources',
    () async {
      final ProcessResult result = await runGate(minimum: 75);

      expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
      expect(
        result.stdout,
        contains('Authored lib coverage: 3/4 lines (75.00%)'),
      );

      final String merged = await mergedTrace.readAsString();
      expect(merged, contains('SF:lib/a.dart'));
      expect(merged, contains('SF:lib/b.dart'));
      expect(merged, contains('DA:2,1'));
      expect(merged, isNot(contains('a.g.dart')));
      expect(merged, isNot(contains('lib/generated/')));
    },
  );

  test(
    'exits non-zero when authored-lib coverage is below the threshold',
    () async {
      final ProcessResult result = await runGate(minimum: 80);

      expect(result.exitCode, 1);
      expect(result.stderr, contains('below required 80.00%'));
    },
  );
}

String _dartExecutable() {
  Directory directory = File(Platform.resolvedExecutable).parent;
  while (directory.parent.path != directory.path) {
    final File candidate = File('${directory.path}/bin/dart');
    if (candidate.existsSync()) {
      return candidate.path;
    }
    directory = directory.parent;
  }
  throw StateError('Could not locate Dart next to the Flutter SDK.');
}
