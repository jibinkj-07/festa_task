import 'dart:developer';
import 'package:either_dart/either.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/utils/error/exceptions.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/auth_api_data_source.dart';
import '../data_source/auth_local_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthLocalDataSource _localDataSource;
  final AuthApiDataSource _apiDataSource;
  final InternetConnectionChecker _internetConnectionChecker;

  AuthRepoImpl(
    this._localDataSource,
    this._apiDataSource,
    this._internetConnectionChecker,
  );

  @override
  Future<Either<Failure, UserEntity>> getLoggedUser() async {
    try {
      return Right(await _localDataSource.getLoggedUser());
    } on CacheException {
      return Left(Failure(message: "No user found in cache"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return Left(Failure(message: "Check your internet connection"));
    }

    try {
      final user = await _apiDataSource.loginUser(email: email, password: password);
      await _localDataSource.storeLoggedUser(user: user);
      return Right(user);
    } on APIFetchException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> signOutUser() async {
    try {
      await _localDataSource.clearCache();
      return const Right(true);
    } catch (e) {
      log("Error signOutUser $e");
      return Left(Failure(message: "Something went wrong. Try again"));
    }
  }
}
