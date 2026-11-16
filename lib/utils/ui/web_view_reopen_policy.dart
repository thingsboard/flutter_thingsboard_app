// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// When a web view whose page process is gone opens its page again.
///
/// The system ends that process to free memory, mostly while the app is in the
/// background, and would end a page reopened there too: it waits for the app
/// to come back. A page lost again within [loopWindow] of a reopen keeps
/// failing to load (too heavy for the device, or it crashes the engine), so it
/// stays closed instead of reloading in a loop.
class WebViewReopenPolicy {
  WebViewReopenPolicy({
    DateTime Function()? now,
    this.loopWindow = const Duration(seconds: 15),
  }) : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final Duration loopWindow;
  bool _waitingForApp = false;
  DateTime? _lastReopen;

  /// Whether to reopen the page now.
  bool onProcessGone({required bool inForeground}) {
    if (!inForeground) {
      _waitingForApp = true;
      return false;
    }
    return _reopen();
  }

  /// Whether a page lost in the background is to be reopened now that the app
  /// is back.
  bool onResumed() {
    if (!_waitingForApp) return false;
    _waitingForApp = false;
    return _reopen();
  }

  bool _reopen() {
    final now = _now();
    final last = _lastReopen;
    if (last != null && now.difference(last) < loopWindow) return false;
    _lastReopen = now;
    return true;
  }
}
