import 'package:thingsboard_app/utils/services/device_info/platform_version.dart';
import 'package:thingsboard_ce_client/src/model/mobile_app_version_info.dart';

class VersionInfo {
  const VersionInfo({
    this.minVersion,
    this.minVersionReleaseNotes,
    this.latestVersion,
    this.latestVersionReleaseNotes,
  });

  factory VersionInfo.fromMobileAppVersionInfo(MobileAppVersionInfo info) {
    return VersionInfo(
      minVersion: info.minVersion != null && info.minVersion!.isNotEmpty
          ? _tryParse(info.minVersion!)
          : null,
      minVersionReleaseNotes: info.minVersionReleaseNotes,
      latestVersion:
          info.latestVersion != null && info.latestVersion!.isNotEmpty
              ? _tryParse(info.latestVersion!)
              : null,
      latestVersionReleaseNotes: info.latestVersionReleaseNotes,
    );
  }

  static VersionInfo? fromNullable(MobileAppVersionInfo? info) =>
      info == null ? null : VersionInfo.fromMobileAppVersionInfo(info);

  static PlatformVersion? _tryParse(String v) {
    try {
      return PlatformVersion.fromString(v);
    } catch (_) {
      return null;
    }
  }

  final PlatformVersion? minVersion;
  final String? minVersionReleaseNotes;
  final PlatformVersion? latestVersion;
  final String? latestVersionReleaseNotes;
}
