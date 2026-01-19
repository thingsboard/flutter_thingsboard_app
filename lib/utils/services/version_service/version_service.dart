import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/version_service/i_version_service.dart';
import 'package:thingsboard_client/src/model/mobile/version_info.dart';

class VersionService implements IVersionService {
  final _deviceInfoService = getIt<IDeviceInfoService>();
  @override
  bool appUpdateRequired(VersionInfo versionInfo) {
    return _deviceInfoService.getAppVersion().versionInt() <
        (versionInfo.minVersion?.versionInt() ?? 0);
  }
}
