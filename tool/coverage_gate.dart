import 'dart:io';
import 'dart:math' as math;

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
