// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// The email verification link redirects to the registration redirect scheme
/// (`tbscheme://...`). iOS opens the app only if the build's Info.plist
/// registers that scheme, and debug and release builds use separate files.
void main() {
  for (final name in ['Info-Debug.plist', 'Info-Release.plist']) {
    test('$name registers the registration redirect scheme', () {
      final plist = File('ios/Runner/$name').readAsStringSync();

      expect(
        plist,
        matches(
          RegExp(
            r'<key>CFBundleURLTypes</key>[\s\S]*?'
            r'<key>CFBundleURLSchemes</key>\s*<array>\s*'
            r'<string>\$\(REGISTRATIONREDIRECTURLSCHEME\)</string>',
          ),
        ),
      );
    });
  }
}
