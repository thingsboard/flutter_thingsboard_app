
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/auth/oauth2/app_secret_provider.dart';
import 'package:thingsboard_app/core/auth/oauth2/hmac_base64_algorithm.dart';
import 'package:thingsboard_app/core/auth/oauth2/i_oauth2_client.dart';
import 'package:thingsboard_app/core/auth/oauth2/tb_o_auth2_authenticate_result.dart';
import 'package:thingsboard_app/core/auth/web/tb_web_auth.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show PlatformTypeToString;
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';

class TbOAuth2Client implements IOAuth2Client {

  TbOAuth2Client( {
    required TbLogger tbLogger,
    required IDeviceInfoService deviceInfoService,
    required AppSecretProvider appSecretProvider,
  }) : _appSecretProvider = appSecretProvider, _logger = tbLogger, _deviceInfoService = deviceInfoService;
  final AppSecretProvider _appSecretProvider;
  final TbLogger _logger;
  final IDeviceInfoService _deviceInfoService;
@override
  Future<TbOAuth2AuthenticateResult> authenticate(String oauth2Url) async {
    final appSecret = await _appSecretProvider.getAppSecret(
     _deviceInfoService.getPlatformType(),
    );
    final pkgName =  _deviceInfoService.getApplicationId();
    final jwt = JWT(
      {
        'callbackUrlScheme':
            ThingsboardAppConstants.thingsboardOAuth2CallbackUrlScheme,
      },
      issuer: pkgName,
    );
    final key = SecretKey(appSecret);
    final appToken = jwt.sign(
      key,
      algorithm: HMACBase64Algorithm.hs512,
      expiresIn: const Duration(minutes: 2),
    );
    var url =
        Uri.parse(await getIt<IEndpointService>().getEndpoint() + oauth2Url);
    final params = Map<String, String>.from(url.queryParameters);
    params['pkg'] = pkgName;
    params['appToken'] = appToken;
    params['platform'] = _deviceInfoService.getPlatformType().toShortString();
    url = url.replace(queryParameters: params);

    _logger.debug('TbOAuth2Client::authenticate() request url -> $url');
    final result = await TbWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme:
          ThingsboardAppConstants.thingsboardOAuth2CallbackUrlScheme,
      saveHistory: true,
    );
    final resultUri = Uri.parse(result);
    _logger
        .debug('TbOAuth2Client::authenticate() result url -> $resultUri');
    final error = resultUri.queryParameters['error'];
    if (error != null) {
      return TbOAuth2AuthenticateResult.failed(error);
    } else {
      final accessToken = resultUri.queryParameters['accessToken'];
      final refreshToken = resultUri.queryParameters['refreshToken'];
      if (accessToken != null && refreshToken != null) {
        return TbOAuth2AuthenticateResult.success(accessToken, refreshToken);
      } else {
        return TbOAuth2AuthenticateResult.failed(
          'No authentication credentials in response.',
        );
      }
    }
  }
}
