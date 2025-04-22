import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:thingsboard_app/utils/ui/build_context_extension.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
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
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: (ctrl) => _onQRViewCreated(ctrl, context: context),
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(
    QRViewController controller, {
    required BuildContext context,
  }) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.take(1).listen((scanData) {
      if (context.mounted) {
        context.pop(scanData);
      }
    });
  }
}
