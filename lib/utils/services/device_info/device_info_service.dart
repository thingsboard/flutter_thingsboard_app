import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:universal_platform/universal_platform.dart';

class DeviceInfoService implements IDeviceInfoService {
  late final AndroidDeviceInfo? androidInfo;
  late final IosDeviceInfo? iosInfo;
  late final String packageName;
  late final PlatformVersion version;
  late final PlatformType platform;
  late final String buildVersion;
  Future<void> init() async {
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      final packageInfo = await PackageInfo.fromPlatform();
      packageName = packageInfo.packageName;
      buildVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
      version = PlatformVersion.fromString(packageInfo.version);
    } else {
      packageName = 'web.app';
      androidInfo = null;
      iosInfo = null;
      platform = PlatformType.WEB;
    }
    if (UniversalPlatform.isAndroid) {
      androidInfo = await DeviceInfoPlugin().androidInfo;
      iosInfo = null;
      platform = PlatformType.ANDROID;
    } else if (UniversalPlatform.isIOS) {
      iosInfo = await DeviceInfoPlugin().iosInfo;
      androidInfo = null;
      platform = PlatformType.IOS;
    }
  }

  @override
  bool isPhysicalDevice() {
    if (UniversalPlatform.isAndroid) {
      return androidInfo!.isPhysicalDevice == true;
    } else if (UniversalPlatform.isIOS) {
      return iosInfo!.isPhysicalDevice;
    } else {
      return false;
    }
  }

  @override
  String getSystemVersion() {
    if (UniversalPlatform.isAndroid) {
      return androidInfo?.version.release ?? 'Unknown Android Version';
    } else if (UniversalPlatform.isIOS) {
      return iosInfo?.systemVersion ?? 'Unknown iOS Version';
    } else {
      return 'Unknown Platform Version';
    }
  }

  @override
  String getApplicationId() {
    return packageName;
  }

  @override
  String getDeviceModel() {
    return UniversalPlatform.isAndroid
        ? androidInfo?.model ?? 'Unknown Android Model'
        : UniversalPlatform.isIOS
            ? iosInfo?.model ?? 'Unknown iOS Model'
            : 'Unknown Device Model';
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
