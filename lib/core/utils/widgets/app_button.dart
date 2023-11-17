import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Widget? child;
  final double? radius;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
    this.textColor,
    this.radius,
    this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: color??AppColors.primaryColor,
        foregroundColor: textColor??Colors.white,
        disabledBackgroundColor: disabledColor ?? Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 50.0),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
