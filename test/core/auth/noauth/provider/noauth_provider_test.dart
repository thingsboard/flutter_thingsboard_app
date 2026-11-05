// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/auth/noauth/data/model/switch_endpoint_args.dart';
import 'package:thingsboard_app/core/auth/noauth/provider/noauth_provider.dart';

void main() {
  group('resolveSwitchHost', () {
    const previousEndpoint = 'https://previous';

    test('normalizes the host given in the link', () {
      final args = SwitchEndpointArgs(
        host: 'https://h/',
        uri: Uri.parse('https://other/qr'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), 'https://h');
    });

    test('falls back to the origin of an http(s) link', () {
      final args = SwitchEndpointArgs(
        uri: Uri.parse('https://h:8080/api/noauth/qr?secret=s'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), 'https://h:8080');
    });

    test('falls back to the origin of a plain http link', () {
      final args = SwitchEndpointArgs(
        uri: Uri.parse('http://h/api/noauth/qr?secret=s'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), 'http://h');
    });

    test('keeps the previous endpoint for a custom-scheme link', () {
      final args = SwitchEndpointArgs(
        uri: Uri.parse('thingsboard://login?secret=s'),
      );

      expect(resolveSwitchHost(args, previousEndpoint), previousEndpoint);
    });
  });
}
