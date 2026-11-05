import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/thingsboard_client.dart' show PlatformType;

abstract class AppSecretProvider {

  factory AppSecretProvider.local() => _LocalAppSecretProvider();
  Future<String> getAppSecret(PlatformType platformType);
}

/// Not for production (only for debugging)
class _LocalAppSecretProvider implements AppSecretProvider {
  @override
  Future<String> getAppSecret(PlatformType platformType) async {
    if (platformType == PlatformType.IOS) {
      return ThingsboardAppConstants.thingsboardIOSAppSecret;
    } else if (platformType == PlatformType.ANDROID) {
      return ThingsboardAppConstants.thingsboardAndroidAppSecret;
    }

    throw UnsupportedError('This platform is not supported $platformType');
  }
}
