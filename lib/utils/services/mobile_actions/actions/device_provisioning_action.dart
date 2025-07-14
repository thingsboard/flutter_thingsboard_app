import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/device/provisioning/route/esp_provisioning_route.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class DeviceProvisioningAction extends MobileAction {
  late final TbContext tbContext = GetIt.I<ThingsboardAppRouter>().tbContext;
  @override
  Future<WidgetMobileActionResult> execute(
    List<dynamic> args,
    InAppWebViewController controller,
  ) {
    return _provisioningDevice();
  }

  Future<WidgetMobileActionResult> _provisioningDevice() async {
    try {
      if (tbContext.userDetails?.authority != Authority.CUSTOMER_USER) {
        return WidgetMobileActionResult.errorResult(
            "Provisioning is only abaliable for customer roles.",
          );
      }
      final Barcode? barcode = await getIt<ThingsboardAppRouter>().navigateTo(
        '/qrCodeScan',
        transition: TransitionType.nativeModal,
      );
      if (barcode != null && barcode.rawValue != null) {
        final decodedJson = jsonDecode(barcode.rawValue!) as Map<String, dynamic>?;
        final transport = decodedJson?['transport'].toString();
        if (transport != null && decodedJson != null) {
          final arguments = {
            'deviceName': decodedJson['tbDeviceName'] ?? decodedJson['name'],
            'deviceSecretKey': decodedJson['tbSecretKey'] ?? decodedJson['pop'],
            'name': decodedJson['name'] ?? decodedJson['tbDeviceName'],
            'pop': decodedJson['pop'] ?? decodedJson['tbSecretKey'],
          };

          bool? provisioningResult;
          switch (transport.toLowerCase()) {
            case 'ble':
              provisioningResult =
                  await getIt<ThingsboardAppRouter>().navigateTo(
                EspProvisioningRoute.wifiRoute,
                routeSettings: RouteSettings(arguments: arguments),
              );

            case 'softap':
              provisioningResult =
                  await getIt<ThingsboardAppRouter>().navigateTo(
                EspProvisioningRoute.softApRoute,
                routeSettings: RouteSettings(arguments: arguments),
              );
          }

          if (provisioningResult == true) {
            return WidgetMobileActionResult.successResult(
              MobileActionResult.provisioning(
                  arguments['deviceName'].toString()),
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
