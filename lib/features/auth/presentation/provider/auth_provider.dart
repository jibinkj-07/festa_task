import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../../domain/use_case/get_logged_user.dart';
import '../../domain/use_case/login_user.dart';
import '../../domain/use_case/sign_out_user.dart';

class AuthProvider extends ChangeNotifier {
  final GetLoggedUser _getLoggedUser;
  final LoginUser _loginUser;
  final SignOutUser _signOutUser;

  AuthProvider(this._getLoggedUser, this._loginUser, this._signOutUser);

  UserEntity? _user;

  UserEntity? get authUser => _user;

  set authUser(UserEntity? user) {
    _user = user;
    notifyListeners();
  }

  // **************** USE CASES *******************
  Future<Either<Failure, UserEntity>> getLoggedUser() async {
    final response = await _getLoggedUser.call();
    if (response.isRight) authUser = response.right;
    return response;
  }

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final response = await _loginUser.call(params: LoginParam(email: email, password: password));
    if (response.isRight) authUser = response.right;
    return response;
  }

  Future<Either<Failure, bool>> signOut() async {
    final response = await _signOutUser.call();
    if (response.isRight) authUser = null;
    return response;
  }
}
