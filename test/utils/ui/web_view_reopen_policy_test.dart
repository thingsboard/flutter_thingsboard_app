// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/utils/ui/web_view_reopen_policy.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  late DateTime now;
  late List<WebViewReopen> reopens;
  late WebViewReopenPolicy policy;

  setUp(() {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    now = DateTime(2026, 11, 16, 12);
    reopens = [];
    policy = WebViewReopenPolicy(onReopen: reopens.add, now: () => now);
  });

  tearDown(() => policy.dispose());

  test('reopens the page at once in the foreground', () {
    policy.onProcessGone(inForeground: true);
    expect(reopens, [WebViewReopen.page]);
  });

  test('in the background waits for the app to come back', () {
    policy.onProcessGone(inForeground: false);
    expect(reopens, isEmpty);

    now = now.add(const Duration(hours: 3));
    policy.onResumed();
    policy.onResumed();
    expect(reopens, [WebViewReopen.page]);
  });

  test('coming back without a lost page reopens nothing', () {
    policy.onResumed();
    expect(reopens, isEmpty);
  });

  test('a page lost again right after a reopen starts without the page', () {
    policy.onProcessGone(inForeground: true);

    now = now.add(const Duration(seconds: 5));
    policy.onProcessGone(inForeground: true);
    expect(reopens, [WebViewReopen.page, WebViewReopen.withoutPage]);
  });

  test('a page lost again right after reopening on return starts without '
      'the page', () {
    policy.onProcessGone(inForeground: false);
    policy.onResumed();

    now = now.add(const Duration(seconds: 5));
    policy.onProcessGone(inForeground: true);
    expect(reopens, [WebViewReopen.page, WebViewReopen.withoutPage]);
  });

  test('a page lost in the background right after a reopen starts without '
      'the page on return', () {
    policy.onProcessGone(inForeground: true);

    now = now.add(const Duration(seconds: 5));
    policy.onProcessGone(inForeground: false);
    policy.onResumed();
    expect(reopens, [WebViewReopen.page, WebViewReopen.withoutPage]);
  });

  test('a page lost long after the last reopen reopens again', () {
    policy.onProcessGone(inForeground: true);

    now = now.add(const Duration(minutes: 1));
    policy.onProcessGone(inForeground: true);
    expect(reopens, [WebViewReopen.page, WebViewReopen.page]);
  });

  test('follows the app lifecycle by itself', () {
    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    policy.onProcessGone();
    expect(reopens, isEmpty);

    binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    expect(reopens, [WebViewReopen.page]);
  });
}
