import 'dart:io';

/// Renames this boilerplate into a real project.
///
/// ```sh
/// make rename NAME=acme_wallet ORG=com.acme DISPLAY="Acme Wallet"
/// ```
///
/// Rewrites, in one pass:
///
/// - `pubspec.yaml` `name:`
/// - every `package:<old>/` import across `lib/`, `test/`, `integration_test/`
///   and `tool/`
/// - the Android `namespace` and `applicationId`
/// - the Android Kotlin package declaration, and the directory holding it
/// - `flavorizr.yaml` application ids, bundle ids, and display names
///
/// It does NOT touch the iOS project directly. Bundle identifiers there are
/// generated from `flavorizr.yaml`, so `make rename` runs `make flavorize`
/// afterwards and that is what rewrites them. Editing `project.pbxproj` by
/// hand and then regenerating it would just produce a confusing diff.
///
/// Idempotent in the sense that running it twice with the same arguments is
/// a no-op; running it with new arguments renames again from whatever the
/// current name is, which it reads out of `pubspec.yaml`.
Future<void> main(List<String> args) async {
  final _Options? options = _parse(args);
  if (options == null) exitCode = 64;
  if (options == null) return;

  final Directory root = Directory.current;
  final File pubspec = File('${root.path}/pubspec.yaml');
  if (!pubspec.existsSync()) {
    _fail('No pubspec.yaml in ${root.path}. Run this from the project root.');
    return;
  }

  final String oldName = _currentPackageName(pubspec);
  final String oldOrg = _currentOrg();

  if (oldName == options.name && oldOrg == options.org) {
    stdout.writeln(
      'Already named ${options.name} (${options.org}). Nothing '
      'to do.',
    );
    return;
  }

  stdout
    ..writeln('package  $oldName -> ${options.name}')
    ..writeln('org      $oldOrg -> ${options.org}')
    ..writeln('display  -> ${options.display}')
    ..writeln();

  _rewriteDartImports(root, oldName, options.name);
  _rewritePubspec(pubspec, oldName, options.name);
  _rewriteAndroidGradle(oldOrg, oldName, options);
  _moveKotlinPackage(oldOrg, oldName, options);
  _rewriteFlavorizr(oldOrg, oldName, options);

  stdout
    ..writeln()
    ..writeln('Done. Next:')
    ..writeln(
      '  make flavorize   # rewrites iOS bundle ids and Android '
      'flavors',
    )
    ..writeln('  make setup       # re-resolve and regenerate')
    ..writeln()
    ..writeln(
      'Then review `git diff` — this rewrote source, Gradle, and '
      'flavor config.',
    );
}

class _Options {
  const _Options({
    required this.name,
    required this.org,
    required this.display,
  });

  /// Dart package name: lower_snake_case.
  final String name;

  /// Reverse-DNS organisation prefix, without the app segment.
  final String org;

  /// Human-readable app name, shown on the device.
  final String display;

  /// The production application id / bundle id.
  String get applicationId => '$org.$name';
}

_Options? _parse(List<String> args) {
  final Map<String, String> values = <String, String>{};
  for (final String arg in args) {
    final int separator = arg.indexOf('=');
    if (!arg.startsWith('--') || separator == -1) {
      _fail('Unrecognised argument: $arg');
      return null;
    }
    values[arg.substring(2, separator)] = arg.substring(separator + 1);
  }

  final String? name = values['name'];
  final String? org = values['org'];
  if (name == null || org == null) {
    _fail(
      'Usage: dart run tool/rename.dart --name=<package> --org=<com.example> '
      '[--display=<App Name>]',
    );
    return null;
  }

  // A Dart package name that is not a valid identifier fails much later, at
  // `pub get`, with an error that does not mention this tool.
  if (!RegExp(r'^[a-z][a-z0-9_]*$').hasMatch(name)) {
    _fail('--name must be lower_snake_case and start with a letter: $name');
    return null;
  }
  if (!RegExp(r'^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$').hasMatch(org)) {
    _fail('--org must be reverse-DNS, such as com.example: $org');
    return null;
  }
  // Android rejects a package whose segments collide with Java keywords, and
  // the failure surfaces as an opaque Gradle error.
  const Set<String> reserved = <String>{'new', 'class', 'package', 'int'};
  final Set<String> segments = <String>{...org.split('.'), name};
  final Iterable<String> clashes = segments.where(reserved.contains);
  if (clashes.isNotEmpty) {
    _fail('Reserved word in package name: ${clashes.join(', ')}');
    return null;
  }

  return _Options(
    name: name,
    org: org,
    display: values['display'] ?? _titleCase(name),
  );
}

String _titleCase(String snake) => snake
    .split('_')
    .where((String part) => part.isNotEmpty)
    .map((String part) => part[0].toUpperCase() + part.substring(1))
    .join(' ');

String _currentPackageName(File pubspec) {
  final RegExpMatch? match = RegExp(
    r'^name:\s*(\S+)',
    multiLine: true,
  ).firstMatch(pubspec.readAsStringSync());
  if (match == null) throw StateError('pubspec.yaml has no name field.');
  return match.group(1)!;
}

String _currentOrg() {
  final File gradle = File('android/app/build.gradle.kts');
  final RegExpMatch? match = RegExp(
    r'namespace\s*=\s*"([^"]+)"',
  ).firstMatch(gradle.readAsStringSync());
  if (match == null) {
    throw StateError('android/app/build.gradle.kts has no namespace.');
  }
  final List<String> parts = match.group(1)!.split('.');
  return parts.take(parts.length - 1).join('.');
}

void _rewriteDartImports(Directory root, String oldName, String newName) {
  const List<String> searched = <String>[
    'lib',
    'test',
    'integration_test',
    'tool',
  ];
  int changed = 0;
  for (final String directory in searched) {
    final Directory dir = Directory('${root.path}/$directory');
    if (!dir.existsSync()) continue;
    for (final FileSystemEntity entity in dir.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final String source = entity.readAsStringSync();
      final String rewritten = source.replaceAll(
        'package:$oldName/',
        'package:$newName/',
      );
      if (rewritten == source) continue;
      entity.writeAsStringSync(rewritten);
      changed++;
    }
  }
  stdout.writeln('imports    $changed Dart files');
}

void _rewritePubspec(File pubspec, String oldName, String newName) {
  final String source = pubspec.readAsStringSync();
  pubspec.writeAsStringSync(
    source.replaceFirst(
      RegExp('^name:\\s*$oldName', multiLine: true),
      'name: $newName',
    ),
  );
  stdout.writeln('pubspec    name');
}

void _rewriteAndroidGradle(String oldOrg, String oldName, _Options options) {
  final String oldId = '$oldOrg.$oldName';
  for (final String path in <String>[
    'android/app/build.gradle.kts',
    'android/app/flavorizr.gradle.kts',
  ]) {
    final File file = File(path);
    if (!file.existsSync()) continue;
    file.writeAsStringSync(
      file.readAsStringSync().replaceAll(oldId, options.applicationId),
    );
  }
  stdout.writeln('android    namespace and applicationId');
}

void _moveKotlinPackage(String oldOrg, String oldName, _Options options) {
  final String oldPath =
      'android/app/src/main/kotlin/${'$oldOrg.$oldName'.replaceAll('.', '/')}';
  final Directory oldDir = Directory(oldPath);
  if (!oldDir.existsSync()) {
    stdout.writeln('kotlin     skipped (no $oldPath)');
    return;
  }

  final String newPath =
      'android/app/src/main/kotlin/${options.applicationId.replaceAll('.', '/')}';
  Directory(newPath).createSync(recursive: true);

  for (final FileSystemEntity entity in oldDir.listSync()) {
    if (entity is! File) continue;
    final String source = entity.readAsStringSync().replaceAll(
      'package $oldOrg.$oldName',
      'package ${options.applicationId}',
    );
    final String name = entity.uri.pathSegments.last;
    File('$newPath/$name').writeAsStringSync(source);
    entity.deleteSync();
  }

  // Walk up removing the directories the old package left behind, stopping at
  // the first one that still holds something — another package may share a
  // prefix with the old one.
  Directory cursor = oldDir;
  while (cursor.path.contains('kotlin/') && cursor.existsSync()) {
    if (cursor.listSync().isNotEmpty) break;
    final Directory parent = cursor.parent;
    cursor.deleteSync();
    cursor = parent;
  }
  stdout.writeln('kotlin     package moved to $newPath');
}

void _rewriteFlavorizr(String oldOrg, String oldName, _Options options) {
  final File file = File('flavorizr.yaml');
  if (!file.existsSync()) {
    stdout.writeln('flavorizr  skipped (no flavorizr.yaml)');
    return;
  }
  final String oldId = '$oldOrg.$oldName';
  String source = file.readAsStringSync().replaceAll(
    oldId,
    options.applicationId,
  );

  // Display names are per flavor and carry a suffix, so they cannot be a
  // straight substitution of the old id. Rewrite the `name:` under each
  // flavor's `app:` instead, keeping whatever suffix is already there.
  source = source.replaceAllMapped(
    RegExp(r'(\n {4}app:\n {6}name: ")([^"]*)(")'),
    (Match match) {
      final String current = match.group(2)!;
      final String suffix = current.contains(' ')
          ? current.substring(current.indexOf(' '))
          : '';
      return '${match.group(1)}${options.display}$suffix${match.group(3)}';
    },
  );

  file.writeAsStringSync(source);
  stdout.writeln('flavorizr  ids and display names');
}

void _fail(String message) => stderr.writeln('rename: $message');
