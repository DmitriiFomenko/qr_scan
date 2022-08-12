import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/decoration_sign_up.dart';
import 'package:qr_scan/utils/constanst/string/textfield/error_textfield.dart';

class TextfieldPassword extends StatelessWidget {
  const TextfieldPassword({
    Key? key,
    required this.controller,
    required this.controllerToCheck,
    required this.formKey,
    required this.obscureText,
    required this.onPressed,
    required this.labelText,
    this.helperText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextEditingController controllerToCheck;
  final GlobalKey<FormState> formKey;
  final bool obscureText;
  final VoidCallback onPressed;
  final String labelText;
  final String? helperText;

  String? _validatePassword(String? value) {
    RegExp hasCharacters = RegExp('[A-Z]+');
    RegExp hasCapitalLetters = RegExp('[!?;:.,]+');

    if (value!.length < 7 ||
        !hasCharacters.hasMatch(value) ||
        !hasCapitalLetters.hasMatch(value)) {
      return ErrorTextField.incorrectPasswordFormat;
    } else if (controllerToCheck.text.isNotEmpty &&
        controller.text != controllerToCheck.text) {
      return ErrorTextField.passwordNotEquivalents;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLength: 16,
      validator: _validatePassword,
      onChanged: (_) {
        formKey.currentState!.validate();
      },
      inputFormatters: [
        MaskTextInputFormatter(
          mask: 'AAAAAAAAAAAAAAAA',
          filter: {
            'A': RegExp('[a-zA-Z0-9!?;:.,_-]'),
          },
          type: MaskAutoCompletionType.lazy,
        ),
      ],
      style: const TextStyle(fontSize: 16),
      decoration: SignUpDecoration.textField(
        labelText: labelText,
        helperText: helperText,
        suffixIcon: IconButton(
          splashRadius: 1,
          onPressed: onPressed,
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
