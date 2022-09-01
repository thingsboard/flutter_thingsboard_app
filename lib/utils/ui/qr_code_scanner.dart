import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class QrCodeScannerPage extends TbPageWidget {
  QrCodeScannerPage(TbContext tbContext) : super(tbContext);

  @override
  _QrCodeScannerPageState createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends TbPageState<QrCodeScannerPage> {
  Timer? simulatedQrTimer;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
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
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: kToolbarHeight,
            child: Center(
                child: Text('Scan a code',
                    style: TextStyle(color: Colors.white, fontSize: 20)))),
        Positioned(
          child: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      return Icon(snapshot.data == false
                          ? Icons.flash_on
                          : Icons.flash_off);
                    }),
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
                      return Icon(snapshot.data == CameraFacing.front
                          ? Icons.camera_rear
                          : Icons.camera_front);
                    }),
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                tooltip: 'Toggle camera',
              ),
            ],
          ),
        )
      ],
    ));
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
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    if (isPhysicalDevice) {
      controller.scannedDataStream.take(1).listen((scanData) {
        pop(scanData);
      });
    } else {
      simulatedQrTimer = Timer(Duration(seconds: 3), () {
        pop(Barcode('test code', BarcodeFormat.qrcode, null));
      });
    }
  }
}
