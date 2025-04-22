import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/provisioning/eps_ble/i_wifi_provisioning_service.dart';
import 'package:thingsboard_app/services/provisioning/eps_ble/wifi_provisioning_service.dart';

abstract final class EspBleDi {
  static void init(String scopeName) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<IBleProvisioningService>(
          () => BleProvisioningService(),
        );
      },
    );
  }

  static void dispose(String scopeName) {
    getIt.dropScope(scopeName);
  }
}
