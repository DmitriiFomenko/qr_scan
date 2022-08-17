import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_scan/ui/widgets/image_avatar.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';

class RowImage extends StatelessWidget {
  const RowImage({
    Key? key,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  final File? image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              AppString.avatar,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text(AppString.changeImage),
            ),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        ImageAvatar(
          image: image,
        ),
      ],
    );
  }
}
