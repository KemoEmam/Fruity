import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';
import 'package:fruity/generated/l10n.dart'; // For localization

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Method to create a user with email and password (Sign up)
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e, AuthAction.signup);
    } catch (e) {
      throw CustomExceptions(
        message: S.current.authErrorUnexpected, // Localized error message
      );
    }
  }

  // Method to sign in with email and password
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e, AuthAction.signin);
    } catch (e) {
      throw CustomExceptions(
        message: S.current.authErrorUnexpected,
      );
    }
  }

  // Method to sign out the user
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException {
      throw CustomExceptions(
        message: S.current.authErrorSignOut, // Localized error message
      );
    } catch (e) {
      throw CustomExceptions(
        message: S.current.authErrorUnexpected,
      );
    }
  }

  // Centralized method for error handling
  CustomExceptions _mapFirebaseAuthException(
      FirebaseAuthException e, AuthAction action) {
    switch (action) {
      case AuthAction.signup:
        return _handleSignupErrors(e);
      case AuthAction.signin:
        return _handleSigninErrors(e);
      case AuthAction.signout:
        return CustomExceptions(message: S.current.authErrorSignOut);
      default:
        return CustomExceptions(message: S.current.authErrorUnexpected);
    }
  }

  CustomExceptions _handleSignupErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CustomExceptions(message: S.current.authErrorWeakPassword);
      case 'email-already-in-use':
        return CustomExceptions(message: S.current.authErrorEmailAlreadyInUse);
      case 'invalid-email':
        return CustomExceptions(message: S.current.authErrorInvalidEmail);
      default:
        return CustomExceptions(
            message: S.current.authErrorErrorCreatingAccount);
    }
  }

  CustomExceptions _handleSigninErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return CustomExceptions(message: S.current.authErrorUserNotFound);
      case 'wrong-password':
        return CustomExceptions(message: S.current.authErrorWrongPassword);
      case 'invalid-email':
        return CustomExceptions(message: S.current.authErrorInvalidEmail);
      case 'too-many-requests':
        return CustomExceptions(message: S.current.authErrorTooManyRequests);
      default:
        return CustomExceptions(message: S.current.authErrorSigningIn);
    }
  }
}

enum AuthAction { signup, signin, signout }
