import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/error/exceptions.dart';
import '../../../common/data/model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> getLoggedUser();

  Future<void> storeLoggedUser({required UserModel user});

  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreference;

  AuthLocalDataSourceImpl(this._sharedPreference);

  final _user = "USER";

  @override
  Future<UserModel> getLoggedUser() async {
    final userString = _sharedPreference.getString(_user);
    if (userString == null) throw CacheException();
    return UserModel.fromJson(json.decode(userString));
  }

  @override
  Future<void> storeLoggedUser({required UserModel user}) async {
    try {
      await _sharedPreference.setString(_user, json.encode(user.toJson()));
    } catch (e) {
      log("error in storeLoggedUser sp $e");
    }
  }

  @override
  Future<void> clearCache() async {
    await _sharedPreference.remove(_user);
  }
}
