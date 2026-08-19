import 'dart:io';
import 'dart:math' as math;

/// Merges LCOV traces and fails when authored `lib/` coverage is below a
/// threshold.
///
/// **What the denominator actually is.** `flutter test --coverage` emits an
/// `SF:` record only for a library the run loaded, so a `lib/` file that no
/// test ever imports contributes nothing here and cannot pull the percentage
/// down. The gate therefore measures *authored `lib/` code that something
/// imported*, not all of it.
///
/// That is deliberate rather than overlooked. Seeding the map from a
/// `lib/**.dart` glob would drag in the composition root — the DI modules,
/// `bootstrap`, `main` — roughly 260 lines whose tests would assert that
/// registration code registers things. The percentage would drop by about
/// twelve points and the work to win it back would be the least valuable
/// tests in the repository. Coverage is a floor on logic, not on wiring.
///
/// The consequence to know: adding a `lib/` file and no test for it does not
/// move this number. Adding a *partly* tested file does.
void main(List<String> arguments) {
  String root = Directory.current.absolute.path;
  String output = 'coverage/lcov.info';
  double minimum = 80;
  final List<String> inputs = <String>[];

  for (final String argument in arguments) {
    if (argument.startsWith('--root=')) {
      root = argument.substring('--root='.length);
    } else if (argument.startsWith('--minimum=')) {
      minimum = double.parse(argument.substring('--minimum='.length));
    } else if (argument.startsWith('--output=')) {
      output = argument.substring('--output='.length);
    } else {
      inputs.add(argument);
    }
  }

  if (inputs.isEmpty) {
    stderr.writeln('At least one LCOV input is required.');
    exitCode = 2;
    return;
  }

  final Map<String, Map<int, int>> coverage = <String, Map<int, int>>{};
  for (final String input in inputs) {
    _mergeTrace(File(input), root, coverage);
  }

  final int found = coverage.values.fold<int>(
    0,
    (sum, lines) => sum + lines.length,
  );
  final int hit = coverage.values.fold<int>(
    0,
    (sum, lines) => sum + lines.values.where((count) => count > 0).length,
  );

  if (found == 0) {
    stderr.writeln('No authored lib lines were found in the LCOV inputs.');
    exitCode = 2;
    return;
  }

  final File merged = File(output);
  merged.parent.createSync(recursive: true);
  merged.writeAsStringSync(_encodeLcov(coverage));

  final double percentage = hit * 100 / found;
  stdout.writeln(
    'Authored lib coverage: $hit/$found lines '
    '(${percentage.toStringAsFixed(2)}%)',
  );
  if (percentage < minimum) {
    stderr.writeln(
      'Coverage ${percentage.toStringAsFixed(2)}% is below required '
      '${minimum.toStringAsFixed(2)}%.',
    );
    exitCode = 1;
  }
}

void _mergeTrace(File trace, String root, Map<String, Map<int, int>> coverage) {
  if (!trace.existsSync()) {
    throw FileSystemException('LCOV input does not exist', trace.path);
  }

  String? source;
  for (final String line in trace.readAsLinesSync()) {
    if (line.startsWith('SF:')) {
      source = _authoredPath(line.substring(3), root);
    } else if (line.startsWith('DA:') && source != null) {
      final List<String> fields = line.substring(3).split(',');
      if (fields.length < 2) continue;
      final int lineNumber = int.parse(fields[0]);
      final int hitCount = int.parse(fields[1]);
      final Map<int, int> lines = coverage.putIfAbsent(
        source,
        () => <int, int>{},
      );
      lines[lineNumber] = math.max(lines[lineNumber] ?? 0, hitCount);
    } else if (line == 'end_of_record') {
      source = null;
    }
  }
}

String? _authoredPath(String source, String root) {
  String path = source.replaceAll(r'\', '/');
  final String normalizedRoot = root
      .replaceAll(r'\', '/')
      .replaceFirst(RegExp(r'/$'), '');

  if (path.startsWith('$normalizedRoot/')) {
    path = path.substring(normalizedRoot.length + 1);
  }
  while (path.startsWith('./')) {
    path = path.substring(2);
  }

  if (!path.startsWith('lib/') ||
      path.startsWith('lib/generated/') ||
      path.endsWith('.g.dart') ||
      path.endsWith('.freezed.dart') ||
      path.endsWith('.mocks.dart')) {
    return null;
  }
  return path;
}

String _encodeLcov(Map<String, Map<int, int>> coverage) {
  final StringBuffer output = StringBuffer();
  final List<String> sources = coverage.keys.toList()..sort();
  for (final String source in sources) {
    final Map<int, int> lines = coverage[source]!;
    final List<int> lineNumbers = lines.keys.toList()..sort();
    output
      ..writeln('TN:')
      ..writeln('SF:$source');
    for (final int lineNumber in lineNumbers) {
      output.writeln('DA:$lineNumber,${lines[lineNumber]}');
    }
    output
      ..writeln('LF:${lineNumbers.length}')
      ..writeln('LH:${lineNumbers.where((line) => lines[line]! > 0).length}')
      ..writeln('end_of_record');
  }
  return output.toString();
}
