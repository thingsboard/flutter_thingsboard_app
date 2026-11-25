// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:device_info_plus/device_info_plus.dart';
import 'package:thingsboard_app/utils/services/device_info/platform_version.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IDeviceInfoService {
  String getApplicationId();
  String getDeviceModel();
  String getSystemVersion();
  PlatformType getPlatformType();
  bool isPhysicalDevice();
  PlatformVersion getAppVersion();
  AndroidDeviceInfo? getAndroidDeviceInfo();
  IosDeviceInfo? getIosDeviceInfo();
  String getBuildVersion();
}
