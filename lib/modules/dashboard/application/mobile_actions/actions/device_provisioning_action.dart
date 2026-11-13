// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/routes/v2/router_2.dart';
import 'package:thingsboard_app/config/routes/v2/routes_config/routes/esp_provisioning_routes.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/modules/dashboard/application/mobile_actions/widget_mobile_action_type.dart';
import 'package:thingsboard_app/utils/services/tb_client_service/i_tb_client_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class DeviceProvisioningAction extends MobileAction {
  @override
  Future<WidgetMobileActionResult> execute(
    List<dynamic> args,
    InAppWebViewController controller,
  ) {
    return _provisioningDevice();
  }

  BuildContext get context => globalNavigatorKey.currentContext!;
  Future<WidgetMobileActionResult> _provisioningDevice() async {
    try {
      final authority = getIt<ITbClientService>().client
          .getAuthUser()
          ?.authority;
      if (authority != Authority.CUSTOMER_USER) {
        return WidgetMobileActionResult.errorResult(
          "Provisioning is only abaliable for customer roles.",
        );
      }
      final Barcode? barcode = await context.push('/qrCodeScan');
      if (barcode != null && barcode.rawValue != null) {
        final decodedJson =
            jsonDecode(barcode.rawValue!) as Map<String, dynamic>?;
        final transport = decodedJson?['transport'].toString();
        if (transport != null && decodedJson != null) {
          final args = EspProvisioningArgs(
            deviceName: (decodedJson['tbDeviceName'] ?? decodedJson['name'])
                .toString(),
            deviceSecretKey: (decodedJson['tbSecretKey'] ?? decodedJson['pop'])
                .toString(),
            name: (decodedJson['name'] ?? decodedJson['tbDeviceName'])
                .toString(),
            pop: (decodedJson['pop'] ?? decodedJson['tbSecretKey']).toString(),
          );

          final route = switch (transport.toLowerCase()) {
            'ble' => EspProvisioningRoutes.espBleProvisioning,
            'softap' => EspProvisioningRoutes.espSoftApProvisioning,
            _ => null,
          };
          final provisioningResult = route == null
              ? null
              : await getIt<ThingsboardAppRouter>().push<bool>(
                  route,
                  extra: args,
                );

          if (provisioningResult == true) {
            return WidgetMobileActionResult.successResult(
              MobileActionResult.provisioning(args.deviceName),
            );
          } else {
            return WidgetMobileActionResult.emptyResult();
          }
        } else {
          return WidgetMobileActionResult.errorResult(
            "Provisioning method wasn't specified.",
          );
        }
      }

      return WidgetMobileActionResult.emptyResult();
    } catch (e) {
      log.error('Provisioning device exception: $e', e);
      return handleError(
        'Please check that your QR code is correct and try again.',
      );
    }
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.deviceProvision;
}
