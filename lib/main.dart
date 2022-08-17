import 'package:flutter/material.dart';
import 'package:qr_scan/utils/routes/app_router.dart';

//если нужно что-то сделать до запуска (например, GetIt.instance)
void setup() {}

void main() {
  setup();
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
