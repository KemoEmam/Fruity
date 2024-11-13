import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/core/errors/failure.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  // Auth methods
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future<Either<Failure, UserEntity>> signInWithApple();
//reset password button
  Future<void> resetPasswordWithEmail(String email);

  Future<void> deleteUser(User? user);

  // Future<void> addUserData({required UserEntity user});

  //getUserData
  // Future<UserEntity> getUserData({required String uId});

  //checkIfDataExists
  // Future<bool> checkIfUserExists({required String path, required String docId});
}
