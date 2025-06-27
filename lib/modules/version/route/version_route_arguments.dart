import 'package:thingsboard_app/thingsboard_client.dart'
    show StoreInfo, VersionInfo;

class VersionRouteArguments {
  const VersionRouteArguments({
    required this.versionInfo,
    required this.storeInfo,
  });

  final VersionInfo versionInfo;
  final StoreInfo? storeInfo;
}
