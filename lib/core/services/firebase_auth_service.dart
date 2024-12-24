import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruity/core/errors/custom_exceptions.dart';
import 'package:fruity/core/services/service_locator.dart';
import 'package:fruity/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final logger = getIt<Logger>();

  // Delete user account
  Future deleteUser() async {
    try {
      await _firebaseAuth.currentUser!.delete();
    } catch (e) {
      logger.w('Exception in FirebaseAuthService.deleteUser: $e');
      throw CustomExceptions(
        message: S.current.authErrorUnexpected,
      );
    }
  }

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

  // Reset password method with error handling using enums
  Future<void> resetPasswordWithEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      logger.w('Exception in FirebaseAuthService.resetPasswordWithEmail: $e');
      throw _mapFirebaseAuthException(e, AuthAction.resetPassword);
    } catch (e) {
      logger.w('Exception in FirebaseAuthService.resetPasswordWithEmail: $e');
      throw CustomExceptions(message: S.current.authErrorUnexpected);
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

  // Method to sign out the user with error handling
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      logger.w('Exception in FirebaseAuthService.signOut: $e');
      throw _mapFirebaseAuthException(e, AuthAction.signout);
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
        // Handle login failure with a localized message
        throw Exception(
          '${S.current.authErrorUnexpected} - ${loginResult.status}',
        );
      }
    } catch (e) {
      // Log or rethrow the exception with a localized message
      logger.w('Exception in FirebaseAuthService.signInWithFacebook: $e');
      throw CustomExceptions(
        message: '${S.current.authErrorUnexpected}: $e',
      );
    }
  }

//TODO:signin with apple not ready tested

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
        .user!;
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  // Centralized method for error handling using AuthAction enum
  CustomExceptions _mapFirebaseAuthException(
      FirebaseAuthException e, AuthAction action) {
    switch (action) {
      case AuthAction.signup:
        return _handleSignupErrors(e);
      case AuthAction.signin:
        return _handleSigninErrors(e);
      case AuthAction.resetPassword:
        return _handleResetPasswordErrors(e);
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

  CustomExceptions _handleResetPasswordErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return CustomExceptions(message: S.current.authErrorSignInvalidEmail);
      case 'user-not-found':
        return CustomExceptions(message: S.current.passwordEmaildoesntexist);
      case 'network-request-failed':
        return CustomExceptions(
            message: S.current.authErrorNetworkRequestFailed);
      default:
        return CustomExceptions(message: S.current.passwordErrorReset);
    }
  }
}

enum AuthAction { signup, signin, signout, resetPassword }
