// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/utils/services/version_service/version_info.dart';

abstract interface class IVersionService {
  bool appUpdateRequired(VersionInfo info);
}
