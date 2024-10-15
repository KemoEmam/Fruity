import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final logger = getIt<Logger>();

  // Method to create a user with email and password (Sign up)
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w(
          'Exception in FirebaseAuthService.createUserWithEmailAndPassword: $e and code is:${e.code}');
      throw _mapFirebaseAuthException(e, AuthAction.signup);
    } catch (e) {
      logger.w(
          'Exception in FirebaseAuthService.createUserWithEmailAndPassword: $e');
      throw CustomExceptions(
        message: S.current.authErrorUnexpected,
      );
    }
  }

  // Method to sign in with email and password
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.w(
          'Exception in FirebaseAuthService.signInWithEmailAndPassword: $e and code is:${e.code}');
      throw _mapFirebaseAuthException(e, AuthAction.signin);
    } catch (e) {
      logger
          .w('Exception in FirebaseAuthService.signInWithEmailAndPassword: $e');
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
        message: S.current.authErrorSignOut,
      );
    } catch (e) {
      logger.w('Exception in FirebaseAuthService.signOut: $e');
      throw CustomExceptions(
        message: S.current.authErrorUnexpected,
      );
    }
  }

  // Method to sign in with Google
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  // Method to sign in with Facebook
  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        // Get the access token and sign in with Facebook credential
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );

        // Sign in with the credential and return the authenticated user
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        return userCredential.user!;
      } else {
        // Handle login failure scenarios
        throw Exception(
            'Facebook login failed with status: ${loginResult.status}');
      }
    } catch (e) {
      // Log or rethrow the exception
      logger.w('Exception in FirebaseAuthService.signInWithFacebook: $e');
      throw CustomExceptions(message: 'Facebook login failed: $e');
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
        return CustomExceptions(message: S.current.authErrorSignInvalidEmail);
      case 'network-request-failed':
        return CustomExceptions(
            message: S.current.authErrorNetworkRequestFailed);
      default:
        return CustomExceptions(message: S.current.authErrorCreatingAccount);
    }
  }

  CustomExceptions _handleSigninErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return CustomExceptions(message: S.current.authErrorUserNotFound);
      case 'wrong-password':
        return CustomExceptions(
            message: S.current.authErrorInvalidEmailOrPassword);
      case 'invalid-email':
        return CustomExceptions(message: S.current.authErrorSignInvalidEmail);
      case 'invalid-credential':
        return CustomExceptions(
            message: S.current.authErrorInvalidEmailOrPassword);
      case 'too-many-requests':
        return CustomExceptions(message: S.current.authErrorTooManyRequests);
      case 'network-request-failed':
        return CustomExceptions(
            message: S.current.authErrorNetworkRequestFailed);
      default:
        return CustomExceptions(message: S.current.authErrorSigningIn);
    }
  }
}

enum AuthAction { signup, signin, signout }
