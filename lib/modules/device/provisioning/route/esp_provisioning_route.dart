import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/view/eps_ble_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/view/esp_softap_view.dart';

class EspProvisioningRoute extends TbRoutes {
  EspProvisioningRoute(super.tbContext);

  static const wifiRoute = '/espBleProvisioning';
  static const softApRoute = '/espSoftApProvisioning';

  late final wifiRouteHandler = Handler(
    handlerFunc: (context, params) {
      final args = context?.settings?.arguments as Map<String, dynamic>;
      return EspBleProvisioningView(
        tbContext,
        tbDeviceName: args['deviceName'] ?? '',
        tbDeviceSecretKey: args['deviceSecretKey'] ?? '',
        name: args['name'],
        poofOfPossession: args['pop'],
      );
    },
  );

  late final softApHandler = Handler(
    handlerFunc: (context, params) {
      final args = context?.settings?.arguments as Map<String, dynamic>;
      return EspSoftApView(
        tbContext,
        tbDeviceName: args['deviceName'] ?? '',
        tbDeviceSecretKey: args['deviceSecretKey'] ?? '',
        name: args['name'],
        proofOfPossession: args['pop'],
      );
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(wifiRoute, handler: wifiRouteHandler);
    router.define(softApRoute, handler: softApHandler);
  }
}
