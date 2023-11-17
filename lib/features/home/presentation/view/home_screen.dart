import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../provider/home_provider.dart';
import '../widgets/error_screen.dart';
import '../widgets/filter_action.dart';
import '../widgets/profile.dart';
import '../widgets/users_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> _error = ValueNotifier("");
  final ValueNotifier<String> _filter = ValueNotifier("");

  @override
  void initState() {
    _getUsers();
    super.initState();
  }

  @override
  void dispose() {
    _error.dispose();
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.dashboard_rounded),
              color: Colors.white,
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          FilterAction(filter: _filter),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: _error,
          builder: (ctx, error, child) {
            if (error.isNotEmpty) {
              return ErrorScreen(error: error, onRetry: _getUsers);
            }

            return Consumer<HomeProvider>(builder: (ctx1, homeProvider, _) {
              return UsersList(users: homeProvider.users);
            });
          }),
      drawerEnableOpenDragGesture: false,
      drawer: Profile(),
    );
  }

  void _getUsers() {
    _error.value = "";
    final context = this.context;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getUsers(gender: "", count: 50).then((value) {
      if (value.isLeft) _error.value = value.left.message; // updating to build error screen ui
    });
  }
}
