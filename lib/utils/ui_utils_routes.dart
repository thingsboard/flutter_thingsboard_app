import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/tb_routes.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/qr_code_scanner.dart';

class UiUtilsRoutes extends TbRoutes {
  UiUtilsRoutes(super.tbContext);
  late final qrCodeScannerHandler = Handler(
    handlerFunc: (BuildContext? context, params) {
      final bool isProvisioning =
          bool.tryParse(params['isProvisioning'].toString()) ?? false;
      return QrCodeScannerPage(
        isProvisioning: isProvisioning,
      );
    },
  );

  @override
  void doRegisterRoutes(FluroRouter router) {
    router.define('/qrCodeScan', handler: qrCodeScannerHandler);
  }
}
