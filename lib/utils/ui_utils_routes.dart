import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/routes/i_tb_routes.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner.dart';

class UiUtilsRoutes implements ITbRoutes {
  late final qrCodeScannerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const QrCodeScannerPage();
    },
  );

  @override
  void registerRoutes(FluroRouter router) {
    router.define('/qrCodeScan', handler: qrCodeScannerHandler);
  }
}
