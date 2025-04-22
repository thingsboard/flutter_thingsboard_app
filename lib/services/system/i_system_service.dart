import 'package:thingsboard_app/core/entities/entities.dart' show TbPlatform;
import 'package:thingsboard_app/thingsboard_client.dart';

abstract interface class ISystemService {
  Future<void> init();

  Future<String> getPackageName();

  TbPlatform getPlatform();

  void setStoreInfo(StoreInfo? storeInfo);

  void setVersionInfo(VersionInfo? versionInfo);

  bool isClientVersionSuitable();
}
