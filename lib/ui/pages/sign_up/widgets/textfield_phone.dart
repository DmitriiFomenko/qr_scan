import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/decoration_sign_up.dart';
import 'package:qr_scan/utils/constanst/string/textfield/hint_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/label_textfield.dart';

class TextfieldPhone extends StatelessWidget {
  const TextfieldPhone({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<PhoneNumber> onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: 'RU',
      onChanged:
          onChanged, //PhoneNumber(countryISOCode: RU, countryCode: +7, number: 25555)
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '##########',
          filter: {
            '#': RegExp('[0-9]'),
          },
          type: MaskAutoCompletionType.lazy,
        ),
      ],
      decoration: SignUpDecoration.textField(
        labelText: LabelTextField.phone,
        hintText: HintTextField.phone,
      ),
    );
  }
}
