import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/decoration_sign_up.dart';
import 'package:qr_scan/utils/constanst/string/textfield/error_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/helped_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/hint_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/label_textfield.dart';

class TextfieldLogin extends StatelessWidget {
  const TextfieldLogin({
    Key? key,
    required this.controller,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  String? _validateLogin(String? value) {
    if (value!.length < 7) {
      return ErrorTextField.insufficientLength;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 16,
      validator: _validateLogin,
      onChanged: (_) {
        formKey.currentState!.validate();
      },
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '#AAAAAAAAAAAAAAA',
          filter: {
            "#": RegExp('[a-zA-Z]'),
            'A': RegExp('[a-zA-Z0-9-_]'),
          },
          type: MaskAutoCompletionType.lazy,
        ),
      ],
      style: const TextStyle(fontSize: 16),
      decoration: SignUpDecoration.textField(
        labelText: LabelTextField.login,
        helperText: HelpedTextField.login,
        hintText: HintTextField.login,
      ),
    );
  }
}
