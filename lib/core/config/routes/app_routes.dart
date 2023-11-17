import 'package:flutter/material.dart';
import '../../../features/auth/presentation/view/auth_checker.dart';
import '../../../features/auth/presentation/view/login_screen.dart';
import '../../../features/home/presentation/view/home_screen.dart';
import 'error_route.dart';

class AppRoutes {
  static const String root = '/';
  static const String login = '/login';
  static const String home = '/home_screen';
}

class GenerateAppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(builder: (_) => const AuthChecker());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}
