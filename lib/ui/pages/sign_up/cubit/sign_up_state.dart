import 'dart:io';

class SignUpState {
  SignUpState({
    this.hidePassword = true,
    this.hideConfirmPassword = true,
    this.image,
  });

  final bool hidePassword;
  final bool hideConfirmPassword;
  final File? image;
}
