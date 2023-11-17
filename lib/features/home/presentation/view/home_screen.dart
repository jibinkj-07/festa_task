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
    final isTab = MediaQuery.sizeOf(context).width > 800.0;
    return Scaffold(
      appBar: isTab
          ? null
          : AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.dashboard_rounded),
                    color: Colors.white,
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              actions: [
                FilterAction(filter: _filter,isTab: isTab,),
              ],
            ),
      body: ValueListenableBuilder(
          valueListenable: _error,
          builder: (ctx, error, child) {
            return Row(
              children: [
                if (isTab) Profile(isTab: isTab),
                Expanded(
                  child: error.isNotEmpty
                      ? ErrorScreen(error: error, onRetry: _getUsers)
                      : Consumer<HomeProvider>(
                          builder: (ctx1, homeProvider, _) {
                          return SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (isTab)
                                  Container(
                                    width:150.0,
                                    padding: const EdgeInsets.all(10.0),
                                    child: FilterAction(
                                      filter: _filter,
                                      isTab: isTab,
                                    ),
                                  ),
                                Expanded(
                                  child: UsersList(
                                    users: homeProvider.users,
                                    isTab: isTab,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                )
              ],
            );
          }),
      drawerEnableOpenDragGesture: false,
      drawer: isTab ? null : Profile(isTab: isTab),
    );
  }

  void _getUsers() {
    _error.value = "";
    final context = this.context;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getUsers(gender: "", count: 50).then((value) {
      if (value.isLeft)
        _error.value = value.left.message; // updating to build error screen ui
    });
  }
}
