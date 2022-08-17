import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scan/ui/pages/qr_scan/widgets/build_qr_view.dart';
import 'package:qr_scan/ui/pages/qr_scan/widgets/flash_button.dart';
import 'package:qr_scan/ui/pages/qr_scan/widgets/flip_camera_button.dart';
import 'package:qr_scan/ui/pages/qr_scan/widgets/pause_button.dart';
import 'package:qr_scan/ui/pages/qr_scan/widgets/start_button.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';
import 'package:qr_scan/utils/constanst/string/app_token.dart';
import 'package:qr_scan/utils/routes/name_routes.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _tryRouteOnHome(String scanData) {
    if (scanData == AppToken.token) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          NameRoutes.barrier, (Route<dynamic> route) => false);
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _tryRouteOnHome(scanData.code!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: BuildQrView(
              context: context,
              qrKey: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        '${AppString.data}: ${result!.code}. ${AppString.invalidToken}.')
                  else
                    const Text(AppString.scanCode),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlashButton(
                        controller: controller,
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {});
                        },
                      ),
                      FlipCameraButton(
                        controller: controller,
                        onPressed: () async {
                          await controller?.flipCamera();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      PauseButton(onPressed: () async {
                        await controller?.pauseCamera();
                      }),
                      StartButton(
                        onPressed: () async {
                          await controller?.resumeCamera();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
