import 'package:flutter/material.dart';
import 'package:qr_scan/models/user.dart';
import 'package:qr_scan/repositories/local_repository.dart';
import 'package:qr_scan/repositories/user_repository.dart';
import 'package:qr_scan/utils/constanst/app_color.dart';
import 'package:qr_scan/utils/routes/name_routes.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  Future<String> firstPage(BuildContext context) async {
    const LocalRepository localRepository = LocalRepository();
    User? user = await localRepository.loadUser();
    if (user.login == 'Name') {
      return NameRoutes.signUp;
    } else {
      UserRepository.user = user;
      return NameRoutes.barrier;
    }
  }

  @override
  Widget build(BuildContext context) {
    firstPage(context)
        .then((value) => Navigator.of(context).pushReplacementNamed(value));
    return const Scaffold(
      backgroundColor: AppColor.backgroudWhite,
    );
  }
}
