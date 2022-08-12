import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan/ui/pages/barrier/barrier_page.dart';
import 'package:qr_scan/ui/pages/barrier/cubit/barrier_cubit.dart';
import 'package:qr_scan/ui/pages/qr/qr_page.dart';
import 'package:qr_scan/ui/pages/qr_scan/qr_scan_page.dart';
import 'package:qr_scan/ui/pages/route_page/route_page.dart';
import 'package:qr_scan/ui/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:qr_scan/ui/pages/sign_up/sign_up_page.dart';

void main() => runApp(
      const App(),
    );

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => const RoutePage(),
        '/sign up': (_) => BlocProvider(
              create: (_) => SignUpCubit(),
              child: const SignUpPage(),
            ),
        '/qr': (_) => const QrPage(),
        '/qr scan': (_) => const QRViewExample(),
        '/barrier': (_) => BlocProvider(
              create: (_) => BarrierCubit(),
              child: const BarrierPage(),
            ),
      },
    );
  }
}
