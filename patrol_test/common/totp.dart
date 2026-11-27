// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

import 'package:crypto/crypto.dart';

/// Time-based one-time codes (RFC 6238) with the settings ThingsBoard uses:
/// SHA-1, 6 digits, 30-second steps.
class Totp {
  Totp(this._key);

  /// Reads the secret from an `otpauth://totp/...?secret=...` link, the form
  /// the server returns when it generates a TOTP setup.
  factory Totp.fromAuthUrl(String authUrl) {
    final secret = Uri.parse(authUrl).queryParameters['secret'];
    if (secret == null || secret.isEmpty) {
      throw ArgumentError.value(authUrl, 'authUrl', 'has no secret');
    }
    return Totp(_base32Decode(secret));
  }

  static const step = Duration(seconds: 30);

  final List<int> _key;

  String codeAt(DateTime time) {
    final counter = time.millisecondsSinceEpoch ~/ step.inMilliseconds;
    final message = ByteData(8)..setInt64(0, counter);
    final hash = Hmac(sha1, _key).convert(message.buffer.asUint8List()).bytes;
    final offset = hash.last & 0x0f;
    final value =
        ((hash[offset] & 0x7f) << 24) |
        (hash[offset + 1] << 16) |
        (hash[offset + 2] << 8) |
        hash[offset + 3];
    return (value % 1000000).toString().padLeft(6, '0');
  }

  String now() => codeAt(DateTime.now());

  /// Waits until the next step starts, so the next code differs from one the
  /// server has just accepted and cannot be refused as already used.
  static Future<void> waitForNextStep() async {
    final ms = DateTime.now().millisecondsSinceEpoch;
    final left = step.inMilliseconds - ms % step.inMilliseconds;
    await Future<void>.delayed(Duration(milliseconds: left + 1000));
  }

  static List<int> _base32Decode(String input) {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    final bytes = <int>[];
    var buffer = 0;
    var bits = 0;
    for (final char in input.toUpperCase().replaceAll('=', '').split('')) {
      final value = alphabet.indexOf(char);
      if (value < 0) {
        throw FormatException('Not a base32 character', input);
      }
      buffer = ((buffer << 5) | value) & 0xffff;
      bits += 5;
      if (bits >= 8) {
        bits -= 8;
        bytes.add((buffer >> bits) & 0xff);
      }
    }
    return bytes;
  }
}
