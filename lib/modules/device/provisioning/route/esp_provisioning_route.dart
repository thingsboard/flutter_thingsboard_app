import 'package:fluro/fluro.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/view/eps_ble_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/view/esp_softap_view.dart';

class EspProvisioningRoute extends TbRoutes {
  EspProvisioningRoute(super.tbContext);

  static const wifiRoute = '/espBleProvisioning';
  static const softApRoute = '/espSoftApProvisioning';

  late final wifiRouteHandler = Handler(
    handlerFunc: (context, params) {
      final args = context!.settings!.arguments! as Map<String, dynamic>;
      return EspBleProvisioningView(
        tbContext,
        tbDeviceName: args['deviceName'] as String? ?? '',
        tbDeviceSecretKey: args['deviceSecretKey'] as String? ?? '',
        name: args['name'] as String,
        poofOfPossession: args['pop'] as String,
      );
    },
  );

  late final softApHandler = Handler(
    handlerFunc: (context, params) {
      final args = context!.settings!.arguments! as Map<String, dynamic>;
      return EspSoftApView(
        tbContext,
        tbDeviceName: args['deviceName'] as String? ?? '',
        tbDeviceSecretKey: args['deviceSecretKey'] as String? ?? '',
        name: args['name'] as String,
        proofOfPossession: args['pop'] as String,
      );
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define(wifiRoute, handler: wifiRouteHandler);
    router.define(softApRoute, handler: softApHandler);
  }
}
