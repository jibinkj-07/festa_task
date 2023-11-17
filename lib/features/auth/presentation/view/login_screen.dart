import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../widget/login_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: LoginContainer()),
    );
  }
}
