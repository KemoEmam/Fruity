import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/constants.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';
import 'package:fruity/core/errors/failure.dart';
import 'package:fruity/core/services/database_service.dart';
import 'package:fruity/core/services/firebase_auth_service.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/core/services/shared_prefs_service.dart';
import 'package:fruity/core/utils/backend_endpoints.dart';
import 'package:fruity/features/auth/data/models/user_model.dart';
import 'package:fruity/features/auth/domain/entities/user_entity.dart';
import 'package:fruity/features/auth/domain/repos/auth_repo.dart';
import 'package:fruity/generated/l10n.dart';
import 'package:logger/logger.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  final logger = getIt<Logger>();
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      // var userEntity = UserModel.fromFirebaseUser(user);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      logger.w('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return left(ServerFailure(message: S.current.authErrorUnexpected));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      logger.w('Exception in AuthRepoImpl.signInWithEmailAndPassword: $e');
      return left(ServerFailure(message: S.current.authErrorUnexpected));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await checkIfUserExists(
          path: BackendEndpoints.checkIfUserExists, docId: user.uid);
      if (isUserExists) {
        await getUserData(uId: user.uid);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      logger.w('Exception in AuthRepoImpl.signInWithGoogle: $e');
      return left(ServerFailure(message: S.current.authErrorUnexpected));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await checkIfUserExists(
          path: BackendEndpoints.checkIfUserExists, docId: user.uid);
      if (isUserExists) {
        await getUserData(uId: user.uid);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      logger.w('Exception in AuthRepoImpl.signInWithFacebook: $e');
      return left(ServerFailure(message: S.current.authErrorUnexpected));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      var user = await firebaseAuthService.signInWithApple();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      logger.w('Exception in AuthRepoImpl.signInWithApple: $e');
      return left(ServerFailure(message: S.current.authErrorUnexpected));
    }
  }

//reset password with email with errors handling
  @override
  Future<void> resetPasswordWithEmail(String email) async {
    try {
      await firebaseAuthService.resetPasswordWithEmail(email);
    } on CustomExceptions catch (e) {
      logger
          .w('Exception in AuthRepoImpl.resetPasswordWithEmail: ${e.message}');
      rethrow;
    } catch (e) {
      logger
          .w('Unexpected exception in AuthRepoImpl.resetPasswordWithEmail: $e');
      throw CustomExceptions(message: S.current.authErrorUnexpected);
    }
  }

  @override
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

//CRUD operations
  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      docId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var data = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      docId: uId,
    );
    return UserModel.fromMap(data);
  }

  @override
  Future<bool> checkIfUserExists(
      {required String path, required String docId}) async {
    return await databaseService.checkIfDataExists(path: path, docId: docId);
  }

  @override
  Future<UserEntity> saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await PrefsService.setString(kUserData, jsonData);
    return user;
  }
}
