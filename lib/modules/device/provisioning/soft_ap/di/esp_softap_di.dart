import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/provisioning/soft_ap/i_soft_ap_service.dart';
import 'package:thingsboard_app/services/provisioning/soft_ap/soft_ap_service.dart';

abstract final class EspSoftApDi {
  static void init(String scopeName) {
    getIt.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerFactory<ISoftApService>(() => SoftApService());
      },
    );
  }

  static void dispose(String scopeName) {
    getIt.dropScope(scopeName);
  }
}
