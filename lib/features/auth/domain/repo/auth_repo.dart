import 'package:either_dart/either.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> getLoggedUser();

  Future<Either<Failure, UserEntity>> loginUser({required String email, required String password});

  Future<Either<Failure, bool>> signOutUser();
}
