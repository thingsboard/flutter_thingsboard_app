import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';

part 'oauth_provider.g.dart';

final qrCode = OAuth2ClientInfo.fromJson({
  'name': "qr",
  'icon': 'qr-code',
  'url': '',
});
@riverpod
Future<LoginMobileInfo> oauth(Ref ref) async {
  final tbClient = getIt<ITbClientService>().client;
  final deviceInfoService = getIt<IDeviceInfoService>();
  try {
    final loginInfo = await tbClient.getMobileService().getLoginMobileInfo(
      MobileInfoQuery(
        packageName: deviceInfoService.getApplicationId(),
        platformType: deviceInfoService.getPlatformType(),
      ),
    );

    if (loginInfo != null) {
      return LoginMobileInfo(
        oAuth2Clients: [...loginInfo.oAuth2Clients, qrCode],
        storeInfo: loginInfo.storeInfo,
        versionInfo: loginInfo.versionInfo,
      );
    }
  } catch (_) {}
  return LoginMobileInfo(
    oAuth2Clients: [qrCode],
    storeInfo: null,
    versionInfo: null,
  );
}
