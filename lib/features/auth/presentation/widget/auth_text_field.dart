import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String textFieldKey;
  final bool isObscure;
  final Icon? icon;
  final String hintText;
  final TextInputAction inputAction;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;

  const AuthTextField({
    Key? key,
    required this.textFieldKey,
    required this.isObscure,
    this.icon,
    required this.hintText,
    required this.inputAction,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.inputType,
    required this.textCapitalization,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(key),
      obscureText: isObscure,
      textInputAction: inputAction,
      keyboardType: inputType,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        prefixIcon: icon,
        prefixIconColor: AppColors.primaryColor,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(width: 1.5,color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:const BorderSide(width: 1,color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1,color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1.5,color: Colors.red),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
