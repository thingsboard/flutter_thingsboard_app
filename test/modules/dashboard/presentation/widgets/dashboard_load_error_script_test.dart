// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/modules/dashboard/presentation/widgets/dashboard_load_error_script.dart';
import 'package:thingsboard_app/utils/services/export_module.dart';

void main() {
  final blob = TbDashboardExportModule.blobDownloadScript;

  test('iOS reports failed dashboard requests from the page', () {
    expect(dashboardUserScripts(TargetPlatform.iOS), [
      blob,
      dashboardLoadErrorScript,
    ]);
    expect(
      dashboardLoadErrorScript.source,
      allOf(contains('/api/dashboard/'), contains(dashboardLoadErrorHandler)),
    );
  });

  test('Android keeps its native HTTP error callback only', () {
    expect(dashboardUserScripts(TargetPlatform.android), [blob]);
  });
}
