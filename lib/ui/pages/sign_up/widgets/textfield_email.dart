import 'package:flutter/material.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/decoration_sign_up.dart';
import 'package:qr_scan/utils/constanst/string/textfield/error_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/hint_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/label_textfield.dart';

class TextfieldEmail extends StatelessWidget {
  const TextfieldEmail({
    Key? key,
    required this.controller,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  String? _validateEmail(String? value) {
    //example@gmail.com
    RegExp emailFormat = RegExp(r'[a-zA-Z0-9.-]+@[a-zA-Z]+\.[a-zA-Z]+');

    if (!emailFormat.hasMatch(value!)) {
      return ErrorTextField.invalidEmail;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validateEmail,
      onChanged: (_) {
        formKey.currentState!.validate();
      },
      style: const TextStyle(fontSize: 16),
      decoration: SignUpDecoration.textField(
        labelText: LabelTextField.email,
        hintText: HintTextField.email,
      ),
    );
  }
}
