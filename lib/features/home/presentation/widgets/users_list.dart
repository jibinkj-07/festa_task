import 'package:flutter/material.dart';
import '../../../common/domain/entity/user_entity.dart';
import 'shimmer_user_card.dart';
import 'user_card.dart';

class UsersList extends StatelessWidget {
  final List<UserEntity> users;
  final bool isTab;

  const UsersList({Key? key, required this.users, required this.isTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTab ? 2 : 1,
        childAspectRatio: isTab ? 1 / .9 : 1 / .75,
      ),
      children: users.isEmpty
          ? List.generate(6, (index) => const ShimmerUserCard())
          : List.generate(users.length,
              (index) => UserCard(user: users[index], isTab: isTab)),
    );
  }
}
