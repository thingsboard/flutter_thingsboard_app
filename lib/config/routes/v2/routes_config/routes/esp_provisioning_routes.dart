// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/home_routes.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/ble/view/eps_ble_provisioning_view.dart';
import 'package:thingsboard_app/modules/device_provisioning/presentation/soft_ap/view/esp_softap_view.dart';

class EspProvisioningRoutes {
  static const espBleProvisioning = '/espBleProvisioning';
  static const espSoftApProvisioning = '/espSoftApProvisioning';
}

/// Read from the device's QR code by the provisioning action.
class EspProvisioningArgs {
  const EspProvisioningArgs({
    required this.deviceName,
    required this.deviceSecretKey,
    required this.name,
    required this.pop,
  });

  final String deviceName;
  final String deviceSecretKey;
  final String name;
  final String pop;
}

/// Only the provisioning action passes [EspProvisioningArgs] as `extra`; any
/// other way to these paths leads home.
String? _withoutArgsGoHome(GoRouterState state) =>
    state.extra is EspProvisioningArgs ? null : HomeRoutes.home;

// ESP provisioning routes
final espProvisioningRoutes = [
  GoRoute(
    path: EspProvisioningRoutes.espBleProvisioning,
    redirect: (context, state) => _withoutArgsGoHome(state),
    builder: (context, state) {
      final args = state.extra! as EspProvisioningArgs;
      return EspBleProvisioningView(
        tbDeviceName: args.deviceName,
        tbDeviceSecretKey: args.deviceSecretKey,
        name: args.name,
        poofOfPossession: args.pop,
      );
    },
  ),

  GoRoute(
    path: EspProvisioningRoutes.espSoftApProvisioning,
    redirect: (context, state) => _withoutArgsGoHome(state),
    builder: (context, state) {
      final args = state.extra! as EspProvisioningArgs;
      return EspSoftApView(
        tbDeviceName: args.deviceName,
        tbDeviceSecretKey: args.deviceSecretKey,
        name: args.name,
        proofOfPossession: args.pop,
      );
    },
  ),
];
