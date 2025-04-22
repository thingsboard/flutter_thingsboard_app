import 'package:thingsboard_app/core/entities/entities.dart';
import 'package:thingsboard_app/features/authentication/oauth2/app_secret_provider.dart';
import 'package:thingsboard_app/features/authentication/oauth2/tb_oauth2_client.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/oauth2/i_ouath2_service.dart';

class Oath2Service implements IOauth2Service {
  final oauth2Client = TbOAuth2Client(
    appSecretProvider: AppSecretProvider.local(),
  );

  @override
  Future<TbOAuth2AuthenticateResult> authenticate(
    String oauth2Url, {
    required TbPlatform platformType,
    required String packageName,
    ILoggerService? logger,
  }) {
    return oauth2Client.authenticate(
      oauth2Url,
      platformType: platformType,
      packageName: packageName,
      logger: logger,
    );
  }
}
