// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/web_view_cache.dart';

void main() {
  const timeout = Duration(milliseconds: 100);

  group('clearWebViewCache', () {
    test('the default wait is 2 seconds', () {
      expect(webViewCacheClearTimeout, const Duration(seconds: 2));
    });

    test('completes when the cache is cleared in time', () async {
      var cleared = false;
      var timedOut = false;

      await clearWebViewCache(
        timeout: timeout,
        clear: () async => cleared = true,
        onTimeout: () => timedOut = true,
      );

      expect(cleared, isTrue);
      expect(timedOut, isFalse);
    });

    test('completes after the timeout when the clear never finishes', () async {
      var timedOut = false;
      final watch = Stopwatch()..start();

      await clearWebViewCache(
        timeout: timeout,
        clear: () => Completer<void>().future,
        onTimeout: () => timedOut = true,
      );

      expect(timedOut, isTrue);
      expect(watch.elapsed, greaterThanOrEqualTo(timeout));
    });

    test(
      'a clear that fails after the timeout is not an uncaught error',
      () async {
        final clear = Completer<void>();

        await clearWebViewCache(timeout: timeout, clear: () => clear.future);
        clear.completeError(Exception('WebKit failed'));
        // An uncaught error here would fail the test.
        await Future<void>.delayed(Duration.zero);
      },
    );

    test('a clear that fails in time completes with its error', () {
      expect(
        clearWebViewCache(
          timeout: timeout,
          clear: () => Future.error(Exception('WebKit failed')),
        ),
        throwsException,
      );
    });
  });
}
