import 'package:thingsboard_client/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/version_service/version_info.dart';

class VersionRouteArguments {
  const VersionRouteArguments({
    required this.versionInfo,
    required this.storeInfo,
  });

  final VersionInfo versionInfo;
  final StoreInfo? storeInfo;
}
