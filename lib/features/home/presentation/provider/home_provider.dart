import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../../domain/use_case/get_users.dart';

class HomeProvider extends ChangeNotifier {
  final GetUsers _getUsers;

  HomeProvider(this._getUsers);

  List<UserEntity> _usersFromApi = [];
  List<UserEntity> _users = [];

  List<UserEntity> get users => _users;

  void filter(String gender) {
    if (gender.isEmpty) {
      users = List.from(_usersFromApi);
    } else {
      users = List.from(_usersFromApi.where((element) => element.gender == gender.toLowerCase()).toList());
    }
  }

  set users(List<UserEntity> users) {
    _users = users;
    notifyListeners();
  }

  // ******************** USE CASE ************************
  Future<Either<Failure, List<UserEntity>>> getUsers({required String gender, required int count}) async {
    final response = await _getUsers.call(params: GetUsersParam(gender: gender, count: count));
    if (response.isRight) {
      _usersFromApi = response.right;
      users = List.from(_usersFromApi);
    }
    if (response.isLeft) users = [];
    return response;
  }
}
