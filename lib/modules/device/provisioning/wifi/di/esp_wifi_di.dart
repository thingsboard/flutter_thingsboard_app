import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/provisioning/eps_wifi/i_wifi_provisioning_service.dart';
import 'package:thingsboard_app/utils/services/provisioning/eps_wifi/wifi_provisioning_service.dart';

abstract final class EspWifiDi {
  static void init(String scopeName) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<IWifiProvisioningService>(
          () => WifiProvisioningService(),
        );
      },
    );
  }

  static void dispose(String scopeName) {
    getIt.dropScope(scopeName);
  }
}
