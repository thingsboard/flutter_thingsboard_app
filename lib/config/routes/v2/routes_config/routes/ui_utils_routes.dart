import 'package:go_router/go_router.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/qr_code_scanner.dart';

class UiUtilsRoutes {
  static const qrCodeScan = '/qrCodeScan';
}

// UI utility routes
final uiUtilsRoutes = [
  
  GoRoute(
    path: UiUtilsRoutes.qrCodeScan,
    builder: (context, state) {
      final isProvisioning =
          state.uri.queryParameters['isProvisioning'] == 'true';
      return QrCodeScannerPage(isProvisioning: isProvisioning);
    },
  ),
];
