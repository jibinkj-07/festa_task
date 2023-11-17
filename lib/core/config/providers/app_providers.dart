import '../../../features/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../features/auth/presentation/provider/auth_provider.dart';
import '../injection/injection_container.dart';

class AppProviders {
  static List<SingleChildWidget> get() => [
        ChangeNotifierProvider<AuthProvider>(create: (_) => sl<AuthProvider>()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => sl<HomeProvider>()),
      ];
}
