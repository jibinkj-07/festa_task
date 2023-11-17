import 'package:either_dart/either.dart';
import '../../../../core/utils/error/failure.dart';
import '../repo/auth_repo.dart';

class SignOutUser {
  final AuthRepo _authRepo;

  SignOutUser(this._authRepo);

  Future<Either<Failure, bool>> call() async => await _authRepo.signOutUser();
}
