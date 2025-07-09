import 'package:device_info_plus/device_info_plus.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

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
