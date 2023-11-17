import 'package:flutter/material.dart';
import '../core/config/theme/app_theme.dart';

class ErrorApp extends StatelessWidget {
  final String error;

  const ErrorApp({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festa',
      theme: AppTheme.theme,
      home: Scaffold(
        body: Center(child: Text('Something went wrong\nContact admin or restart app\n$error')),
      ),
    );
  }
}
