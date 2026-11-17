// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

/// How a web view whose page process is gone starts again.
enum WebViewReopen {
  /// With the page it showed.
  page,

  /// Without that page, which was lost again within
  /// [WebViewReopenPolicy.loopWindow] of the last reopen. The host decides
  /// what to show instead.
  withoutPage,
}

/// When a web view whose page process is gone starts again, and how.
///
/// The system ends that process to free memory, mostly while the app is in the
/// background, and would end a web view started there too: a loss in the
/// background waits for the app to come back. A page lost again within
/// [loopWindow] of a reopen keeps failing to load (too heavy for the device,
/// or it crashes the engine), so it is not opened again: [onReopen] gets
/// [WebViewReopen.withoutPage].
class WebViewReopenPolicy {
  WebViewReopenPolicy({
    required this.onReopen,
    DateTime Function()? now,
    this.loopWindow = const Duration(seconds: 15),
  }) : _now = now ?? DateTime.now {
    _appLifecycle = AppLifecycleListener(onResume: onResumed);
  }

  final void Function(WebViewReopen reopen) onReopen;
  final DateTime Function() _now;
  final Duration loopWindow;
  late final AppLifecycleListener _appLifecycle;
  bool _waitingForApp = false;
  DateTime? _lastReopen;

  /// Reports the page process gone. [inForeground] defaults to the app's
  /// current lifecycle state.
  void onProcessGone({bool? inForeground}) {
    final foreground =
        inForeground ??
        WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;
    if (!foreground) {
      _waitingForApp = true;
      return;
    }
    onReopen(_next());
  }

  @visibleForTesting
  void onResumed() {
    if (!_waitingForApp) return;
    _waitingForApp = false;
    onReopen(_next());
  }

  WebViewReopen _next() {
    final now = _now();
    final last = _lastReopen;
    if (last != null && now.difference(last) < loopWindow) {
      return WebViewReopen.withoutPage;
    }
    _lastReopen = now;
    return WebViewReopen.page;
  }

  void dispose() => _appLifecycle.dispose();
}
