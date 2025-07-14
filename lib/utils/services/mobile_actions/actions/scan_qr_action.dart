import 'package:fluro/fluro.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_result.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class ScanQrAction extends MobileAction {
  late final TbContext tbContext = getIt<ThingsboardAppRouter>().tbContext;
  @override
  Future<WidgetMobileActionResult<MobileActionResult>> execute(
      List args, InAppWebViewController controller,) {
    return _scanQrCode();
  }

  @override
  WidgetMobileActionType get type => WidgetMobileActionType.scanQrCode;
  Future<WidgetMobileActionResult> _scanQrCode() async {
    try {
      final Barcode? barcode = await getIt<ThingsboardAppRouter>().navigateTo(
        '/qrCodeScan',
        transition: TransitionType.nativeModal,
      );
      if (barcode != null && barcode.rawValue != null) {
        return WidgetMobileActionResult.successResult(
          MobileActionResult.qrCode(
            barcode.rawValue!,
            barcode.format.toString(),
          ),
        );
      } else {
        return WidgetMobileActionResult.emptyResult();
      }
    } catch (e) {
      return handleError(e);
    }
  }
}
