import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../provider/auth_provider.dart';
import '../widget/loading.dart';
import 'login_screen.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return FutureBuilder(
        future: authProvider.getLoggedUser(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isRight) return const HomeScreen();
            return const LoginScreen();
          }
          return const Loading();
        });
  }
}
