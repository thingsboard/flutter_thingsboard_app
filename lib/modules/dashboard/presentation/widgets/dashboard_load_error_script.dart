// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:thingsboard_app/utils/services/export_module.dart';

const dashboardLoadErrorHandler = 'tbDashboardLoadErrorHandler';

/// Reports a failed dashboard request (e.g. no permission): iOS reports HTTP
/// errors only for navigations, Android also for XHR (`onReceivedHttpError`).
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

List<UserScript> dashboardUserScripts(TargetPlatform platform) => [
  TbDashboardExportModule.blobDownloadScript,
  if (platform == TargetPlatform.iOS) dashboardLoadErrorScript,
];
