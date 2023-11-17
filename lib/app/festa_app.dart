import 'package:flutter/material.dart';
import '../core/config/routes/app_routes.dart';
import '../core/config/theme/app_theme.dart';

class FestaApp extends StatelessWidget {
  const FestaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festa',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.root,
      onGenerateRoute: GenerateAppRoutes.generateRoute,
    );
  }
}
