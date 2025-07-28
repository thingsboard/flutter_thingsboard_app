import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
part 'cached_device_profile.freezed.dart';
@freezed
abstract class CachedDeviceProfileInfo with _$CachedDeviceProfileInfo {

const   factory CachedDeviceProfileInfo(
 {
  required int? activeCount, 
  required int? inactiveCount,
  required DeviceProfileInfo info
 }
) = _CachedDeviceProfileInfo;
}