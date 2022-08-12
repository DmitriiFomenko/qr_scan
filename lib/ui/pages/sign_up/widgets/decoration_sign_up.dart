import 'package:flutter/material.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';

abstract class SignUpDecoration {
  static InputDecoration textField({
    String? labelText,
    String? helperText,
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
      hintText: hintText,
      fillColor: AppColor.textFieldGray,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
    );
  }
}
