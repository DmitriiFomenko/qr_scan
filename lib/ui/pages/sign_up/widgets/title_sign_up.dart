import 'package:flutter/material.dart';
import 'package:qr_scan/utils/constanst/font_family_key.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppString.singUp,
      style: TextStyle(
        fontSize: 22,
        fontFamily: FontFamilyKey.timesNewRoman,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
