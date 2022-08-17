import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const SizedBox(
        height: 70,
        child: Center(
          child: Text(
            AppString.noImage,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    } else {
      return Image.file(
        image!,
        height: 70,
      );
    }
  }
}
