import 'package:either_dart/either.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/utils/error/exceptions.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_api_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiDataSource _apiDataSource;
  final InternetConnectionChecker _internetConnectionChecker;

  HomeRepoImpl(this._apiDataSource, this._internetConnectionChecker);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers({
    required String gender,
    required int count,
  }) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return Left(Failure(message: "Check your network connection"));
    }
    try {
      return Right(await _apiDataSource.getUsers(gender: gender, count: count));
    } on APIFetchException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
