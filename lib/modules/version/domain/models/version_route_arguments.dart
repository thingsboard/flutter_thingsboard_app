// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/core/auth/login/models/version_info.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class VersionRouteArguments {
  const VersionRouteArguments({
    required this.versionInfo,
    required this.storeInfo,
  });

  final VersionInfo versionInfo;
  final StoreInfo? storeInfo;
}
