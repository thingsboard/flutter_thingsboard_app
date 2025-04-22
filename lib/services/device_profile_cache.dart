import 'package:thingsboard_app/thingsboard_client.dart';

abstract class DeviceProfileCache {
  static final _cache = <String, DeviceProfileInfo>{};

  static Future<DeviceProfileInfo> getDeviceProfileInfo(
    ThingsboardClient tbClient,
    String name,
    String deviceId,
  ) async {
    var deviceProfile = _cache[name];
    if (deviceProfile == null) {
      var device = await tbClient.getDeviceService().getDevice(deviceId);
      deviceProfile = await tbClient
          .getDeviceProfileService()
          .getDeviceProfileInfo(device!.deviceProfileId!.id!);
      _cache[name] = deviceProfile!;
    }
    return deviceProfile;
  }

  static Future<PageData<DeviceProfileInfo>> getDeviceProfileInfos(
    ThingsboardClient tbClient,
    PageLink pageLink,
  ) async {
    final deviceProfileInfos = await tbClient
        .getDeviceProfileService()
        .getDeviceProfileInfos(pageLink);

    for (final deviceProfile in deviceProfileInfos.data) {
      _cache[deviceProfile.name] = deviceProfile;
    }

    return deviceProfileInfos;
  }
}
