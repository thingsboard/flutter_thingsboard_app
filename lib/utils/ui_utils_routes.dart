import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner.dart';
import 'package:thingsboard_app/utils/ui/tb_recaptcha.dart';

class UiUtilsRoutes extends TbRoutes {

  late var qrCodeScannerHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return QrCodeScannerPage(tbContext);
  });

  late var tbRecaptchaHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    var siteKey = params['siteKey']?.first;
    return TbRecaptcha(tbContext, siteKey: siteKey);
  });

  UiUtilsRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/qrCodeScan", handler: qrCodeScannerHandler);
    router.define("/tbRecaptcha", handler: tbRecaptchaHandler);
  }

}
