import 'package:thingsboard_client/thingsboard_client.dart';

abstract class DeviceProfileCache {
  static final _cache = Map<String, DeviceProfileInfo>();

  static Future<DeviceProfileInfo> getDeviceProfileInfo(
      ThingsboardClient tbClient, String name, String deviceId) async {
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
      ThingsboardClient tbClient, PageLink pageLink) async {
    var deviceProfileInfos = await tbClient
        .getDeviceProfileService()
        .getDeviceProfileInfos(pageLink);
    deviceProfileInfos.data.forEach((deviceProfile) {
      _cache[deviceProfile.name] = deviceProfile;
    });
    return deviceProfileInfos;
  }
}
