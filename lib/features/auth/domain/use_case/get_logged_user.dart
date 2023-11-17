import 'package:either_dart/either.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';
import '../repo/auth_repo.dart';

class GetLoggedUser {
  final AuthRepo _authRepo;

  GetLoggedUser(this._authRepo);

  Future<Either<Failure, UserEntity>> call() async => await _authRepo.getLoggedUser();
}
