import 'package:dartz/dartz.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';
import 'package:fruity/core/errors/failure.dart';
import 'package:fruity/core/services/firebase_auth_service.dart';
import 'package:fruity/features/auth/data/models/user_model.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred'));
    }
  }
}
