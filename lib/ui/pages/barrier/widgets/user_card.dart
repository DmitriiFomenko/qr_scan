import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_scan/ui/widgets/image_avatar.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.login,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  final String login;
  final File? image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backgroundCardGray,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              login,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ImageAvatar(
              image: image,
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text(AppString.exit),
            ),
          ],
        ),
      ),
    );
  }
}
