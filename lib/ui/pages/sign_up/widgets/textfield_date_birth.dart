import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/decoration_sign_up.dart';
import 'package:qr_scan/utils/constanst/string/textfield/error_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/hint_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/label_textfield.dart';

class TextfieldDateBirth extends StatelessWidget {
  const TextfieldDateBirth({
    Key? key,
    required this.controller,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  String? _validateDate(String? value) {
    if (value!.length != 10) {
      return ErrorTextField.invalidDate;
    }

    List<String> splitDate = value.split('.');
    int day = int.parse(splitDate[0]);
    int month = int.parse(splitDate[1]);
    int year = int.parse(splitDate[2]);

    //DateTime сдвигает даты, т.е. 0 день - последний день прошлого месяца.
    DateTime dateTime = DateTime(
      year,
      month,
      day,
    );

    if (month == dateTime.month) {
      return null;
    } else {
      return ErrorTextField.invalidDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validateDate,
      onChanged: (_) {
        formKey.currentState!.validate();
      },
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '##.##.####',
          filter: {
            '#': RegExp('[0-9]'),
          },
          type: MaskAutoCompletionType.lazy,
        ),
      ],
      style: const TextStyle(fontSize: 16),
      decoration: SignUpDecoration.textField(
        labelText: LabelTextField.dateBirth,
        hintText: HintTextField.dateBirth,
      ),
    );
  }
}
