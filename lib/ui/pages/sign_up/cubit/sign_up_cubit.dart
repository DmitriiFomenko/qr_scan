import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:qr_scan/models/user.dart';
import 'package:qr_scan/repositories/local_repository.dart';
import 'package:qr_scan/repositories/user_repository.dart';
import 'package:qr_scan/ui/pages/sign_up/cubit/sign_up_state.dart';
import 'package:qr_scan/utils/routes/name_routes.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerDateBirth = TextEditingController();
  String phoneNumber = '';

  void changeVisibilityPassword() {
    emit(
      SignUpState(
        hidePassword: !state.hidePassword,
        hideConfirmPassword: state.hideConfirmPassword,
        image: state.image,
      ),
    );
  }

  void changeVisibilityConfirmPassword() {
    emit(
      SignUpState(
        hidePassword: state.hidePassword,
        hideConfirmPassword: !state.hideConfirmPassword,
        image: state.image,
      ),
    );
  }

  ValueChanged<PhoneNumber> onChangedPhone() {
    //PhoneNumber(countryISOCode: RU, countryCode: +7, number: 25555)
    return (PhoneNumber value) {
      phoneNumber = value.completeNumber;
    };
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    File image = File(pickedFile.path);
    debugPrint('image path: ${image.path}');

    emit(
      SignUpState(
        hidePassword: state.hidePassword,
        hideConfirmPassword: state.hideConfirmPassword,
        image: image,
      ),
    );
  }

  void _saveUser() async {
    User user = User(
      login: controllerLogin.text,
      password: controllerPassword.text,
      email: controllerEmail.text,
      phone: phoneNumber,
      dateBirth: controllerDateBirth.text,
      imagePath: state.image?.path ?? '',
    );

    //TODO: Вместо сервера - локальный репозиторий
    // MainRepository mainRepository = MainRepository();
    // await mainRepository.registerUser(user: user);

    const LocalRepository localRepository = LocalRepository();
    UserRepository.user = user;
    await localRepository.saveUser(user: user);
  }

  void tryUserRegistration(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _saveUser();
      Navigator.of(context).pushReplacementNamed(NameRoutes.qr);
    }
  }
}
