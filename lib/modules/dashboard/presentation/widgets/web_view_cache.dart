// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// How long a web view waits for the cache to be cleared before it starts.
const webViewCacheClearTimeout = Duration(seconds: 2);

/// Clears the web view cache, but waits at most [timeout] for it.
///
/// On iOS 17 WebKit sometimes takes a minute to clear the cache, or never
/// finishes, and a web view that waited for it showed only its loading
/// spinner. The clear removes cached files only, not cookies or local
/// storage, so the page can load while it is still running. [onTimeout] is
/// called when the wait ends before the clear. A failed clear still completes
/// with its error, as before.
Future<void> clearWebViewCache({
  Duration timeout = webViewCacheClearTimeout,
  Future<void> Function() clear = InAppWebViewController.clearAllCache,
  void Function()? onTimeout,
}) {
  return clear().timeout(timeout, onTimeout: () => onTimeout?.call());
}
