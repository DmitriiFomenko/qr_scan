import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan/ui/pages/barrier/barrier_page.dart';
import 'package:qr_scan/ui/pages/barrier/cubit/barrier_cubit.dart';
import 'package:qr_scan/ui/pages/qr/qr_page.dart';
import 'package:qr_scan/ui/pages/qr_scan/qr_scan_page.dart';
import 'package:qr_scan/ui/pages/route_page/route_page.dart';
import 'package:qr_scan/ui/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:qr_scan/ui/pages/sign_up/sign_up_page.dart';
import 'package:qr_scan/utils/routes/name_routes.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NameRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const RoutePage(),
        );
      case NameRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SignUpCubit(),
            child: const SignUpPage(),
          ),
        );
      case NameRoutes.qr:
        return MaterialPageRoute(
          builder: (_) => const QrPage(),
        );
      case NameRoutes.qrScan:
        return MaterialPageRoute(
          builder: (_) => const QRViewExample(),
        );
      case NameRoutes.barrier:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BarrierCubit(),
            child: const BarrierPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const RoutePage(),
        );
    }
  }
}
