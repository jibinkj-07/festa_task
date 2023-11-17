import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/styles/app_font.dart';
import '../../../common/domain/entity/user_entity.dart';

class UserInfoSlider extends StatelessWidget {
  final UserEntity user;

  UserInfoSlider({Key? key, required this.user}) : super(key: key);

  final List<String> _headings = [
    "Hi, My name is",
    "My email address is",
    "My birthday is",
    "My address is",
    "My phone number is",
  ];
  final List<Widget> _icons = [
    const Icon(Icons.person_rounded),
    const Icon(Icons.mail_rounded),
    const Icon(Icons.calendar_month_rounded),
    const Icon(Icons.map_rounded),
    const Icon(Icons.phone_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .08,
              child: TabBarView(
                children: List.generate(
                  _headings.length,
                  (index) => _infoWidget(heading: _headings[index], info: _getUserInfo(index)),
                ),
              ),
            ),
            TabBar(
              dividerColor: Colors.transparent,
              splashBorderRadius: BorderRadius.circular(50.0),
              tabs: List.generate(_icons.length, (index) => Tab(icon: _icons[index])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget({required String heading, required String info}) {
    return Column(
      children: [
        Text(
          heading,
          style: AppFont.bodyTextLarge(color: Colors.grey),
        ),
        Expanded(
          child: Text(
            info,
            style: AppFont.headingMedium(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  String _getUserInfo(int index) {
    switch (index) {
      case 0:
        return "${user.firstName} ${user.lastName}";
      case 1:
        return user.email;
      case 2:
        return "${user.dob.day}/${user.dob.month}/${user.dob.year}";
      case 3:
        return user.address;
      case 4:
        return user.phone;
      default:
        return "";
    }
  }
}
