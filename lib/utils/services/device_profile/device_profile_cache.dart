import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_profile/model/cached_device_profile.dart';
import 'package:thingsboard_app/utils/services/entity_query_api.dart';

abstract class DeviceProfileCache {
  static final _cache = <String, CachedDeviceProfileInfo>{};

  static Future<CachedDeviceProfileInfo> getDeviceProfileInfo(
    ThingsboardClient tbClient,
    String name,
    String deviceId,
  ) async {
    final deviceProfile = _cache[name];
    if (deviceProfile == null) {
      final device = await tbClient.getDeviceService().getDevice(deviceId);
      final info = await tbClient
          .getDeviceProfileService()
          .getDeviceProfileInfo(device!.deviceProfileId!.id!);
      final cache = CachedDeviceProfileInfo(
        activeCount: null,
        inactiveCount: null,
        info: info!,
      );
      _cache[name] = cache;
      return cache;
    }
    return deviceProfile;
  }

  static Future<CachedDeviceProfileInfo> getDevicesCount(
    ThingsboardClient tbClient,
    String deviceProfileName,
  ) async {
    final baseCache = _cache[deviceProfileName]!;
    if (baseCache.activeCount != null) {
      return baseCache;
    }

    final data = await Future.wait([
      EntityQueryApi.countDevices(
        tbClient,
        deviceType: deviceProfileName,
        active: true,
      ).then((e) => CountedDevices(active: true, count: e)),
      EntityQueryApi.countDevices(
        tbClient,
        deviceType: deviceProfileName,
        active: false,
      ).then((e) => CountedDevices(active: false, count: e)),
    ]);
    final active = data.firstWhere((e) => e.active);
    final inactive = data.firstWhere((e) => !e.active);
    final updated = baseCache.copyWith(
      activeCount: active.count,
      inactiveCount: inactive.count,
    );
    _cache[deviceProfileName] = updated;
    return updated;
  }

  static Future<PageData<DeviceProfileInfo>> getDeviceProfileInfos(
    ThingsboardClient tbClient,
    PageLink pageLink, {
    bool invalidateCache = false,
  }) async {
    final deviceProfileInfos = await tbClient
        .getDeviceProfileService()
        .getDeviceProfileInfos(pageLink);
    if (invalidateCache) {
      _cache.clear();
    }
    for (final deviceProfile in deviceProfileInfos.data) {
      final existing = _cache[deviceProfile.name];
      if(existing == null) {
   _cache[deviceProfile.name] = CachedDeviceProfileInfo(
        activeCount: null,
        inactiveCount: null,
        info: deviceProfile,
      );
      }
   
    }

    return deviceProfileInfos;
  }
}

class CountedDevices {
  CountedDevices({required this.active, required this.count});
  final bool active;
  final int count;
}
