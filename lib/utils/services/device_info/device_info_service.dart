// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/device_info/platform_version.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DeviceInfoService implements IDeviceInfoService {
  late final AndroidDeviceInfo? androidInfo;
  late final IosDeviceInfo? iosInfo;
  late final String packageName;
  late final PlatformVersion version;
  late final PlatformType platform;
  late final String buildVersion;
  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    packageName = packageInfo.packageName;
    buildVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
    version = PlatformVersion.fromString(packageInfo.version);
    if (Platform.isAndroid) {
      androidInfo = await DeviceInfoPlugin().androidInfo;
      iosInfo = null;
      platform = PlatformType.ANDROID;
    } else if (Platform.isIOS) {
      iosInfo = await DeviceInfoPlugin().iosInfo;
      androidInfo = null;
      platform = PlatformType.IOS;
    } else {
      throw UnsupportedError('The app runs on Android and iOS only');
    }
  }

  @override
  bool isPhysicalDevice() {
    if (Platform.isAndroid) {
      return androidInfo!.isPhysicalDevice == true;
    }
    return iosInfo!.isPhysicalDevice;
  }

  @override
  String getSystemVersion() {
    if (Platform.isAndroid) {
      return androidInfo?.version.release ?? 'Unknown Android Version';
    }
    return iosInfo?.systemVersion ?? 'Unknown iOS Version';
  }

  @override
  String getApplicationId() {
    return packageName;
  }

  @override
  String getDeviceModel() {
    return Platform.isAndroid
        ? androidInfo?.model ?? 'Unknown Android Model'
        : iosInfo?.model ?? 'Unknown iOS Model';
  }

  @override
  PlatformType getPlatformType() {
    return platform;
  }

  @override
  PlatformVersion getAppVersion() {
    return version;
  }

  @override
  AndroidDeviceInfo? getAndroidDeviceInfo() {
    return androidInfo;
  }

  @override
  IosDeviceInfo? getIosDeviceInfo() {
    return iosInfo;
  }

  @override
  String getBuildVersion() {
    return buildVersion;
  }
}
