import 'package:dressed_up/presentation/screens/login/login_screen.dart';
import 'package:dressed_up/presentation/screens/main/main_screen.dart';
import 'package:dressed_up/presentation/screens/register/register_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  final GoRouter router = GoRouter(initialLocation: "/login",routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => const MainScreen(),
    ),

  ]);
}