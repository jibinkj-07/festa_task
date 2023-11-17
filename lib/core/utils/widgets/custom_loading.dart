import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final double? radius;
  final Color? bgColor;
  final Color? loadingColor;

  const CustomLoading({Key? key, this.radius, this.bgColor, this.loadingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: radius ?? 25.0,
        backgroundColor: bgColor ?? AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Platform.isIOS
              ? const CupertinoActivityIndicator(color: AppColors.primaryColor)
              : CircularProgressIndicator(strokeWidth: 2.0, color: loadingColor ?? Colors.white),
        ),
      ),
    );
  }
}
