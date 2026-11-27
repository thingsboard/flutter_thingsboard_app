// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:thingsboard_app/constants/app_constants.dart';

/// Values the E2E run passes with `--dart-define`.
///
/// The server is the app's own `thingsboardApiEndpoint`, so the app skips the
/// region page and the tests talk to the same server as the app.
abstract final class E2eEnv {
  static const serverUrl = ThingsboardAppConstants.thingsBoardApiEndpoint;
  static const tenantEmail = String.fromEnvironment('E2E_TENANT_EMAIL');
  static const tenantPassword = String.fromEnvironment('E2E_TENANT_PASSWORD');
  static const _runId = String.fromEnvironment('E2E_RUN_ID');

  /// Prefix of every entity the tests create, so leftovers can be found.
  static const entityPrefix = 'e2e-';

  /// Tells this run's entities apart from those of parallel runs.
  static final runId = _runId.isNotEmpty
      ? _runId
      : 'local${DateTime.now().millisecondsSinceEpoch}';

  static void check() {
    final missing = [
      if (serverUrl.isEmpty) 'thingsboardApiEndpoint',
      if (tenantEmail.isEmpty) 'E2E_TENANT_EMAIL',
      if (tenantPassword.isEmpty) 'E2E_TENANT_PASSWORD',
    ];
    if (missing.isNotEmpty) {
      throw TestFailure(
        'Missing --dart-define ${missing.join(', ')}. '
        'See CONTRIBUTING.md, "E2E tests".',
      );
    }
  }
}
