// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const dashboardLoadErrorHandler = 'tbDashboardLoadErrorHandler';

/// Reports a failed dashboard request (e.g. no permission) to
/// [dashboardLoadErrorHandler]. iOS reports HTTP errors only for page
/// navigations, not for the web UI's XHR calls; Android has
/// `onReceivedHttpError` for them.
final dashboardLoadErrorScript = UserScript(
  injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
  source:
      '''
(function () {
  const open = XMLHttpRequest.prototype.open;
  XMLHttpRequest.prototype.open = function (method, url) {
    if (String(url).includes('/api/dashboard/')) {
      this.addEventListener('loadend', () => {
        if (this.status >= 400) {
          window.flutter_inappwebview.callHandler('$dashboardLoadErrorHandler', this.status);
        }
      });
    }
    return open.apply(this, arguments);
  };
})();
''',
);

/// The scripts a dashboard web view starts with on [platform].
List<UserScript> dashboardUserScripts(
  TargetPlatform platform,
  UserScript blobDownloadScript,
) => [
  blobDownloadScript,
  if (platform == TargetPlatform.iOS) dashboardLoadErrorScript,
];
