import 'package:dressed_up/core/di/di_setup.dart';
import 'package:dressed_up/internal/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = GetIt.I<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.router,
    );
  }
}
