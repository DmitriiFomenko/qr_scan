import 'package:flutter/material.dart';
import 'package:qr_scan/models/barried.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';

class BarrierCard extends StatelessWidget {
  const BarrierCard({
    Key? key,
    required this.barrier,
    required this.onPressedOpen,
    required this.onPressedClose,
  }) : super(key: key);

  final Barrier barrier;
  final VoidCallback onPressedOpen;
  final VoidCallback onPressedClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.textFieldGray,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${barrier.name}: ${barrier.status}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: onPressedOpen,
                child: const Text(AppString.open),
              ),
              TextButton(
                onPressed: onPressedClose,
                child: const Text(AppString.close),
              ),
            ],
          )
        ],
      ),
    );
  }
}
