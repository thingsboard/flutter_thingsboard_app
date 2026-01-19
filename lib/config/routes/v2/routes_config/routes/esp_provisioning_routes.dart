import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/modules/device/provisioning/ble/view/eps_ble_provisioning_view.dart';
import 'package:thingsboard_app/modules/device/provisioning/soft_ap/view/esp_softap_view.dart';

class EspProvisioningRoutes {
  static const espBleProvisioning = '/espBleProvisioning';
  static const espSoftApProvisioning = '/espSoftApProvisioning';
}

// ESP provisioning routes
final espProvisioningRoutes = [
  GoRoute(
    path: EspProvisioningRoutes.espBleProvisioning,
    builder: (context, state) {
      final deviceName = state.uri.queryParameters['deviceName'] ?? '';
      final deviceSecretKey = state.uri.queryParameters['deviceSecretKey'] ?? '';
      final name = state.uri.queryParameters['name'] ?? '';
      final pop = state.uri.queryParameters['pop'] ?? '';

      return EspBleProvisioningView(
        tbDeviceName: deviceName,
        tbDeviceSecretKey: deviceSecretKey,
        name: name,
        poofOfPossession: pop,
      );
    },
  ),
  
  GoRoute(
    path: EspProvisioningRoutes.espSoftApProvisioning,
    builder: (context, state) {
      final deviceName = state.uri.queryParameters['deviceName'] ?? '';
      final deviceSecretKey = state.uri.queryParameters['deviceSecretKey'] ?? '';
      final name = state.uri.queryParameters['name'] ?? '';
      final pop = state.uri.queryParameters['pop'] ?? '';

      return EspSoftApView(
   
        tbDeviceName: deviceName,
        tbDeviceSecretKey: deviceSecretKey,
        name: name,
        proofOfPossession: pop,
      );
    },
  ),
];
