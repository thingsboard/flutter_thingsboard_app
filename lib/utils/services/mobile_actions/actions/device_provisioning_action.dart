
import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/device/provisioning/route/esp_provisioning_route.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_action_handler.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class DeviceProvisioningAction extends MobileAction {
 late  final TbContext tbContext = GetIt.I<ThingsboardAppRouter>().tbContext;
  @override
  Future<WidgetMobileActionResult> execute( List<dynamic> args,
    InAppWebViewController controller) {
return _provisioningDevice();
  }

 Future<WidgetMobileActionResult> _provisioningDevice() async {
    try {
      final barcode = await tbContext.navigateTo(
        '/qrCodeScan',
        transition: TransitionType.nativeModal,
      );
      if (barcode != null && barcode.code != null) {
        final decodedJson = jsonDecode(barcode.code!);
        final transport = decodedJson?['transport'];
        if (transport != null) {
          final arguments = {
            'deviceName': decodedJson['tbDeviceName'] ?? decodedJson['name'],
            'deviceSecretKey': decodedJson['tbSecretKey'] ?? decodedJson['pop'],
            'name': decodedJson['name'] ?? decodedJson['tbDeviceName'],
            'pop': decodedJson['pop'] ?? decodedJson['tbSecretKey'],
          };

          bool? provisioningResult;
          switch (transport.toLowerCase()) {
            case 'ble':
              provisioningResult = await tbContext.navigateTo(
                EspProvisioningRoute.wifiRoute,
                routeSettings: RouteSettings(arguments: arguments),
              );

              break;

            case 'softap':
              provisioningResult = await tbContext.navigateTo(
                EspProvisioningRoute.softApRoute,
                routeSettings: RouteSettings(arguments: arguments),
              );

              break;
          }

          if (provisioningResult == true) {
            return WidgetMobileActionResult.successResult(
              MobileActionResult.provisioning(arguments['deviceName']),
            );
          } else {
            return WidgetMobileActionResult.emptyResult();
          }
        } else {
          return WidgetMobileActionResult.errorResult(
            'Provisioning method wasn\'t specified.',
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