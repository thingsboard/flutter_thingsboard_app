import 'package:built_collection/built_collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_app/utils/silent_request.dart';

part 'oauth_provider.g.dart';

final qrCode = OAuth2ClientLoginInfo(
  (b) =>
      b
        ..name = 'qr'
        ..icon = 'qr-code'
        ..url = '',
);

@riverpod
Future<LoginMobileInfo> oauth(Ref ref) async {
  final tbClient = getIt<ITbClientService>().client;
  final deviceInfoService = getIt<IDeviceInfoService>();
  try {
    // Best-effort call with a graceful fallback below: an unknown package
    // name is answered with an empty payload, but a proxy or an older server
    // can still fail the request, and that must not toast on the login page
    // (PROD-8200).
    final response = await tbClient
        .getMobileAppControllerApi()
        .getLoginMobileInfo(
          pkgName: deviceInfoService.getApplicationId(),
          platform: deviceInfoService.getPlatformType().name,
          extra: silentRequestExtra(),
        );
    final loginInfo = response.data;
    if (loginInfo != null) {
      final existingClients =
          loginInfo.oAuth2ClientLoginInfos?.toList() ??
          <OAuth2ClientLoginInfo>[];
      return loginInfo.rebuild(
        (b) =>
            b.oAuth2ClientLoginInfos = ListBuilder<OAuth2ClientLoginInfo>([
              ...existingClients,
              qrCode,
            ]),
      );
    }
  } catch (_) {}
  return LoginMobileInfo(
    (b) =>
        b.oAuth2ClientLoginInfos = ListBuilder<OAuth2ClientLoginInfo>([qrCode]),
  );
}
