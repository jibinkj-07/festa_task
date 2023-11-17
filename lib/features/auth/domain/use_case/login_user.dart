import 'package:either_dart/either.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../repo/auth_repo.dart';

class LoginUser implements UseCase<UserEntity, LoginParam> {
  final AuthRepo _authRepo;

  LoginUser(this._authRepo);

  @override
  Future<Either<Failure, UserEntity>> call({
    required LoginParam params,
  }) async =>
      await _authRepo.loginUser(email: params.email, password: params.password);
}

class LoginParam {
  final String email;
  final String password;

  LoginParam({required this.email, required this.password});
}
