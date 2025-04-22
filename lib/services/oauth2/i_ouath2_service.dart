import 'package:thingsboard_app/core/entities/entities.dart' show TbPlatform;
import 'package:thingsboard_app/features/authentication/oauth2/tb_oauth2_client.dart'
    show TbOAuth2AuthenticateResult;
import 'package:thingsboard_app/services/logger/i_logger_service.dart';

abstract interface class IOauth2Service {
  Future<TbOAuth2AuthenticateResult> authenticate(
    String oauth2Url, {
    required TbPlatform platformType,
    required String packageName,
    ILoggerService? logger,
  });
}
