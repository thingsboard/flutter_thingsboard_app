import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The app imports the ThingsBoard client only through
/// lib/thingsboard_client.dart, which hides the generated models that clash
/// with Flutter and firebase names (see the comment there).
void main() {
  test('the client is imported only through lib/thingsboard_client.dart', () {
    const barrel = 'lib/thingsboard_client.dart';
    final directImport = RegExp(
      r'''^\s*(import|export)\s+['"]package:thingsboard_client/''',
      multiLine: true,
    );

    final offenders = [
      for (final dir in ['lib', 'test'])
        ...Directory(dir)
            .listSync(recursive: true)
            .whereType<File>()
            .where((f) => f.path.endsWith('.dart'))
            .where((f) => f.path != barrel)
            .where((f) => directImport.hasMatch(f.readAsStringSync()))
            .map((f) => f.path),
    ];

    expect(
      offenders,
      isEmpty,
      reason:
          "Import 'package:thingsboard_app/thingsboard_client.dart' instead.",
    );
  });
}
