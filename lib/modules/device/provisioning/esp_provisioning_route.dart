import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/esp_softap_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/wifi/view/eps_ble_provisioning_view.dart';

class EspProvisioningRoute extends TbRoutes {
  EspProvisioningRoute(super.tbContext);

  static const wifiRoute = '/espBleProvisioning';
  static const softApRoute = '/espSoftApProvisioning';

  late final wifiRouteHandler = Handler(
    handlerFunc: (context, params) {
      return EspBleProvisioningView(tbContext);
    },
  );

  late final softApHandler = Handler(
    handlerFunc: (context, params) {
      return EspSoftApView(tbContext);
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(wifiRoute, handler: wifiRouteHandler);
    router.define(softApRoute, handler: softApHandler);
  }
}
