import 'dart:io' show Platform;

import 'package:package_info_plus/package_info_plus.dart';
import 'package:thingsboard_app/core/entities/entities.dart' show TbPlatform;
import 'package:thingsboard_app/services/system/i_system_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class SystemService implements ISystemService {
  StoreInfo? _storeInfo;
  VersionInfo? _versionInfo;
  late final PlatformVersion _appVersion;
  late final PackageInfo _packageInfo;

  @override
  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    _appVersion = PlatformVersion.fromString(_packageInfo.version);
  }

  @override
  Future<String> getPackageName() async {
    return _packageInfo.packageName;
  }

  @override
  TbPlatform getPlatform() {
    return TbPlatform(isIos: Platform.isIOS, isAndroid: Platform.isAndroid);
  }

  @override
  void setStoreInfo(StoreInfo? storeInfo) {
    _storeInfo = storeInfo;
  }

  @override
  void setVersionInfo(VersionInfo? versionInfo) {
    _versionInfo = versionInfo;
  }

  @override
  bool isClientVersionSuitable() {
    return _appVersion.versionInt() >
        (_versionInfo?.minVersion?.versionInt() ?? 0);
  }
}
