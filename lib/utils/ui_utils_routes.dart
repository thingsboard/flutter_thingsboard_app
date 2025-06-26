import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner.dart';

class UiUtilsRoutes extends TbRoutes {
  late final qrCodeScannerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
       final bool isProvisioning = params['isProvisioning']?.first ?? false;
      return QrCodeScannerPage(isProvisioning: isProvisioning,);
    },
  );

  UiUtilsRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define('/qrCodeScan', handler: qrCodeScannerHandler);
  }
}
