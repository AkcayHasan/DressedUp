import 'package:dressed_up/core/di/di_setup.dart';
import 'package:dressed_up/internal/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await setup();
  runApp(const DressedUpApp());
}

class DressedUpApp extends StatefulWidget {
  const DressedUpApp({super.key});

  @override
  State<DressedUpApp> createState() => _DressedUpAppState();
}

class _DressedUpAppState extends State<DressedUpApp> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = GetIt.I<AppRouter>();


    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.router,
    );
  }
}
