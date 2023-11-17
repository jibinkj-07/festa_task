import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app_error.dart';
import 'app/festa_app.dart';
import './core/config/injection/injection_container.dart';
import 'core/config/providers/app_providers.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initDependencies();
    runApp(MultiProvider(providers: AppProviders.get(), child: const FestaApp()));
  } catch (e) {
    runApp(ErrorApp(error: e.toString()));
  }
}
