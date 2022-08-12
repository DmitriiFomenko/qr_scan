import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan/ui/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:qr_scan/ui/pages/sign_up/cubit/sign_up_state.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/row_image.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/textfield_date_birth.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/textfield_email.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/textfield_login.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/textfield_password.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/textfield_phone.dart';
import 'package:qr_scan/ui/pages/sign_up/widgets/title_sign_up.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';
import 'package:qr_scan/utils/constanst/string/textfield/helped_textfield.dart';
import 'package:qr_scan/utils/constanst/string/textfield/label_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroudWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
              ),
              child: BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return Form(
                    key: context.read<SignUpCubit>().formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: SignUpTitle(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextfieldLogin(
                          controller:
                              context.read<SignUpCubit>().controllerLogin,
                          formKey: context.read<SignUpCubit>().formKey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextfieldPassword(
                          controller:
                              context.read<SignUpCubit>().controllerPassword,
                          controllerToCheck: context
                              .read<SignUpCubit>()
                              .controllerConfirmPassword,
                          formKey: context.read<SignUpCubit>().formKey,
                          obscureText: state.hidePassword,
                          onPressed: () {
                            context
                                .read<SignUpCubit>()
                                .changeVisibilityPassword();
                          },
                          labelText: LabelTextField.password,
                          helperText: HelpedTextField.password,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextfieldPassword(
                          controller: context
                              .read<SignUpCubit>()
                              .controllerConfirmPassword,
                          controllerToCheck:
                              context.read<SignUpCubit>().controllerPassword,
                          formKey: context.read<SignUpCubit>().formKey,
                          obscureText: state.hideConfirmPassword,
                          onPressed: () {
                            context
                                .read<SignUpCubit>()
                                .changeVisibilityConfirmPassword();
                          },
                          labelText: LabelTextField.confirmPassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextfieldEmail(
                          controller:
                              context.read<SignUpCubit>().controllerEmail,
                          formKey: context.read<SignUpCubit>().formKey,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextfieldPhone(
                          onChanged:
                              context.read<SignUpCubit>().onChangedPhone(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextfieldDateBirth(
                          controller:
                              context.read<SignUpCubit>().controllerDateBirth,
                          formKey: context.read<SignUpCubit>().formKey,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RowImage(
                          image: context.read<SignUpCubit>().state.image,
                          onPressed: () {
                            context.read<SignUpCubit>().pickImage();
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
                          child: const Text(AppString.singUp),
                          onPressed: () {
                            context
                                .read<SignUpCubit>()
                                .tryUserRegistration(context);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
