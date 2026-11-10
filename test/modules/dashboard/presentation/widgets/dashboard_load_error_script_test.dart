// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_load_error_script.dart';

void main() {
  final blob = UserScript(
    source: 'blob',
    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
  );

  test('iOS reports failed dashboard requests from the page', () {
    expect(dashboardUserScripts(TargetPlatform.iOS, blob), [
      blob,
      dashboardLoadErrorScript,
    ]);
    expect(
      dashboardLoadErrorScript.source,
      allOf(contains('/api/dashboard/'), contains(dashboardLoadErrorHandler)),
    );
  });

  test('Android keeps its native HTTP error callback only', () {
    expect(dashboardUserScripts(TargetPlatform.android, blob), [blob]);
  });
}
