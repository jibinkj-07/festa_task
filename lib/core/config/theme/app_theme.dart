import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';
import '../routes/custom_page_transition.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    fontFamily: 'Poppins',
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      },
    ),
  );
}
