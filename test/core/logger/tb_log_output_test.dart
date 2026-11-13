// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';

const _jwt =
    'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyQGV4YW1wbGUuY29tIn0.c2lnbmF0dXJl';

void main() {
  late List<String> printed;

  setUp(() {
    printed = [];
    final original = debugPrint;
    debugPrint = (message, {wrapWidth}) => printed.add(message ?? '');
    addTearDown(() => debugPrint = original);
  });

  String logged(String message) {
    TbLogger().debug(message);
    return printed.join('\n');
  }

  test('a dashboard URL keeps its host but not its tokens', () {
    final out = logged(
      'onLoadStart: https://tb.example/?accessToken=$_jwt&refreshToken=$_jwt',
    );

    expect(out, contains('onLoadStart: https://tb.example/?accessToken=***'));
    expect(out, contains('refreshToken=***'));
    expect(out, isNot(contains('eyJ')));
  });

  test('a login code link keeps its path but not its secret', () {
    final out = logged(
      'navigate by appLink https://tb.example/api/noauth/qr?secret=abc123&ttl=5',
    );

    expect(out, contains('/api/noauth/qr?secret=***&ttl=5'));
    expect(out, isNot(contains('abc123')));
  });

  test('tokens in a map or a header are hidden', () {
    final out = logged(
      'args: [home, {}, {accessToken: $_jwt, refreshToken: r-1}] '
      'X-Authorization: Bearer opaque-value',
    );

    expect(out, isNot(contains('eyJ')));
    expect(out, isNot(contains('r-1')));
    expect(out, isNot(contains('opaque-value')));
    expect(out, contains('args: [home, {}, {accessToken: ***'));
  });

  test('a token on its own is hidden', () {
    expect(logged('token from storage $_jwt'), isNot(contains('eyJ')));
  });

  test('text without secrets is logged as it is', () {
    final out = logged('NotificationService::logout() removeMobileSession');

    expect(out, contains('NotificationService::logout() removeMobileSession'));
  });
}
