import 'package:flutter/material.dart';
import '../../../common/domain/entity/user_entity.dart';
import 'shimmer_user_card.dart';
import 'user_card.dart';

class UsersList extends StatelessWidget {
  final List<UserEntity> users;

  const UsersList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: users.isEmpty
          ? List.generate(6, (index) => const ShimmerUserCard())
          : List.generate(users.length, (index) => UserCard(user: users[index])),
    );
  }
}
