// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/version_service/i_version_service.dart';
import 'package:thingsboard_app/utils/services/version_service/version_info.dart';

class VersionService implements IVersionService {
  final _deviceInfoService = getIt<IDeviceInfoService>();
  @override
  bool appUpdateRequired(VersionInfo versionInfo) {
    return _deviceInfoService.getAppVersion().versionInt() <
        (versionInfo.minVersion?.versionInt() ?? 0);
  }
}
