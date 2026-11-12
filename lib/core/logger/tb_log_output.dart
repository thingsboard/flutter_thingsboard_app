// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class TbLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      debugPrint(_redactSecrets(line));
    }
  }
}

const _secretKeys =
    'accessToken|refreshToken|appToken|token|secret|emailCode|activateToken'
    '|resetToken|code';

/// `key=value` in a URL or form, and `key: value` / `"key": "value"` in a
/// map or JSON.
final _secretValue = RegExp(
  '(\\b(?:$_secretKeys)\\b"?\\s*[=:]\\s*"?)([^&\\s",}\\]#]+)',
  caseSensitive: false,
);
final _bearer = RegExp(r'(Bearer\s+)[^\s",}]+', caseSensitive: false);
final _jwt = RegExp(r'eyJ[\w-]+\.[\w-]+\.[\w-]+');

/// Log lines go to the device log, which other tools can read: tokens, login
/// codes and one-time secrets in them are replaced with `***`.
String _redactSecrets(String line) => line
    .replaceAllMapped(_secretValue, (m) => '${m[1]}***')
    .replaceAllMapped(_bearer, (m) => '${m[1]}***')
    .replaceAll(_jwt, '***');
