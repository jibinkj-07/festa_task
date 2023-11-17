import 'dart:developer';

import 'package:festa_task/core/config/routes/app_routes.dart';
import 'package:festa_task/core/utils/widgets/custom_snackbar.dart';
import 'package:festa_task/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/mixin/validation_mixin.dart';
import '../../../../core/utils/styles/app_font.dart';
import '../../../../core/utils/widgets/app_button.dart';
import 'auth_text_field.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void dispose() {
    _isObscure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTab = size.width > 800.0;
    return Container(
      padding: const EdgeInsets.all(25.0),
      height: size.height * .4,
      width: isTab ? size.width * .35 : size.width * .75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Heading
            Text("Login", style: AppFont.headingSemiBoldLarge(color: AppColors.primaryColor)),
            // Email
            AuthTextField(
              textFieldKey: "email",
              isObscure: false,
              hintText: "email",
              icon: const Icon(Icons.email_rounded),
              inputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              inputType: TextInputType.emailAddress,
              validator: validateEmail,
              onSaved: (value) => _email = value.toString().trim(),
            ),
            // Password
            ValueListenableBuilder<bool>(
              valueListenable: _isObscure,
              builder: (ctx, obscure, Widget? child) {
                return AuthTextField(
                  textFieldKey: 'password',
                  isObscure: obscure,
                  icon: const Icon(Icons.lock),
                  validator: validatePassword,
                  onSaved: (value) => _password = value.toString().trim(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      _isObscure.value = !_isObscure.value;
                    },
                  ),
                  hintText: 'password',
                  inputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                );
              },
            ),
            // Login button
            ValueListenableBuilder(
              valueListenable: _loading,
              builder: (ctx, loading, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: SizedBox(
                    width: isTab ? size.width * .25 : size.width * .6,
                    child: AppButton(
                      onPressed: loading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                FocusScope.of(context).unfocus();
                                _loading.value = true;
                                HapticFeedback.mediumImpact();
                                Provider.of<AuthProvider>(context, listen: false)
                                    .login(email: _email, password: _password)
                                    .then((value) {
                                  if (value.isLeft) {
                                    _loading.value = false;
                                    CustomSnackBar.showErrorSnackBar(context, value.left.message);
                                  } else {
                                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
                                  }
                                });
                              }
                            },
                      child: Text(loading ? "AUTHENTICATING" : "LOGIN"),
                    ),
                  ),
                );
              },
            ),
            // Google sign in button
            ValueListenableBuilder(
              valueListenable: _loading,
              builder: (ctx, loading, child) {
                return SizedBox(
                  width: isTab ? size.width * .25 : size.width * .6,
                  child: OutlinedButton.icon(
                    onPressed: loading ? null : () => CustomSnackBar.showInfoSnackBar(context, "Currently unavailable"),
                    icon: SvgPicture.asset(
                      "assets/svg/google.svg",
                      width: 20.0,
                      height: 20.0,
                      colorFilter: ColorFilter.mode(
                        loading ? Colors.grey : AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: const Text("Sign in with Google"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
