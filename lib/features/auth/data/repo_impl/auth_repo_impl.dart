import 'package:dartz/dartz.dart';
import 'package:fruity/core/errors/failure.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
