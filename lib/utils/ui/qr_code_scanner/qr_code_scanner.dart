import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/scanner_error_widget.dart';
import 'package:thingsboard_app/utils/ui/qr_code_scanner/scanner_overlay_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

Size getCameraSize(Size mediaQuerySize) {
  final scanArea = (mediaQuerySize.width < 400 || mediaQuerySize.height < 400)
      ? 150.0
      : 300.0;
  return Size(scanArea, scanArea);
}

class QrCodeScannerPage extends HookWidget {
  const QrCodeScannerPage({required this.isProvisioning, super.key});
  final bool isProvisioning;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final cameraSize = getCameraSize(size);
    final hasPermission = useState(true);
    final isTorchActive = useState(false);
    final isBackCameraActive = useState(true);

    final controller = useMemoized(() => MobileScannerController());

    // Check camera permission initially
    useEffect(() {
    Future  checkCameraPermission() async {
        final isGranted = await Permission.camera.isGranted;
        hasPermission.value = isGranted;
      }

      checkCameraPermission();
      return null;
    }, []);

    // Listen to app lifecycle changes to detect when app resumes
    useEffect(() {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      late AppLifecycleListener lifecycleListener;

      lifecycleListener = AppLifecycleListener(
        onResume: () async {
          // Check permission when app resumes from background
          final isGranted = await Permission.camera.isGranted;
          if (!hasPermission.value && isGranted) {
            // Permission was granted while in settings
            hasPermission.value = true;

            await controller.stop();
            await controller.start();
          }
        },

      );

      return () {
        SystemChrome.setPreferredOrientations(<DeviceOrientation>[]);
        lifecycleListener.dispose();
        controller.dispose();
      };
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            scanWindow: Rect.fromCenter(
                center: Offset(size.width / 2, size.height / 2),
                width: cameraSize.width,
                height: cameraSize.height),
            fit: BoxFit.fitHeight,
            overlayBuilder: (context, constraints) {
              return ScannerOverlayWidget(cameraSize: cameraSize);
            },
            errorBuilder: (p0, p1,) => const ScannerErrorWidget(),
            controller: controller,
            onDetect: (barcodes) {
              if (barcodes.barcodes.isNotEmpty) {
                if (context.mounted) {
                  getIt<ThingsboardAppRouter>()
                      .pop(barcodes.barcodes.first, context);
                }
              }
            },
          ),
          Positioned(
            child: AppBar(
              leading: IconButton(
                  onPressed: () {
                    getIt<ThingsboardAppRouter>().pop(null,context);
                  },
                  icon: const Icon(Icons.close)),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              iconTheme: const IconThemeData(color: AppColors.textWhite),
              elevation: 0,
              title: Text(S.of(context).scanACode,
                  style: TbTextStyles.titleXs
                      .copyWith(color: AppColors.textWhite)),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
         
                    isTorchActive.value ? Icons.flash_off : Icons.flash_on,
                  ),
                  onPressed: () async {
                    await controller.toggleTorch();
                    isTorchActive.value = !isTorchActive.value;
                  },
                  tooltip: S.of(context).toggleFlash,
                ),
                IconButton(
                  icon: Icon(
                    
                    isBackCameraActive.value
                        ? Icons.camera_front
                        : Icons.camera_rear,
                  ),
                  onPressed: () async {
                    await controller.switchCamera();
                    isBackCameraActive.value = !isBackCameraActive.value;
                  },
                  tooltip: S.of(context).toggleCamera,
                ),
              ],
            ),
          ),
          if (!hasPermission.value)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
                child: IgnorePointer(
                  ignoring: false,
                  child: OutlinedButton(
                      onPressed: () async {
                        final res = await Permission.camera.request();
                        if (res == PermissionStatus.granted) {
                          hasPermission.value = true;

                          await controller.stop();
                          await controller.start();
                          return;

                        } else if (res == PermissionStatus.permanentlyDenied &&
                            context.mounted) {
                          getIt<IOverlayService>().showAlertDialog(
                            content: (_) => DialogContent(title: S.of(context).unableToUseCamera, message: S
                                  .of(context)
                                  .openSettingsAndGrantAccessToCameraToContinue, ok: S.of(context).cancel),
                              );
                        }
                        hasPermission.value = false;
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.white,
                        elevation: 8,
                      ),
                      child: Text(
                        S.of(context).allowAccess,
                        style: TbTextStyles.labelLarge.copyWith(height: 1),
                      )),
                ),
              ),
            )
        ],
      ),
    );
  }
}
