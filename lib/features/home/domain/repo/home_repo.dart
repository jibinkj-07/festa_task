import 'package:either_dart/either.dart';
import '../../../../core/utils/error/failure.dart';
import '../../../common/domain/entity/user_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UserEntity>>> getUsers({required String gender, required int count});
}
