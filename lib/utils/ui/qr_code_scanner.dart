import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/device_info/i_device_info_service.dart';

class QrCodeScannerPage extends StatefulWidget {
 const QrCodeScannerPage({required this.isProvisioning, super.key});
  final bool isProvisioning;
  @override
  State<StatefulWidget> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final router = getIt<ThingsboardAppRouter>().router;
  final IDeviceInfoService deviceInfoService =
      getIt<IDeviceInfoService>();
  Timer? simulatedQrTimer;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    if (simulatedQrTimer != null) {
      simulatedQrTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(context),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: kToolbarHeight,
            child: Center(
              child: Text(
                'Scan a code',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      return Icon(
                        snapshot.data == false
                            ? Icons.flash_on
                            : Icons.flash_off,
                      );
                    },
                  ),
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {});
                  },
                  tooltip: 'Toggle flash',
                ),
                IconButton(
                  icon: FutureBuilder(
                    future: controller?.getCameraInfo(),
                    builder: (context, snapshot) {
                      return Icon(
                        snapshot.data == CameraFacing.front
                            ? Icons.camera_rear
                            : Icons.camera_front,
                      );
                    },
                  ),
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                  tooltip: 'Toggle camera',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
        onPermissionSet: (p0, p1) {
        if (p1 == true) {
        } else {
          // Permission denied, you can handle it here if needed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Camera permission denied')),
          );
        }
      },
      key: qrKey,
      onQRViewCreated: (ctrl) => _onQRViewCreated(ctrl, context),
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

   void _onQRViewCreated(QRViewController controller, BuildContext context) {
    setState(() {
      this.controller = controller;
    });
    if (deviceInfoService.isPhysicalDevice()) {
      controller.scannedDataStream.take(1).listen((scanData) {
        if(context.mounted) {
   router.pop(context,scanData);
        }
      });
    } else {
      simulatedQrTimer = Timer(const Duration(seconds: 3), () {
      router.pop(context,Barcode('test code', BarcodeFormat.qrcode, null));
      });
    }
  }

}
