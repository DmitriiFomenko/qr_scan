import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class FlipCameraButton extends StatelessWidget {
  const FlipCameraButton({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  final QRViewController? controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: FutureBuilder(
          future: controller?.getCameraInfo(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Text('Camera facing ${describeEnum(snapshot.data!)}');
            } else {
              return const Text('loading');
            }
          },
        ),
      ),
    );
  }
}
