import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';

class FlashButton extends StatelessWidget {
  const FlashButton({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  final QRViewController? controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: FutureBuilder(
          future: controller?.getFlashStatus(),
          builder: (context, snapshot) {
            return Text('${AppString.flash}: ${snapshot.data}');
          },
        ),
      ),
    );
  }
}
