// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/web_view_reopen_policy.dart';

void main() {
  late DateTime now;
  late WebViewReopenPolicy policy;

  setUp(() {
    now = DateTime(2026, 11, 16, 12);
    policy = WebViewReopenPolicy(now: () => now);
  });

  test('reopens at once in the foreground', () {
    expect(policy.onProcessGone(inForeground: true), isTrue);
  });

  test('in the background waits for the app to come back', () {
    expect(policy.onProcessGone(inForeground: false), isFalse);

    now = now.add(const Duration(hours: 3));
    expect(policy.onResumed(), isTrue);
    expect(policy.onResumed(), isFalse);
  });

  test('coming back without a lost page reopens nothing', () {
    expect(policy.onResumed(), isFalse);
  });

  test('a page lost again right after a reopen stays closed', () {
    expect(policy.onProcessGone(inForeground: true), isTrue);

    now = now.add(const Duration(seconds: 5));
    expect(policy.onProcessGone(inForeground: true), isFalse);
  });

  test('a page lost again right after reopening on return stays closed', () {
    policy.onProcessGone(inForeground: false);
    expect(policy.onResumed(), isTrue);

    now = now.add(const Duration(seconds: 5));
    expect(policy.onProcessGone(inForeground: true), isFalse);
  });

  test('a page lost long after the last reopen reopens again', () {
    expect(policy.onProcessGone(inForeground: true), isTrue);

    now = now.add(const Duration(minutes: 1));
    expect(policy.onProcessGone(inForeground: true), isTrue);
  });
}
