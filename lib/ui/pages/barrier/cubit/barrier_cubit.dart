import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan/models/barrier.dart';
import 'package:qr_scan/models/user.dart';
import 'package:qr_scan/repositories/local_repository.dart';
import 'package:qr_scan/repositories/user_repository.dart';
import 'package:qr_scan/utils/constanst/string/app_string.dart';
import 'package:qr_scan/utils/routes/name_routes.dart';

class BarrierCubit extends Cubit<Barrier> {
  BarrierCubit() : super(Barrier(name: 'Barrier #1', status: AppString.close)) {
    Timer.periodic(
      const Duration(seconds: 30),
      (Timer t) async {
        debugPrint(state.status);

        // MainRepository mainRepository = MainRepository();
        // String? status = await mainRepository.getBarrierStatus(state.name);
        // if (status != null) {
        //   emit(
        //     Barrier(
        //       name: state.name,
        //       status: status,
        //     ),
        //   );
        // }
      },
    );
  }

  User? user = UserRepository.user;

  void closeBarrier() {
    // MainRepository mainRepository = MainRepository();
    // mainRepository.putStatusBarrier(state.name, AppString.close);
    emit(
      Barrier(
        name: state.name,
        status: AppString.close,
      ),
    );
  }

  void openBarrier() {
    // MainRepository mainRepository = MainRepository();
    // mainRepository.putStatusBarrier(state.name, AppString.open);
    emit(
      Barrier(
        name: state.name,
        status: AppString.open,
      ),
    );
  }

  void exitUser(BuildContext context) {
    final localRepository = LocalRepository();
    localRepository.removeUser();
    Navigator.of(context).pushReplacementNamed(NameRoutes.signUp);
  }

  String getLoginUser() {
    if (user == null || user!.login == '') {
      return AppString.loginIsNotFound;
    } else {
      return user!.login;
    }
  }

  File? getImage() {
    if (user == null || user!.imagePath == '') {
      return null;
    } else {
      return File(user!.imagePath!);
    }
  }
}
