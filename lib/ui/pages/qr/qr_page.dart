import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';
import 'package:qr_scan/utils/constanst/string/app_token.dart';
import 'package:qr_scan/utils/routes/name_routes.dart';

class QrPage extends StatelessWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroudWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
              ),
              child: Column(
                children: [
                  QrImage(
                    data: AppToken.token,
                    version: QrVersions.auto,
                    size: 100.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(NameRoutes.qrScan);
                    },
                    child: const Text(AppString.openQrScan),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Skip'),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(NameRoutes.barrier);
        },
      ),
    );
  }
}
