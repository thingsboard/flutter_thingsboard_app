import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/entities/entities.dart';

abstract class AppSecretProvider {
  factory AppSecretProvider.local() => _LocalAppSecretProvider();

  Future<String> getAppSecret(TbPlatform platformType);
}

/// Not for production (only for debugging)
class _LocalAppSecretProvider implements AppSecretProvider {
  @override
  Future<String> getAppSecret(TbPlatform platformType) async {
    if (platformType.isIos) {
      return ThingsboardAppConstants.thingsboardIOSAppSecret;
    } else if (platformType.isAndroid) {
      return ThingsboardAppConstants.thingsboardAndroidAppSecret;
    }

    throw UnsupportedError('This platform is not supported $platformType');
  }
}
