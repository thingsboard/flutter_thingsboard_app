// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/version/presentation/view/update_required_page.dart';

class VersionRoutes {
  static const updateRequired = '/updateRequired';
}

// Version routes
final versionRoutes = [
  GoRoute(
    path: VersionRoutes.updateRequired,
    builder: (context, state) {
      // Version arguments would need to be passed via query parameters or state
      return const UpdateRequiredPage();
    },
  ),
];
