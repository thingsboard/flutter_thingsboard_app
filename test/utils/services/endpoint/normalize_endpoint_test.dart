// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/services/endpoint/normalize_endpoint.dart';

void main() {
  group('normalizeEndpoint', () {
    test('keeps an endpoint without a trailing slash', () {
      expect(normalizeEndpoint('https://h'), 'https://h');
    });

    test('strips multiple trailing slashes', () {
      expect(normalizeEndpoint('https://h///'), 'https://h');
    });

    test('keeps the path and strips only its trailing slash', () {
      expect(normalizeEndpoint('https://h/tb/'), 'https://h/tb');
    });

    test('trims surrounding whitespace', () {
      expect(normalizeEndpoint('  https://h/ \n'), 'https://h');
    });

    test('does not eat the scheme separator of a scheme-only value', () {
      expect(normalizeEndpoint('https://'), 'https://');
      expect(normalizeEndpoint('https:///'), 'https://');
    });

    test('keeps an empty endpoint empty', () {
      expect(normalizeEndpoint(''), '');
    });
  });
}
