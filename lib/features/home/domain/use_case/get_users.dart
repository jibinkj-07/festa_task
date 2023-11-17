import 'package:either_dart/either.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../repo/home_repo.dart';

class GetUsers implements UseCase<List<UserEntity>, GetUsersParam> {
  final HomeRepo _homeRepo;

  GetUsers(this._homeRepo);

  @override
  Future<Either<Failure, List<UserEntity>>> call({
    required GetUsersParam params,
  }) async =>
      await _homeRepo.getUsers(gender: params.gender, count: params.count);
}

class GetUsersParam {
  final String gender;
  final int count;

  GetUsersParam({required this.gender, required this.count});
}
