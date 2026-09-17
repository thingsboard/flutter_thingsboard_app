import 'package:built_value/json_object.dart';
import 'package:thingsboard_app/utils/services/layouts/pages_layout.dart';
import 'package:thingsboard_app/utils/services/version_service/version_info.dart';
import 'package:thingsboard_ce_client/thingsboard_ce_client.dart';

class MobileBasicInfo {
  const MobileBasicInfo({
    this.user,
    this.homeDashboardInfo,
    this.pages,
    this.storeInfo,
    this.versionInfo,
  });

  factory MobileBasicInfo.fromUserMobileInfo(UserMobileInfo info) {
    return MobileBasicInfo(
      user: info.user,
      homeDashboardInfo: info.homeDashboardInfo,
      pages: _parsePages(info.pages),
      storeInfo: info.storeInfo,
      versionInfo: VersionInfo.fromNullable(info.versionInfo),
    );
  }

  static List<PageLayout>? _parsePages(JsonObject? pages) {
    if (pages == null || !pages.isList) return null;
    return pages.asList
        .whereType<Map<String, dynamic>>()
        .map(PageLayout.fromJson)
        .toList();
  }

  final User? user;
  final HomeDashboardInfo? homeDashboardInfo;
  final List<PageLayout>? pages;
  final StoreInfo? storeInfo;
  final VersionInfo? versionInfo;
}
